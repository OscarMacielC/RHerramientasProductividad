# Cargar paquetes y datos
library(tidyverse)
library(dplyr)
library(dslabs)
data(murders)

# Verificar qué clase es el objeto
us_murder_rate <- murders |>
  summarize(rate = sum(total)/ sum(population) * 100000)
class(us_murder_rate)

# Utilizar pull para acceder a los valores almacenados en los datos
x <- us_murder_rate |> pull(rate)
class(x)
# Obtener un número de la tabla de datos original con una línea de código
us_murder_rate <- murders |>
  summarize(rate = sum(total)/ sum(population) * 100000) |>
  pull(rate)
us_murder_rate
# Verificar qué clase es el objeto
class(us_murder_rate)

# S2_C9_Agrupar con groupby------------------------------------
# Agrupar por sexo
heights |> group_by(sex)

# Resumir los datos después de agruparlos
heights |>
  group_by(sex) |>
  summarize(average = mean(height), standard_deviation = sd(height))

#Calcular la mediana, el mínimo y máximo de la tasa de asesinatos en las cuatro regiones del país
data(murders)

median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
}

murders <- murders |>
  mutate(rate = total/population*100000)

murders |>
  group_by(region) |>
  summarize(median_min_max(rate))

# S2_C10_Ordenar dataframes------------------------------------
# Ordenar tablas enteras con la función arrange, con base en la población
murders |>
  arrange(population) |>
  head()

# Para ver los estados por tasa de asesinatos, desde menor a mayor, organizamos con la función rate
murders |>
  arrange(rate) |>
  head()

# Ordenar la tabla en orden descendente
murders |>
  arrange(desc(rate))

# Ordenar anidadamente por región primero y luego por tasa de asesinatos
murders |>
  arrange(region, rate) |>
  head()

# Trabajar sólo con las primeras 15 entradas (filtro)
murders |>  top_n(15, desc(total)) |>
  arrange(desc(total))
