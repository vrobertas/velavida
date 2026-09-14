/**
 * Static Markdown Generator
 * Generates pre-rendered .md mirrors for HTML pages in the project.
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { htmlToMarkdown, estimateTokens } from '../agent-markdown/src/converter.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

const HTML_FILES = [
  'index.html',
  'faq.html',
  'privacy.html',
  'sicily-2026.html',
  'lt/index.html',
  'blog/index.html',
  'blog/sailing-ibiza-formentera-october.html'
];

console.log('🚀 Generating static Markdown mirrors for AI Agents...\n');

let totalOriginalTokens = 0;
let totalMarkdownTokens = 0;

for (const relPath of HTML_FILES) {
  const inputPath = path.join(rootDir, relPath);
  if (!fs.existsSync(inputPath)) {
    console.warn(`⚠️ Skipped: ${relPath} not found`);
    continue;
  }

  const html = fs.readFileSync(inputPath, 'utf8');
  const markdown = htmlToMarkdown(html);

  const outputPath = inputPath.replace(/\.html$/i, '.md');
  fs.writeFileSync(outputPath, markdown, 'utf8');

  const origTokens = estimateTokens(html);
  const mdTokens = estimateTokens(markdown);
  const savings = Math.round(((origTokens - mdTokens) / origTokens) * 100);

  totalOriginalTokens += origTokens;
  totalMarkdownTokens += mdTokens;

  console.log(`✅ ${relPath} -> ${path.relative(rootDir, outputPath)}`);
  console.log(`   Tokens: ${origTokens} HTML -> ${mdTokens} Markdown (${savings}% reduction)`);
}

const overallSavings = Math.round(((totalOriginalTokens - totalMarkdownTokens) / totalOriginalTokens) * 100);
console.log(`\n🎉 Completed! Total tokens: ${totalOriginalTokens} -> ${totalMarkdownTokens} (${overallSavings}% overall token savings)`);
