# 01_load_zairyu.R
# Parse e-Stat table 07 (市区町村別 国籍・地域別 在留外国人) into a municipality panel.
#
# Source: e-Stat statdisp_id 0003147283, downloaded as CSV (列指向形式・Shift-JIS)
# Coverage: 2012年12月 to 2017年6月, ten semiannual waves, 1,922 municipalities
# Nationality filter applied at download: 総数 and ブラジル only
#
# Notes from the source documentation:
#   - Municipalities with 10 or fewer foreign residents have everything except
#     the total suppressed (注2). Suppressed cells appear as "-" (注3).
#   - Suppressed is NOT zero. Coercing it to zero would bias growth rates toward
#     zero in exactly the small municipalities where the Brazilian share is most
#     volatile, so it is carried as NA with an explicit flag.

library(tidyverse)

RAW <- "data/raw/zairyu/FEH_00250012_260804235215.csv"

TOKAI <- c(
  gunma    = "10",
  gifu     = "21",
  shizuoka = "22",
  aichi    = "23",
  mie      = "24",
  shiga    = "25"
)

# e-Stat prepends a metadata block; the real header sits on line 27.
# Everything is read as character on purpose: area_code has meaningful leading
# zeros, and value contains the "-" suppression marker.
raw <- read_csv(
  RAW,
  locale    = locale(encoding = "SJIS"),
  skip      = 26,
  col_types = cols(.default = col_character())
)

panel <- raw |>
  select(area_code, 市区町村, 国籍07, `時間軸（月次）`, value) |>
  set_names(c("muni_code", "muni_name", "nationality", "period", "value")) |>
  mutate(
    year        = as.integer(str_extract(period, "^\\d{4}")),
    month       = as.integer(str_extract(period, "(?<=年)\\d+")),
    pref_code   = str_sub(muni_code, 1, 2),
    suppressed  = value == "-",
    count       = if_else(suppressed, NA_real_, suppressWarnings(as.numeric(value))),
    nationality = if_else(nationality == "ブラジル", "brazil", "total")
  ) |>
  select(-value, -period) |>
  pivot_wider(
    names_from  = nationality,
    values_from = c(count, suppressed)
  )

tokai <- panel |> filter(pref_code %in% TOKAI)

# Sanity checks. Municipality counts drift downward across waves because of
# mergers; this is the crosswalk problem and must be resolved before any
# growth rate is computed on a code-to-code basis.
stopifnot(nrow(tokai) > 0)

tokai |>
  count(year, month, name = "municipalities") |>
  print(n = Inf)

dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)
write_csv(tokai, "data/processed/zairyu_tokai.csv")