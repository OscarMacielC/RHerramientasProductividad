# Ejercicio 7 Explorando el conjunto de datos de Gapminder
# Oscar Eduardo Maciel Castillo

## remotes::install_github("r-lib/styler")
## CTRL+SHIFT+P

# 1.- Centro Nacional de Estadísticas de Salud ------------------------------
library(NHANES)
library(dslabs)
library(dplyr)

data(NHANES)
data(na_example)

mean(na_example) # Devuelve NA
sd(na_example) # Devuelve NA
mean(na_example, na.rm = TRUE) # Ignora los NA
sd(na_example, na.rm = TRUE)

# 2.- Presión arterial 1 ----------------------------------------------------

tab <- NHANES |>
  filter(AgeDecade == " 20-29", Gender == "female")

# ¿Sin filter?
tab <- NHANES[which(NHANES$AgeDecade == " 20-29" & NHANES$Gender == "female"), ]

head(tab)
## 66 variables...

# 3.- Presión arterial 2 ----------------------------------------------------
ref <- NHANES |>
  filter(AgeDecade == " 20-29", Gender == "female") |>
  summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  )
# A tibble: 1 × 2
# average standard_deviation
# <dbl>              <dbl>
# 1    108.               10.1

# 4.- Resumiendo promedios --------------------------------------------------
ref_avg <- NHANES |>
  filter(AgeDecade == " 20-29", Gender == "female") |>
  summarize(average = mean(BPSysAve, na.rm = TRUE)) |>
  pull(average)
# [1] 108.4224

# 5.- Mínimo y máximo -------------------------------------------------------
bp_range <- NHANES |>
  filter(AgeDecade == " 20-29", Gender == "female") |>
  summarize(
    minbp = min(BPSysAve, na.rm = TRUE),
    maxbp = max(BPSysAve, na.rm = TRUE)
  )
# A tibble: 1 × 2
# minbp maxbp
# <int> <int>
# 1    84   179

# 6.- group_by --------------------------------------------------------------
bp_summary_by_age <- NHANES |>
  filter(Gender == "female") |>
  group_by(AgeDecade) |>
  summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  )
# A tibble: 9 × 3

# 7.- group_by example 2 ----------------------------------------------------
bp_summary_men <- NHANES |>
  filter(Gender == "male") |>
  group_by(AgeDecade) |>
  summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  )
# A tibble: 9 × 3

# 8.- group_by ejemplo 3 ----------------------------------------------------
bp_summary_all <- NHANES |>
  group_by(AgeDecade, Gender) |>
  summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  )
# A tibble: 18 × 4

# 9.- Arrange ---------------------------------------------------------------
bp_by_race <- NHANES |>
  filter(Gender == "male", AgeDecade == " 40-49") |>
  group_by(Race1) |>
  summarize(
    average = mean(BPSysAve, na.rm = TRUE),
    standard_deviation = sd(BPSysAve, na.rm = TRUE)
  ) |>
  arrange(average)
# A tibble: 5 × 3
