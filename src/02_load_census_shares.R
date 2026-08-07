# 02_load_census_shares.R
# Base-period industry employment shares from the 1985 Census.
#
# Source: e-Stat, 昭和60年国勢調査 抽出詳細集計 都道府県編, table 00202
#   男女の別（3），産業中分類（75），従業上の地位（4），15歳以上就業者数
#   Geography: 市区 (cities and wards only; towns and villages are not published
#   at 産業中分類 in any Census wave, so the sample is cities by necessity).
#
# Filters applied at download: 全域 only, 男女総数 only, 総数（不詳を含む） only.
# 1985 is pre-1990 immigration reform, so these shares cannot reflect Brazilian
# settlement patterns.

library(tidyverse)

RAW <- "data/raw/census/FEH_00200521_260807222251.csv"
TOKAI <- c("10", "21", "22", "23", "24", "25")

raw <- read_csv(RAW, locale = locale(encoding = "SJIS"), skip = 27,
                col_types = cols(.default = col_character()))

shares <- raw |>
  select(area_code, `市区030016`, cat03_code, `産業中分類Ｃ030116`, value) |>
  set_names(c("muni_code", "muni_name", "ind_code", "ind_name", "value")) |>
  mutate(
    pref_code = str_sub(muni_code, 1, 2),
    emp = suppressWarnings(as.numeric(value))
  ) |>
  filter(pref_code %in% TOKAI, !is.na(emp)) |>
  group_by(muni_code) |>
  mutate(share = emp / sum(emp)) |>
  ungroup()

# Sanity: shares sum to one within city
stopifnot(all(abs(tapply(shares$share, shares$muni_code, sum) - 1) < 1e-6))

write_csv(shares, "data/processed/census_shares_1985.csv")

shares |>
  filter(ind_name == "輸送用機械器具製造業") |>
  arrange(desc(share)) |>
  select(muni_name, emp, share) |>
  print(n = 10)