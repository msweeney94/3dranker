# 📝 3DRanker — How to Edit Everything Yourself

This is your plain-English manual for editing the site without help. Take your time; nothing here can permanently break the site because you have backups (see the bottom).

**Live site:** https://singular-stroopwafel-caf984.netlify.app/
**The only file you ever edit:** `index.html`
**How it goes live:** Save `index.html` → commit → push to GitHub → Netlify auto-deploys in ~30 seconds.

---

## 🧠 The 3 Things to Understand First

1. **`index.html` is the whole site.** Everything — rankings, compare, filament page, all the data — lives in this one file. There is NO build step. What's in `index.html` is exactly what goes live.

2. **All the printer data lives in one big line** inside `index.html` that starts with:
   ```
   const DATA = {"printers":[ ... ]};
   ```
   All the filament data lives in another line that starts with:
   ```
   const FDATA = {"brands":[ ... ]};
   ```

3. **It's JSON — punctuation matters.** Every printer is wrapped in `{ }`, separated by commas. Every value in `"quotes"` except numbers (`419`) and true/false. If you delete a comma or a quote, the page can go blank. That's fixable (see Troubleshooting), but be careful.

---

## 🛠️ How to Make ANY Edit (the basic loop)

You can edit right on GitHub — no software needed:

1. Go to **https://github.com/msweeney94/3dranker**
2. Click **`index.html`**
3. Click the **pencil icon** (✏️ "Edit this file") top-right
4. Press **Ctrl+F** (Cmd+F on Mac) to find what you want to change
5. Make your change
6. Scroll down, click the green **"Commit changes"** button
7. Wait ~30 seconds, then hard-refresh the live site (**Ctrl+Shift+R**)

That's it. Every edit below is just "find this text, change it, commit."

---

## 💰 Change a Printer's PRICE

1. Ctrl+F for the printer name, e.g. `Bambu Lab P1S`
2. Right after it you'll see: `..."price":499,...`
3. Change the number. **No dollar sign, no commas in the number.** Just `539`.
   - ✅ `"price":539`
   - ❌ `"price":$539` or `"price":"539"` or `"price":1,299`
4. Commit.

**Also check `price_range`** right next to it (`"price_range":"mid"`). Options are:
`"budget"` / `"mid"` / `"premium"`. This controls the little colored price tag.

---

## 🖼️ Change a Printer's IMAGE

1. Ctrl+F for the printer name
2. Find `"image":"https://....jpg"`
3. Replace the URL between the quotes with a new one.

**Rules for a good image URL:**
- Must be a **direct link to an image file** — ends in `.jpg`, `.png`, or `.webp`
- Must start with `https://` (not `http://` — some browsers block http images)
- To get one: go to the manufacturer's store page, **right-click the product photo → "Copy Image Address"**, paste that.
- Test it: paste the URL into a new browser tab. If you see JUST the printer photo, it's good. If you see a webpage or an error, it won't work.

---

## 📊 Change a Printer's SCORES

Each printer has a `scores` block:
```
"scores":{"overall":8.62,"print_quality":9,"speed":8.8,"ease_of_use":8.5,"reliability":8.6,"value":8.5}
```
- Change any number (scale is 0–10, decimals allowed like `8.5`).
- **`overall`** is the big score that determines ranking order (higher = ranked higher). It does NOT auto-calculate — you set it yourself.
- The other five (`print_quality`, `speed`, `ease_of_use`, `reliability`, `value`) are the little bars on each card.

**To re-rank printers:** change their `overall` scores. The site automatically sorts #1, #2, #3... by `overall`, highest first. The 🥇🥈🥉 medals follow automatically.

---

## 📐 Change a Printer's SPECS

Each printer has a `specs` block:
```
"specs":{"build_volume":"256x256x256mm","nozzle_temp":"300°C","bed_temp":"120°C","extruder":"Direct Drive","auto_leveling":"Yes","filament_diameter":"1.75mm","connectivity":"Wi-Fi","enclosure":"Yes","max_speed":"500mm/s"}
```
Just change the text inside any set of quotes. These are plain text, so `"350°C"`, `"1000mm/s"`, `"Yes"` etc. are all fine.

**Note:** `"enclosure"` appears here as text (`"Yes"`/`"No"`) AND in features as true/false (below). If you change one, change both to stay consistent.

---

## ✨ Change a Printer's FEATURE BADGES (the ✓ checkmarks)

Each printer has a `features` block of **true/false** switches:
```
"features":{"open_source":false,"air_filter":true,"ai_detection":true,"camera":true,"multi_color":true,"direct_drive":true,"filament_runout":true,"power_recovery":true,"silent_mode":true,"enclosure":true}
```
- `true` = has the feature (shows a badge / green check in compare)
- `false` = doesn't have it (red X in compare)
- **Type `true` or `false` with NO quotes.** ✅ `"camera":true`  ❌ `"camera":"true"`

