# Agent Markdown Content Negotiation

A production-ready, reusable implementation of the [Cloudflare Markdown for Agents](https://developers.cloudflare.com/fundamentals/reference/markdown-for-agents/) specification and [isitagentready.com](https://isitagentready.com/) requirements.

It enables AI web crawlers and autonomous agents to request clean, structured Markdown via HTTP content negotiation (`Accept: text/markdown`), while preserving full HTML for regular browsers.

---

## Key Features

1. **Standard RFC 9110 Content Negotiation:**
   - `Accept: text/markdown` &rarr; Returns clean Markdown
   - `Accept: text/markdown, text/html;q=0.9` &rarr; Returns Markdown (higher priority)
   - `Accept: text/*` &rarr; Returns Markdown
   - `Accept: */*` or browser defaults &rarr; Returns original HTML
2. **Metadata to YAML Frontmatter:**
   - Automatically extracts `<title>`, `<meta name="description">`, and `<meta property="og:image">`.
3. **JSON-LD Structured Data Preservation:**
   - Extracts `<script type="application/ld+json">` tags and appends them inside a fenced ````json```` block at the end of the document.
4. **Boilerplate Stripping:**
   - Removes navigation (`<nav>`), headers, footers, script tags, style tags, SVG icon noise, and dialog modals.
5. **Token Metrics & Headers:**
   - Sets `Content-Type: text/markdown; charset=utf-8`
   - Sets `Vary: Accept` (critical for edge cache separation)
   - Calculates `x-markdown-tokens` and `x-original-tokens`
   - Sets `Content-Signal: ai-train=yes, search=yes, ai-input=yes`

---

## Deployment Options

### Option 1: Cloudflare Pages (Zero Config)
If your site is deployed via Cloudflare Pages:
1. The [`functions/[[path]].js`](../functions/[[path]].js) file in the root is automatically detected by Cloudflare Pages.
2. Every request is inspected for `Accept: text/markdown`.
3. Done! No additional configuration needed.

### Option 2: Cloudflare Worker (Any Cloudflare Plan, including Free)
1. Install Wrangler if not already installed:
   ```bash
   npm install -g wrangler
   ```
2. Navigate to `agent-markdown/`:
   ```bash
   cd agent-markdown
   ```
3. Uncomment and edit the `routes` block in `wrangler.toml`:
   ```toml
   routes = [
     { pattern = "www.velavidasails.com/*", zone_name = "velavidasails.com" }
   ]
   ```
4. Deploy the worker:
   ```bash
   wrangler deploy
   ```

### Option 3: Cloudflare Dashboard Native Toggle (Pro / Business / Enterprise)
If your zone is subscribed to Cloudflare Pro, Business, or Enterprise:
1. Log in to [Cloudflare Dashboard](https://dash.cloudflare.com/).
2. Select your domain (`velavidasails.com`).
3. Go to **AI Crawl Control** or **Rules > Configuration Rules**.
4. Enable **Markdown for Agents**.

---

## Verification & Testing

Test your local or live server with curl:

```bash
# Test 1: Agent requests Markdown
curl -i -H "Accept: text/markdown" https://www.velavidasails.com/

# Test 2: Standard browser requests HTML
curl -i https://www.velavidasails.com/

# Test 3: Run automated test suite
node scripts/test-negotiation.mjs
```

Validate with the online scanner:
```bash
curl -X POST https://isitagentready.com/api/scan \
  -H "Content-Type: application/json" \
  -d '{"url": "https://www.velavidasails.com"}'
```
Ensure `checks.contentAccessibility.markdownNegotiation.status` is `"pass"`.
