# 🔒 GOLDEN VERSION — Recovery Guide

**The known-good site** (40 printers, compare table with green checks/red X's,
filament page, hamburger menu, light-mode default) is locked in three places.

Confirmed good by Mike on 2026-07-04.

## How the site deploys
- Netlify serves `index.html` **directly**. There is **NO** `netlify.toml` and
  **NO** build step.
- ⚠️ Do NOT add a `build.sh` that overwrites `index.html`. That was the cause of
  every regression on 2026-07-04. `index.html` is the single source of truth.

## To restore the golden version if things break

**Option A — from the git tag (recommended):**
```bash
cd ~/.openclaw/workspace/3dranker-site
git checkout good-v1-40printers -- index.html
git add index.html && git commit -m "Restore golden version" && git push origin main
```

**Option B — from the stable branch:**
```bash
git checkout stable-40printers -- index.html
git add index.html && git commit -m "Restore golden version" && git push origin main
```

**Option C — from the physical backup files:**
```bash
cp .backups/index-GOLDEN-40printers-20260704.html index.html
# or the workspace copy:
cp ~/.openclaw/workspace/3dranker-GOLDEN-backup.html index.html
git add index.html && git commit -m "Restore golden version" && git push origin main
```

## Golden version markers (sanity check)
- `<html lang="en" data-theme="light">` (light default)
- 40 printers in the DATA object
- Three pages: `pageRankings`, `pageCompare`, `pageFilament`
- Live URL: https://singular-stroopwafel-caf984.netlify.app/
- Golden commit: `e321606`
- Golden tag: `good-v1-40printers`
