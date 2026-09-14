/**
 * Cloudflare Pages Functions Catch-All Middleware
 * Automatically handles Content Negotiation for Cloudflare Pages sites.
 */

import { htmlToMarkdown, estimateTokens } from '../agent-markdown/src/converter.js';
import { prefersMarkdown, isStaticAsset } from '../agent-markdown/src/worker.js';

export async function onRequest(context) {
  const { request, next, waitUntil } = context;
  const url = new URL(request.url);

  // Only GET or HEAD
  if (request.method !== 'GET' && request.method !== 'HEAD') {
    return next();
  }

  // Bypass static asset extensions
  if (isStaticAsset(url.pathname)) {
    return next();
  }

  const accept = request.headers.get('accept') || '';
  const wantsMarkdown = prefersMarkdown(accept);

  // Default browser behavior -> pass through to HTML
  if (!wantsMarkdown) {
    const response = await next();
    const newHeaders = new Headers(response.headers);
    const existingVary = newHeaders.get('vary');
    if (!existingVary) {
      newHeaders.set('vary', 'Accept');
    } else if (!existingVary.toLowerCase().includes('accept')) {
      newHeaders.set('vary', `${existingVary}, Accept`);
    }
    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: newHeaders
    });
  }

  // Agent wants Markdown: fetch normal response first
  // Always fetch GET from origin so we have the HTML to convert and compute token headers
  const originRequest = new Request(request.url, {
    method: 'GET',
    headers: request.headers
  });
  const response = await fetch(originRequest);
  const contentType = response.headers.get('content-type') || '';

  // If not HTML or not ok, return original response
  if (!response.ok || !contentType.includes('text/html')) {
    return response;
  }

  const html = await response.text();
  const markdown = htmlToMarkdown(html);

  const markdownTokens = estimateTokens(markdown);
  const originalTokens = estimateTokens(html);

  const headers = new Headers(response.headers);
  headers.set('content-type', 'text/markdown; charset=utf-8');

  const existingVary = headers.get('vary');
  if (!existingVary) {
    headers.set('vary', 'Accept');
  } else if (!existingVary.toLowerCase().includes('accept')) {
    headers.set('vary', `${existingVary}, Accept`);
  }

  headers.set('x-markdown-tokens', String(markdownTokens));
  headers.set('x-original-tokens', String(originalTokens));

  if (!headers.has('content-signal')) {
    headers.set('content-signal', 'ai-train=yes, search=yes, ai-input=yes');
  }

  headers.delete('content-encoding');
  headers.delete('content-range');
  headers.delete('transfer-encoding');
  headers.delete('etag');
  headers.delete('last-modified');

  const bodyBytes = new TextEncoder().encode(markdown);
  headers.set('content-length', String(bodyBytes.byteLength));

  return new Response(request.method === 'HEAD' ? null : bodyBytes, {
    status: response.status,
    statusText: response.statusText,
    headers
  });
}
