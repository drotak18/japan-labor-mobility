# Working log

## 2026-08-07 — Base period crisis and resolution

**Goal:** obtain pre-1990 industry employment shares for the shift-share.

**工業統計調査 is unusable.** The e-Stat database view covers 2007 onward only; the
file archive bottoms out at 1996. Nothing from the Shōwa era exists in machine-readable
form. A 1996 base would sit six years after the visa reform, by which point Brazilian
settlement was already substantial (~200,000 nationwide), which makes share exogeneity
very hard to argue.

**Switched to the 1985 Census.** Better source on the merits: all industries in the
denominator rather than manufacturing alone, matching how Cadena and Kovak construct
shares. A manufacturing-only denominator would make the auto share mechanically close
to one in exactly the towns of interest.

**The 大分類 / 中分類 tradeoff.** Two candidate tables:

| Table | Industries | Geography |
|---|---|---|
| 00501 (第2次基本集計) | 15 major groups | all 市区町村 |
| 00202 (抽出詳細集計) | 75 mid-groups | 市区 only |

15 major groups collapses all manufacturing into one category, leaving no variation
for the shock. Took 00202 and accepted the loss of towns and villages.

Checked whether later waves are better: they are worse. The 2020 抽出詳細集計 publishes
中分類 only for cities over 500,000. 1985 at 市区 is likely the finest municipality-level
industry detail available in any Census wave.

**Cost of the restriction:** 大泉町 (Gunma), the most heavily Brazilian municipality in
Japan, is a town and therefore excluded. Needs explicit treatment in any writeup.

**Validation.** Transport equipment shares in 1985: 豊田市 0.331, 刈谷市 0.222, 西尾市
0.165, 湖西市 0.161, 大府市 0.147, 鈴鹿市 0.142. Correct cities in a plausible order.
碧南市 (0.131) was also one of the largest Brazilian population gainers 2012–2016 (+25%).

**Open:** the 1985 Census uses pre-2007 JSIC. Current data uses the revised classification.
Transport equipment survives but several categories were reorganised; a concordance is needed.

## 2026-08-04 — Outcome panel

e-Stat table `24-12-t2.xlsx` is a Power Pivot workbook: the nationality breakdown lives in
Excel's data model, not in cells, so readxl only sees whatever the pivot was set to at save
time. Reading it returns total foreign residents, not Brazilians. Abandoned in favour of the
database view (statdisp_id 0003147283), which serves filtered CSV directly.

That view covers ten semiannual waves, 2012年12月 to 2017年6月, and no further. Extending to
2024 would require either the per-wave Excel files with a manual pivot step or the e-Stat API.

Suppression: municipalities with ten or fewer foreign residents have the nationality breakdown
suppressed, marked `-`. Coercing these to zero would invent population collapses in small
municipalities and bias growth rates toward zero. Carried as NA with an explicit flag.