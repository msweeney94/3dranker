# 3DRanker — Roadmap & Handoff Notes

Purpose: hand this to another Claude session (or dev) to do the bigger structural work,
so it doesn't burn API usage here. Everything needed is already in the GitHub repo.

**Repo:** https://github.com/msweeney94/3dranker
**Live site:** https://singular-stroopwafel-caf984.netlify.app/
**Host:** Netlify (auto-deploys on push to `main`). No build step — it serves `index.html` directly.

---

## Where things are (pull these from the repo)

- `index.html` — the entire site. All markup, CSS, JS, AND the data.
  - Printer data is one line: `const DATA = {"printers":[ ... ]};` (40 printers)
  - Filament data is one line: `const FDATA = {"brands":[ ... ]};` (10 brands)
- `EDITING-GUIDE.md` — plain-English guide for hand-editing prices/specs/images.
- `RESTORE.md` — how to recover the golden version if something breaks.
- `.backups/` — a saved copy of the known-good site.
- Golden restore points: git tag `good-v1-40printers`, branch `stable-40printers`.

Each printer record shape:
`name, brand, slug, image, price, price_range, buy_url, scores{6}, specs{9}, features{10}`

Each filament record shape:
`slug, name, logo, founded, origin, scores{7}, avg_price_pla, rfid, spool_material, materials[], notes`

---

## Staged plan

### Step 0 — Split data out of index.html (safe, do first)
- Extract `DATA.printers` → `data/printers.json`, `FDATA.brands` → `data/filaments.json`.
- Have `index.html` `fetch()` those two files on load instead of inlining them.
- Win: a JSON typo can no longer blank the whole page; data is now in "import-ready" shape.
- Keep it zero-build; still deploys on Netlify as-is.

### Step 1 — Move data to a database (when editing JSON gets annoying, ~80+ printers)
- Use **Supabase (Postgres)**. Free tier is plenty.
- Normalize: `brands`, `printers` (FK to brands), `filament_brands`.
  Future tables: `price_history`, `reviews`, `users`.
- Import the two JSON files into the tables (Supabase has JSON/CSV import, or a small seed script).
- Point the site at Supabase's read API (public anon key, read-only via row-level security).
- Editing now happens in the Supabase dashboard (spreadsheet-style) — no git commits for data.

### Step 2 — Pro frontend (when you want SEO pages / search / reviews)
- Rebuild on **Astro** (simpler than React, ships almost no JS, great for data/content sites).
- Pre-render a real page per printer: `/printers/<slug>` → each indexed by Google (big SEO win).
- Server-backed search / brand filters / sorting (scales past 200+ records).
- Still hosts on Netlify or Vercel; auto-deploy from GitHub.

### Step 3 — Admin + images (quality-of-life)
- Small password-protected `/admin` page to add/edit printers from your phone (writes to Supabase).
- Store printer photos in **Supabase Storage** (or Cloudinary) so images don't 404 later.

---

## Key facts / gotchas for whoever picks this up

- **No build step today.** Don't reintroduce a `build.sh` that regenerates `index.html` — that caused repeated blank-page regressions. If a build step is added (Astro), it must fully replace the single-file approach, not overwrite it piecemeal.
- Site **defaults to light mode** (`<html data-theme="light">` + a localStorage check near the bottom of the JS).
- Rankings auto-sort by `scores.overall` (desc); the 🥇🥈🥉 medals follow the top 3 automatically.
- `price` values are plain numbers (no `$`, no thousands commas). `price_range` ∈ budget/mid/premium.
- Feature flags are real booleans (`true`/`false`, no quotes).
- Adding the DB/framework introduces a live dependency (if the service is down, data won't load). The current single file has zero dependencies — that's the tradeoff being made for editing convenience and scale.

---

## Suggested prompt to start the next session

> I have a static 3D-printer ranking site at github.com/msweeney94/3dranker — the whole
> thing is a single `index.html` with printer data inlined as `const DATA = {...}` and
> filament data as `const FDATA = {...}`. Read `ROADMAP.md`, `EDITING-GUIDE.md`, and
> `index.html`. Do **Step 0**: extract the data into `data/printers.json` and
> `data/filaments.json` and make `index.html` fetch them, without changing how the site
> looks or adding a build step. Keep the golden backup intact.
