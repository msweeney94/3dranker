#!/bin/bash
# Create complete index.html file

cat > index.html << 'HTML'
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>3DRanker — Best 3D Printers Ranked</title><link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet"><style>
:root{--gold:#c9a84c;--gold-light:#e8c97a;--gold-dim:#a07830;--light-bg:#faf8f5;--light-bg2:#f5f3f0;--light-bg3:#eee9e3;--light-bg4:#e5dfd6;--light-t1:#2a2520;--light-t2:#5a4f48;--light-t3:#8b7d70;--dark-bg:#111110;--dark-bg2:#1a1917;--dark-bg3:#222120;--dark-bg4:#2c2b29;--dark-t1:#f0ece4;--dark-t2:#a09890;--dark-t3:#6b6560;--bg:var(--dark-bg);--bg2:var(--dark-bg2);--bg3:var(--dark-bg3);--bg4:var(--dark-bg4);--t1:var(--dark-t1);--t2:var(--dark-t2);--t3:var(--dark-t3);--border:#333230;--border2:#3d3c3a;--pastel-green:#b8d4b0;--pastel-amber:#d4c08c;--max-w:1200px;--r-md:10px;--r-lg:14px;--grad-gold:linear-gradient(135deg,#c9a84c,#e8c97a)}
html.light-mode{--bg:var(--light-bg);--bg2:var(--light-bg2);--bg3:var(--light-bg3);--bg4:var(--light-bg4);--t1:var(--light-t1);--t2:var(--light-t2);--t3:var(--light-t3);--border:#d9d1c8;--border2:#cfc4ba)}
*{box-sizing:border-box;margin:0;padding:0}
body{background:var(--bg);color:var(--t1);font-family:'Inter',sans-serif;font-size:14px;line-height:1.6;transition:background .3s,color .3s}
.nav{position:sticky;top:0;left:0;right:0;width:100%;z-index:200;background:rgba(17,17,16,.95);border-bottom:1px solid var(--border);box-sizing:border-box}
.nav-inner{width:100%;max-width:var(--max-w);margin:0 auto;display:flex;align-items:center;gap:16px;padding:0 24px;height:56px;box-sizing:border-box}
.nav-logo{font-size:18px;font-weight:800;background:var(--grad-gold);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;text-decoration:none}
.nav-spacer{flex:1}
.nav-count{font-size:12px;color:var(--t3)}
.nav-theme-btn{width:36px;height:36px;border:1px solid var(--border);border-radius:6px;background:var(--bg3);color:var(--t2);cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:16px;font-family:inherit}
.nav-theme-btn:hover{border-color:var(--gold-dim);color:var(--t1)}
.page{display:none}
.page.active{display:block}
.rankings-layout{max-width:var(--max-w);margin:0 auto;padding:24px}
.controls{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:20px}
.card-list{display:flex;flex-direction:column;gap:10px}
.pcard{background:var(--bg2);border:1px solid var(--border);border-radius:var(--r-lg);padding:16px;display:flex;flex-direction:column;gap:12px}
.pcard:hover{border-color:var(--gold-dim);transform:translateY(-2px)}
.pcard-header{display:flex;align-items:flex-start;gap:12px}
.rank-num{font-size:20px;font-weight:800;color:var(--t3)}
.pcard.top3 .rank-num{background:var(--grad-gold);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.img-col{width:64px;height:64px;background:var(--bg3);border-radius:var(--r-md);display:flex;align-items:center;justify-content:center;flex-shrink:0}
.img-col img{max-width:100%;max-height:100%;object-fit:contain;padding:4px}
.pcard-info{flex:1;display:flex;flex-direction:column;gap:6px}
.printer-name{font-size:15px;font-weight:700;color:var(--t1)}
.brand-tag{padding:2px 8px;border-radius:999px;font-size:11px;font-weight:700;border:1px solid transparent}
.bt-bambu-lab{background:rgba(109,187,109,.15);color:var(--pastel-green)}
.feat-badges{display:flex;gap:5px;flex-wrap:wrap}
.fbadge{display:inline-flex;align-items:center;gap:3px;padding:2px 7px;border-radius:999px;font-size:10px;font-weight:700;white-space:nowrap;background:var(--bg4);color:var(--t3);border:1px solid var(--border)}
.fbadge.on{background:rgba(201,168,76,.12);color:var(--gold);border-color:rgba(201,168,76,.3)}
.score-mini-row{display:none;gap:12px;margin-top:8px}
@media(min-width:901px){.score-mini-row{display:flex}}
.pcard-footer{display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap}
.score-box{display:flex;flex-direction:column;align-items:center;gap:2px;padding:8px 12px;background:rgba(201,168,76,.08);border:1px solid rgba(201,168,76,.2);border-radius:var(--r-md);flex-shrink:0}
.score-val{font-size:18px;font-weight:800;background:var(--grad-gold);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.price-val{font-size:14px;font-weight:800;color:var(--t1)}
.btn{display:inline-flex;align-items:center;justify-content:center;padding:8px 16px;border-radius:var(--r-md);font-size:12px;font-weight:700;font-family:inherit;cursor:pointer;text-decoration:none;transition:all .15s;border:none;white-space:nowrap;flex-shrink:0}
.btn-gold{background:var(--grad-gold);color:#1a1200}
.btn-gold:hover{transform:translateY(-1px)}
.footer{border-top:1px solid var(--border);padding:24px;text-align:center;color:var(--t3);font-size:12px}
</style></head>
<body>
<nav class="nav">
<div class="nav-inner">
<a class="nav-logo" href="#">3DRanker</a>
<div class="nav-spacer"></div>
<span class="nav-count" id="navCount">35 printers</span>
<button class="nav-theme-btn" id="themeBtn" onclick="toggleTheme()" title="Toggle light/dark mode">☀️</button>
</div>
</nav>

<div class="page active" id="pageRankings">
<div class="rankings-layout">
<div class="card-list" id="cardList"></div>
</div>
</div>

<footer class="footer">
3DRanker.com — Rankings updated July 2026
</footer>

<script>
// Light/Dark Mode Toggle
function toggleTheme(){
  const html = document.documentElement;
  const btn = document.getElementById('themeBtn');
  if(html.classList.contains('light-mode')){
    html.classList.remove('light-mode');
    btn.textContent = '☀️';
    localStorage.setItem('theme', 'dark');
  }else{
    html.classList.add('light-mode');
    btn.textContent = '🌙';
    localStorage.setItem('theme', 'light');
  }
}

// Restore theme preference
const savedTheme = localStorage.getItem('theme') || 'dark';
if(savedTheme === 'light'){
  document.documentElement.classList.add('light-mode');
  document.getElementById('themeBtn').textContent = '🌙';
}

const DATA = {printers: [
{"name":"Bambu Lab H2C","brand":"Bambu Lab","slug":"bambu-lab-h2c","image":"https://us.store.bambulab.com/cdn/shop/files/H2C_Main.png?width=400","price":1899,"price_range":"premium","scores":{"overall":8.85},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab H2S","brand":"Bambu Lab","slug":"bambu-lab-h2s","image":"https://us.store.bambulab.com/cdn/shop/files/H2S_Main.png?width=400","price":1099,"price_range":"premium","scores":{"overall":8.81},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab P2S","brand":"Bambu Lab","slug":"bambu-lab-p2s","image":"https://us.store.bambulab.com/cdn/shop/files/P2S_Main.png?width=400","price":799,"price_range":"mid","scores":{"overall":8.75},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab H2D","brand":"Bambu Lab","slug":"bambu-lab-h2d","image":"https://us.store.bambulab.com/cdn/shop/files/H2D_Main.png?width=400","price":2199,"price_range":"premium","scores":{"overall":8.72},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab P1S","brand":"Bambu Lab","slug":"bambu-lab-p1s","image":"https://us.store.bambulab.com/cdn/shop/files/P1S_Main.png?width=400","price":649,"price_range":"mid","scores":{"overall":8.62},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab A2L","brand":"Bambu Lab","slug":"bambu-lab-a2l","image":"https://us.store.bambulab.com/cdn/shop/files/A2L_Main.png?width=400","price":449,"price_range":"mid","scores":{"overall":8.35},"features":{"camera":true,"ai_detection":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab A1","brand":"Bambu Lab","slug":"bambu-lab-a1","image":"https://us.store.bambulab.com/cdn/shop/files/A1_Main.png?width=400","price":299,"price_range":"budget","scores":{"overall":8.22},"features":{"camera":true,"direct_drive":true,"multi_color":true}},
{"name":"Bambu Lab A1 Mini","brand":"Bambu Lab","slug":"bambu-lab-a1-mini","image":"https://us.store.bambulab.com/cdn/shop/files/A1Mini_Main.png?width=400","price":199,"price_range":"budget","scores":{"overall":7.88},"features":{"camera":true,"direct_drive":true,"multi_color":true}},
{"name":"Prusa MK4S","brand":"Prusa Research","slug":"prusa-mk4s","image":"https://cdn.prusa3d.com/wp-content/uploads/2023/09/pl_mk4_1.png","price":799,"price_range":"mid","scores":{"overall":8.52},"features":{"open_source":true,"direct_drive":true}},
{"name":"Prusa Core One L","brand":"Prusa Research","slug":"prusa-core-one-l","image":"https://cdn.prusa3d.com/wp-content/uploads/2024/10/pl_core_one_1.png","price":1899,"price_range":"premium","scores":{"overall":8.47},"features":{"open_source":true,"direct_drive":true}},
{"name":"Prusa Core One+","brand":"Prusa Research","slug":"prusa-core-one-plus","image":"https://cdn.prusa3d.com/wp-content/uploads/2024/10/pl_core_one_1.png","price":1299,"price_range":"premium","scores":{"overall":8.43},"features":{"open_source":true,"direct_drive":true}},
{"name":"Prusa Original XL","brand":"Prusa Research","slug":"prusa-original-xl","image":"https://cdn.prusa3d.com/wp-content/uploads/2022/03/pl_xl_1.png","price":2499,"price_range":"premium","scores":{"overall":8.41},"features":{"open_source":true,"direct_drive":true}},
{"name":"Prusa Mini+","brand":"Prusa Research","slug":"prusa-mini-plus","image":"https://cdn.prusa3d.com/wp-content/uploads/2021/01/pl_mini_1.png","price":499,"price_range":"mid","scores":{"overall":7.97},"features":{"open_source":true}},
{"name":"Ultimaker S5","brand":"Ultimaker","slug":"ultimaker-s5","image":"🖨️","price":4990,"price_range":"premium","scores":{"overall":8.41},"features":{"air_filter":true}},
{"name":"Ultimaker S3","brand":"Ultimaker","slug":"ultimaker-s3","image":"🖨️","price":3499,"price_range":"premium","scores":{"overall":8.21},"features":{"air_filter":true}},
{"name":"Creality K1 Max","brand":"Creality","slug":"creality-k1-max","image":"🖨️","price":549,"price_range":"mid","scores":{"overall":8.0},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true}},
{"name":"Creality K2 Combo","brand":"Creality","slug":"creality-k2-combo","image":"🖨️","price":549,"price_range":"mid","scores":{"overall":7.57},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Creality K2 Plus Combo","brand":"Creality","slug":"creality-k2-plus-combo","image":"🖨️","price":999,"price_range":"premium","scores":{"overall":7.74},"features":{"camera":true,"ai_detection":true,"air_filter":true,"direct_drive":true,"multi_color":true}},
{"name":"Creality Ender 3 V3 SE","brand":"Creality","slug":"creality-ender-3-v3-se","image":"🖨️","price":199,"price_range":"budget","scores":{"overall":7.31},"features":{"direct_drive":true}},
{"name":"Elegoo Neptune 4 Max","brand":"Elegoo","slug":"elegoo-neptune-4-max","image":"🖨️","price":279,"price_range":"budget","scores":{"overall":7.71},"features":{"direct_drive":true}},
{"name":"Elegoo Neptune 3 Pro","brand":"Elegoo","slug":"elegoo-neptune-3-pro","image":"🖨️","price":229,"price_range":"budget","scores":{"overall":7.39},"features":{"direct_drive":true}},
{"name":"Elegoo Centauri Carbon","brand":"Elegoo","slug":"elegoo-centauri-carbon","image":"🖨️","price":319,"price_range":"mid","scores":{"overall":7.56},"features":{"direct_drive":true}},
{"name":"Anycubic Kobra 2","brand":"Anycubic","slug":"anycubic-kobra-2","image":"🖨️","price":259,"price_range":"budget","scores":{"overall":7.41},"features":{"direct_drive":true}},
{"name":"Anycubic Kobra X","brand":"Anycubic","slug":"anycubic-kobra-x","image":"🖨️","price":399,"price_range":"mid","scores":{"overall":7.07},"features":{"direct_drive":true}},
{"name":"Anycubic Kobra 3 Combo","brand":"Anycubic","slug":"anycubic-kobra-3-combo","image":"🖨️","price":349,"price_range":"mid","scores":{"overall":7.35},"features":{"direct_drive":true,"multi_color":true}},
{"name":"FlashForge Adventurer 5M Pro","brand":"FlashForge","slug":"flashforge-adventurer-5m-pro","image":"🖨️","price":449,"price_range":"mid","scores":{"overall":8.03},"features":{"camera":true,"air_filter":true,"direct_drive":true}},
{"name":"FlashForge Adventurer 5M","brand":"FlashForge","slug":"flashforge-adventurer-5m","image":"🖨️","price":349,"price_range":"mid","scores":{"overall":7.84},"features":{"camera":true,"direct_drive":true}},
{"name":"Snapmaker J1s IDEX","brand":"Snapmaker","slug":"snapmaker-j1s-idex","image":"🖨️","price":499,"price_range":"mid","scores":{"overall":7.56},"features":{"direct_drive":true,"multi_color":true}},
{"name":"Snapmaker Artisan 3-in-1","brand":"Snapmaker","slug":"snapmaker-artisan-3-in-1","image":"🖨️","price":1999,"price_range":"premium","scores":{"overall":7.24},"features":{"camera":true,"direct_drive":true,"multi_color":true}},
{"name":"Snapmaker U1","brand":"Snapmaker","slug":"snapmaker-u1","image":"🖨️","price":899,"price_range":"premium","scores":{"overall":7.54},"features":{"camera":true,"air_filter":true,"direct_drive":true}},
{"name":"Voxelab Aquila S2","brand":"Voxelab","slug":"voxelab-aquila-s2","image":"🖨️","price":189,"price_range":"budget","scores":{"overall":6.92},"features":{"direct_drive":true}},
{"name":"Raise3D Pro3","brand":"Raise3D","slug":"raise3d-pro3","image":"🖨️","price":3999,"price_range":"premium","scores":{"overall":7.8},"features":{"air_filter":true,"camera":true,"direct_drive":true,"multi_color":true}},
{"name":"Artillery Sidewinder X3","brand":"Artillery","slug":"artillery-sidewinder-x3","image":"🖨️","price":399,"price_range":"mid","scores":{"overall":7.5},"features":{"direct_drive":true}},
{"name":"Sovol SV06","brand":"Sovol","slug":"sovol-sv06","image":"🖨️","price":249,"price_range":"budget","scores":{"overall":7.3},"features":{"direct_drive":true}},
{"name":"Sovol SV08","brand":"Sovol","slug":"sovol-sv08","image":"🖨️","price":449,"price_range":"mid","scores":{"overall":7.4},"features":{"direct_drive":true}}
]};

function renderCards(){
  const list = document.getElementById('cardList');
  list.innerHTML = DATA.printers.map((p,i) => {
    const score = p.scores.overall.toFixed(2);
    const badges = [];
    if(p.features.camera) badges.push('<span class="fbadge on">📷</span>');
    if(p.features.ai_detection) badges.push('<span class="fbadge on">🤖</span>');
    if(p.features.air_filter) badges.push('<span class="fbadge on">💨</span>');
    if(p.features.multi_color) badges.push('<span class="fbadge on">🎨</span>');
    const badgeHtml = badges.slice(0,3).join('');
    return `
    <div class="pcard ${i<3?'top3':''}">
      <div class="pcard-header">
        <div style="display:flex;flex-direction:column;align-items:center;gap:6px;flex-shrink:0">
          <div class="rank-num">${i+1}</div>
        </div>
        <div class="img-col">
          <img src="${p.image}" onerror="this.style.display='none'" alt="${p.name}">
        </div>
        <div class="pcard-info">
          <div style="display:flex;align-items:center;gap:8px;flex-wrap:wrap">
            <span class="printer-name">${p.name}</span>
            <span class="brand-tag bt-bambu-lab">${p.brand}</span>
          </div>
          <div class="feat-badges">${badgeHtml}</div>
          <div class="score-mini-row">
            <div class="score-mini"><div style="font-size:10px;color:var(--t3);font-weight:700">Overall</div><div style="font-size:11px;font-weight:700;color:var(--t1)">${score}</div></div>
          </div>
        </div>
      </div>
      <div class="pcard-footer">
        <div class="score-box">
          <div class="score-val">${score}</div>
          <div style="font-size:9px;color:var(--gold-dim);font-weight:700">SCORE</div>
        </div>
        <div class="price-val">$${p.price.toLocaleString()}</div>
        <button class="btn btn-gold">Details</button>
      </div>
    </div>`;
  }).join('');
}

renderCards();
</script>
</body>
</html>
HTML

echo "✓ index.html generated ($(wc -l < index.html) lines, $(du -h index.html | cut -f1))"