The badges shown on cards: enclosure 📦, multi_color 🎨, camera 📷, ai_detection 🤖, air_filter 💨, open_source 🔓, silent_mode 🔇.

---

## ➕ ADD a Brand-New Printer

Easiest method: **copy an existing printer that's similar, paste it, and edit it.**

1. Find a similar printer's full block. It starts at `{"name":...` and ends at `...}}` (the double `}}` closes features + the printer).
2. Copy the whole block including the comma before or after it.
3. Paste it right next to the original (make sure there's a comma `,` between printers).
4. Change every value: `name`, `brand`, `slug` (lowercase-with-dashes, e.g. `"bambu-lab-p1s"`), `image`, `price`, `price_range`, all `scores`, all `specs`, all `features`.
5. Commit. It auto-sorts into the rankings by its `overall` score.

**The slug must be unique** and lowercase with dashes instead of spaces.

---

## 🗑️ REMOVE a Printer

1. Ctrl+F for its `{"name":"That Printer"...`
2. Select from the opening `{` all the way to its closing `}}` — AND the comma right after it (or before it if it's the last one).
3. Delete. Commit.
4. **Check:** every printer must still be comma-separated, with no double commas `,,` and no comma right before the closing `]`.

---

## 🧵 Edit the FILAMENT Page

Filament brands live in the `const FDATA = {"brands":[ ... ]};` line. Each brand looks like:
```
{"slug":"bambu-lab","name":"Bambu Lab","logo":"🟧","founded":2022,"origin":"China","scores":{"overall":9.1,"print_quality":9.5,"consistency":9.4,"dryness":9.2,"spool_quality":9.0,"value":7.5,"material_range":8.5},"avg_price_pla":24.99,"rfid":true,"spool_material":"Cardboard","materials":["PLA","PETG","ABS"],"notes":"..."}
```
Edit the same way as printers:
- **`avg_price_pla`** — average PLA price (number with decimals, no `$`)
- **`scores.overall`** — sorts the filament ranking
- **`spool_material`** — `"Cardboard"` or `"Plastic"`
- **`rfid`** — `true`/`false`
- **`materials`** — a list in `[ ]`, each in quotes, comma-separated
- **`notes`** — the description paragraph
- **`logo`** — an emoji

---

## 🎨 Change COLORS / Theme

Near the top of `index.html` inside the `<style>` there are two theme blocks:
- `:root{...}` — the **dark** theme colors
- `html.light{...}` — the **light** theme colors

Colors are hex codes like `#c9a84c` (the gold). Change a value to recolor. `--gold` is the main accent (medals, buttons, highlights).

The site **defaults to light mode**. To change the default, find `<html lang="en" data-theme="light">` near the very top and the line `const savedTheme=localStorage.getItem('theme')||'light';` near the bottom — change both `light` to `dark` (or vice-versa).

---

## 🩹 TROUBLESHOOTING — "The site went blank!"

99% of the time this is a JSON typo (a missing comma, quote, or bracket). Don't panic — you have backups.

**Fastest fix: revert to the last known-good version.**
This is documented in `RESTORE.md`, but the simplest path on GitHub:
1. Go to https://github.com/msweeney94/3dranker/commits/main
2. Find the last commit **before** your broken change
3. Click it, then click the **"..."** or **"Browse files"** → open `index.html` → copy its contents
4. Paste back over your broken `index.html`, commit.

**Or ask me** ("Manage") — say *"the site is blank, restore the golden version"* and I'll fix it in seconds.

**To catch typos before committing:** paste your `DATA` line (everything between `const DATA = ` and the final `;`) into https://jsonlint.com — it'll point to the exact broken spot.

---

## ✅ Golden Rules

- Edit **only** `index.html`.
- **Never** put a `$` or commas inside a `"price"` number.
- **true/false** never get quotes. Everything else (text) does.
- Every printer/brand is separated by a **comma**; the last one has **no** trailing comma before `]`.
- After committing, **hard-refresh** (Ctrl+Shift+R) — your browser caches the old version.
- When unsure, **copy an existing entry and edit it** rather than typing from scratch.

---

## 🔒 Your Safety Net

- **Golden backup commit:** tagged `good-v1-40printers` on GitHub
- **Backup branch:** `stable-40printers`
- **Backup files:** `.backups/` folder in the repo + `~/.openclaw/workspace/3dranker-GOLDEN-backup.html`
- **Recovery steps:** see `RESTORE.md`

You can always get back to a working site. Experiment freely.
