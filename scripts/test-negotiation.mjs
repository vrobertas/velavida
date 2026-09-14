/**
 * Test Suite for Agent Markdown Content Negotiation
 */

import assert from 'node:assert';
import { prefersMarkdown, isStaticAsset } from '../agent-markdown/src/worker.js';
import { htmlToMarkdown, extractMetadata, extractJsonLd, estimateTokens } from '../agent-markdown/src/converter.js';

console.log('🧪 Running Content Negotiation & Markdown Converter Tests...\n');

let passed = 0;
let failed = 0;

function test(name, fn) {
  try {
    fn();
    console.log(`  ✅ PASS: ${name}`);
    passed++;
  } catch (err) {
    console.error(`  ❌ FAIL: ${name}`);
    console.error(err);
    failed++;
  }
}

// 1. Content Negotiation Priority Tests (RFC 9110 & Cloudflare spec)
console.log('1. Content Negotiation Logic:');

test('Explicit text/markdown returns true', () => {
  assert.strictEqual(prefersMarkdown('text/markdown'), true);
});

test('text/markdown with lower html priority returns true', () => {
  assert.strictEqual(prefersMarkdown('text/markdown, text/html;q=0.9'), true);
});

test('text/markdown with equal priority to html returns true', () => {
  assert.strictEqual(prefersMarkdown('text/markdown;q=0.9, text/html;q=0.9'), true);
});

test('text/markdown with lower priority than html returns false', () => {
  assert.strictEqual(prefersMarkdown('text/html, text/markdown;q=0.5'), false);
});

test('Wildcard text/* returns true if html not explicitly prioritized', () => {
  assert.strictEqual(prefersMarkdown('text/*'), true);
});

test('Wildcard */* (standard browser) returns false', () => {
  assert.strictEqual(prefersMarkdown('*/*'), false);
});

test('Standard Chrome Accept header returns false', () => {
  assert.strictEqual(
    prefersMarkdown('text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'),
    false
  );
});

test('Empty or null accept header returns false', () => {
  assert.strictEqual(prefersMarkdown(''), false);
  assert.strictEqual(prefersMarkdown(null), false);
});

// 2. Static Asset Filter Tests
console.log('\n2. Static Asset Bypass:');

test('Static images, css, and js are bypassed', () => {
  assert.strictEqual(isStaticAsset('/images/hero.webp'), true);
  assert.strictEqual(isStaticAsset('/css/styles.css'), true);
  assert.strictEqual(isStaticAsset('/js/main.js'), true);
  assert.strictEqual(isStaticAsset('/video.mp4'), true);
});

test('HTML pages and directory paths are not bypassed', () => {
  assert.strictEqual(isStaticAsset('/'), false);
  assert.strictEqual(isStaticAsset('/index.html'), false);
  assert.strictEqual(isStaticAsset('/faq.html'), false);
  assert.strictEqual(isStaticAsset('/sicily-2026'), false);
});

// 3. HTML-to-Markdown & Metadata Tests
console.log('\n3. HTML to Markdown Engine:');

const sampleHtml = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Vela Vida Sails - Ibiza Flotilla 2026</title>
  <meta name="description" content="Community sailing catamaran holiday in Ibiza and Formentera.">
  <meta property="og:image" content="https://www.velavidasails.com/images/hero.jpg">
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Product",
    "name": "Ibiza Flotilla 2026",
    "offers": {
      "@type": "Offer",
      "price": "890",
      "priceCurrency": "EUR"
    }
  }
  </script>
</head>
<body>
  <header>
    <nav><a href="/">Home</a><a href="/faq">FAQ</a></nav>
  </header>
  <main>
    <h1>The Core Experience</h1>
    <p>Join our catamaran flotilla in <strong>Ibiza</strong>.</p>
    <ul>
      <li>Dates: October 10–17, 2026</li>
      <li>Price: €890</li>
    </ul>
  </main>
  <footer>
    <p>© 2026 Vela Vida. All rights reserved.</p>
  </footer>
</body>
</html>
`;

test('Metadata extracted correctly into frontmatter', () => {
  const meta = extractMetadata(sampleHtml);
  assert.strictEqual(meta.title, 'Vela Vida Sails - Ibiza Flotilla 2026');
  assert.strictEqual(meta.description, 'Community sailing catamaran holiday in Ibiza and Formentera.');
  assert.strictEqual(meta.image, 'https://www.velavidasails.com/images/hero.jpg');
});

test('JSON-LD preserved as formatted code block', () => {
  const jsonLd = extractJsonLd(sampleHtml);
  assert.strictEqual(jsonLd.length, 1);
  assert.ok(jsonLd[0].includes('"Ibiza Flotilla 2026"'));
});

test('Markdown conversion includes YAML frontmatter, clean body, and JSON-LD block', () => {
  const md = htmlToMarkdown(sampleHtml);

  // Check YAML Frontmatter
  assert.ok(md.startsWith('---\n'));
  assert.ok(md.includes('title: "Vela Vida Sails - Ibiza Flotilla 2026"'));
  assert.ok(md.includes('description: "Community sailing catamaran holiday in Ibiza and Formentera."'));

  // Check stripped content: nav and footer should be gone
  assert.ok(!md.includes('Home</a>'));
  assert.ok(!md.includes('© 2026 Vela Vida'));

  // Check body content converted
  assert.ok(md.includes('# The Core Experience'));
  assert.ok(md.includes('**Ibiza**'));
  assert.ok(md.includes('- Dates: October 10–17, 2026'));

  // Check JSON-LD code block
  assert.ok(md.includes('```json'));
  assert.ok(md.includes('"price": "890"'));
});

test('Token estimation produces sensible non-zero numbers', () => {
  const tokens = estimateTokens('Hello world! This is a test for token estimation.');
  assert.ok(tokens > 5 && tokens < 20);
});

console.log(`\n-----------------------------------------`);
console.log(`Results: ${passed} passed, ${failed} failed`);

if (failed > 0) {
  process.exit(1);
} else {
  console.log('🎉 All content negotiation tests passed successfully!\n');
}
