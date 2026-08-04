# Japan Labor Mobility

Do immigrant workers absorb local labor demand shocks the way they do in the United States?

Cadena and Kovak (2016) find that low-skilled Mexican immigrants in the US relocate strongly in response to local demand shocks, far more than natives, and in doing so insulate native workers from those shocks. This project asks whether the same holds for Nikkei Brazilian workers in Japan's Tokai manufacturing belt, where the institutional setting is very different: employment is largely mediated by labor brokers, housing is often tied to the job, and the population is concentrated in a small number of prefectures.

The design is a shift-share (Bartik) instrument. Municipality-level exposure to national industry growth is built from pre-1990 industry employment shares, before the visa reform that brought this population to Japan. The outcome is the change in registered Brazilian residents by municipality, compared against the same specification for Japanese working-age population. The gap between the two elasticities is the object of interest.

Sample: Aichi, Shizuoka, Gifu, Mie, Gunma, Shiga. The e-Stat database view of table 07 covers ten semiannual waves, 2012年12月 to 2017年6月, 240 municipalities in these prefectures. Extending to 2024 requires either the per-wave Excel files or the e-Stat API. All data are public.

Status: panel loaded. Aggregate Brazilian population in the six prefectures fell only 4.6% between 2012 and 2016 (141,132 to 134,666), but municipality-level changes ranged from -44% to +92% with an interquartile range of -15% to +6%. The spatial redistribution is large even where the aggregate is flat, which is the variation the design exploits. Next: base-period industry shares from 工業統計調査 and a merger crosswalk to fixed geography.
