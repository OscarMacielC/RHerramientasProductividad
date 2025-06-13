# Cargar tidyverse
library(tidyverse)

# Añadir tasas de asesinatos con mutate
library(dslabs)
data("murders")
murders <- mutate(murders, rate = total/ population * 100000)

# Observamos la nueva columna que ha sido añadida
head(murders)

# Filtrar la tabla de datos para mostrar solo las entradas para las cuales la tasa de asesinatos es inferior a 0.71
filter(murders, rate <= 0.71)

# Seleccionar tres columnas, asignamos el resultado a un nuevo objeto y luego filtramos este nuevo objeto:
new_table <- select(murders, state, region, rate)
filter(new_table, rate <= 0.71)
