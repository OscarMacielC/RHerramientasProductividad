# EJERCICIO 1 -----------------------
# Cargando datos
library(dslabs)
data(murders)

# Cargando dplyr
suppressPackageStartupMessages(library(dplyr))


# Redefina murders para que incluya una columna llamada `rate`
# con la tasa de homicidios que corresponde a cada 100,000
murders <- mutate(murders, population_in_millions = population / 10^5)
murders <- mutate(murders, rate = total /population_in_millions )

# EJERCICIO 2 -----------------------
x <- c(88, 100, 83, 92, 94)
# Rank en negativo nos permita hacer un rank descendente
rank(-x)
# Redefina murders de tal manera  que incluya una columna llamada rank 
# con los rangos de las tasas de MAYOR A MENOR = -rate
murders <- mutate(murders, rank = rank(-rate))

# EJERCICIO 3 -----------------------
# Use `select` para mostrar solamente los nombres de los estados y las 
#abreviaturas de `murders`
murders |> select(state,abb)

# EJERCICIO 4 -----------------------
# Use filter para mostrar los 5 estados con las tasas de homicidio más altas
murders |> filter(rank<=5)

# EJERCICIO 5 -----------------------
# Use `filter` con el operador != para crear un nuevo data 
# frame sin la región sureña y llámelo `no_south`
no_south<- filter(murders, region != "South")
# Use `nrow()` para calcular el número de filas
nrow(no_south)

# EJERCICIO 6 -----------------------
# Cree un nuevo data frame llamado `murders_nw` solamente con 
# estados del noreste y el oeste 
murders_nw<- filter(murders, region %in% c("Northeast","West"))
# Escriba el número de estados (filas) en esta categoría
nrow(murders_nw)

# EJERCICIO 7 -----------------------
# Cree una tabla y llámela `my_states` que satisfaga las dos 
# condiciones, noreste u oeste y tasa de homicidios menor a 1
my_states <- filter(murders, region %in% c("Northeast","West") & rate<1)
# Use `select` para mostrar solamente el nombre del estado, la 
# tasa de homicidios y el rango
my_states |> select(state,rank)

# EJERCICIO 8 -----------------------
# Muestre el resultado y solamente incluya el estado, la tasa 
# y las columnas de rango en una sola línea y en ese orden
murders |> select(state,rate,rank)

# EJERCICIO 9 -----------------------
# Cree un nuevo data frame llamado `my_states` (de acuerdo con 
# las especificaciones en las instrucciones)
data(murders)
my_states <- murders |> mutate(rate = total / population * 10^5,rank = (-rate)) |>filter(region %in% c("Northeast","West") & rate<1) |> select(state,rate,rank)
