# Japan Labor Mobility

Do immigrant workers absorb local labor demand shocks the way they do in the United States?

Cadena and Kovak (2016) find that less-educated Mexican-born immigrants in the US relocate strongly in response to local demand shocks, far more than natives, and in doing so insulate native workers from those shocks. This project asks whether the same holds for Brazilian nationals in Japan's Tokai manufacturing belt, where the institutional setting is very different: employment is largely mediated by labor brokers, housing is often tied to the job, and the population is concentrated in a small number of prefectures.

The design is a shift-share (Bartik) instrument. City-level exposure to national industry growth is built from 1985 industry employment shares, five years before the visa reform that brought this population to Japan. The outcome is the change in registered Brazilian residents, compared against the same specification for Japanese population. The gap between the two elasticities is the object of interest.

## Data

**Outcome.** e-Stat table 07 (在留外国人統計, statdisp_id 0003147283): registered foreign residents by nationality and municipality. Ten semiannual waves, 2012年12月 to 2017年6月. The series cannot be extended before 2012, when the alien registration system was replaced by the residence card system, and this database view does not run past 2017. Municipalities with ten or fewer foreign residents have the nationality breakdown suppressed; suppressed cells are carried as NA with a flag, never as zero.

**Base shares.** e-Stat, 昭和60年国勢調査 抽出詳細集計 都道府県編, table 00202: 75 industries at 市区 level, 1985.

## Sample restriction

The sample is **cities and wards, not all municipalities**. The Census publishes 産業中分類 (75 industries) only at 市区 level; towns and villages are published at 産業大分類 (15 groups), which collapses all manufacturing into a single category and leaves no usable variation for a shift-share. Later Census waves are more restrictive, not less: the 2020 抽出詳細集計 publishes 中分類 only for cities over 500,000.

This yields 112 cities across the six prefectures. The most significant loss is 大泉町 in Gunma, the most heavily Brazilian municipality in Japan, which is a town rather than a city.

The 抽出詳細集計 is a sample tabulation rather than a full count, so cells carry sampling error.

## Why 工業統計調査 is not used

The original design specified pre-1990 manufacturing employment shares from 工業統計調査. That data does not exist on e-Stat in any form: the database view begins at 2007 and the file archive at 1996. The Census is in any case the better source, since it covers all industries rather than manufacturing alone.

## Status

Outcome panel and base shares both loaded and validated. In the 1985 shares, transport equipment employment is concentrated exactly where institutional knowledge would predict: 豊田市 (33% of all employment), 刈谷市 (22%), then 西尾, 湖西, 大府, 鈴鹿.

First descriptive result: aggregate Brazilian population in the six prefectures fell only 4.6% between 2012 and 2016 (141,132 to 134,666), but municipality-level changes ranged from -44% to +92%, with an interquartile range of -15% to +6%. The spatial redistribution is large even where the aggregate is flat, which is the variation the design exploits.

## Next

1. National industry employment growth 2012 to 2017 (the shift component).
2. A concordance between the pre-2007 JSIC used in the 1985 Census and the revised classification used in current data. Transport equipment survives intact but several categories were reorganised.
3. Merger crosswalk to fixed geography. Municipality counts drift across waves and code-to-code growth rates would otherwise show phantom changes.

## Sample

Aichi, Shizuoka, Gifu, Mie, Gunma, Shiga. All data public via e-Stat.