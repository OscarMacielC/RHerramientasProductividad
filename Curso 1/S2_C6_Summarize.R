# Cargar paquetes y datos
library(tidyverse)
library(dplyr)
library(dslabs)
data(heights)

# Calcula promedio y desviación estándar para mujeres
# Summarize
s <- heights |>
  filter(sex == "Female") |>
  summarize(average = mean(height), standard_deviation = sd(height))

# Acceder a los componentes con el operador $
s$average
s$standard_deviation

# Calcular con el ejemplo de asesinatos
us_murders_rate_err <- murders |>
  mutate(rate = total/population*100000) |>
  summarize(mean(rate))
us_murders_rate_err
# Calcular tomando en cuenta el peso de cada estado
us_murder_rate <- murders |>
  summarize(rate = sum(total)/ sum(population) * 100000)
us_murder_rate

# S2_C7 MULTIPLE SUMMARIZE--------------------
# Calcular alturas agrupando por cuantiles (devuelve el resultado en filas)
heights_deprecated <- heights |>
  filter(sex == "Female") |>
  summarize(median_min_max = quantile(height, c(0.5, 0, 1)))
#USE REFRAME INSTEAD
heights |>
  filter(sex == "Female") |>
  reframe(median_min_max = quantile(height, c(0.5, 0, 1)))

# Calcular alturas agrupando por cuantiles (devuelve el resultado por columnas)
median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
}
heights |>
  filter(sex == "Female") |>
  summarize(median_min_max(height))

