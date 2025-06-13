#1 Analizar presión arterial
suppressPackageStartupMessages(library(dplyr))
library(dplyr)
library(NHANES)
data(NHANES)

# Complete las partes faltantes en la siguiente línea de código
tab <- NHANES |> filter(Gender == "FEMALE" & AgeDecade == "20-29")

#2 Calcular promedio y desviación estandar ---------------
# Complete la siguiente línea de código
ref <- NHANES |>
  filter(AgeDecade == " 20-29" & Gender == "female") |>
  summarize(average = mean(BPSysAve, na.rm = TRUE ),
            standard_deviation = sd(BPSysAve, na.rm = TRUE ))

#3 Guardar el valor con pull ---------------
ref_avg <- NHANES |>
  filter(AgeDecade == " 20-29" & Gender == "female") |>
  summarize(average = mean(BPSysAve, na.rm = TRUE)) |>
  pull(average)

#4 Resumen min y max ---------------
NHANES |>
  filter(AgeDecade == " 20-29" & Gender == "female") |> 
  summarize(minbp = min(BPSysAve, na.rm = TRUE), 
            maxbp = max(BPSysAve, na.rm = TRUE))

#5 Group by ---------------
NHANES |>
  filter(Gender == "female") |>
  group_by(AgeDecade) |> 
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

#6 Cambio a hombres -------------
NHANES |>
  filter(Gender == "male") |>
  group_by(AgeDecade) |> 
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

#7 Summarize -------------
NHANES |>
  group_by(AgeDecade, Gender) |>
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE))

#8 Arrange ----------------
NHANES |> 
  filter(Gender == "Male" & AgeDecade == "40-49") |> 
  group_by(Race1) |> 
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            standard_deviation = sd(BPSysAve, na.rm = TRUE)) |> 
  arrange(average)
