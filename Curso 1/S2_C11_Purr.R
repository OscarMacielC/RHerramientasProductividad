# Cargar paquete
library(purrr)

# Anteriormente construimos una función y utilizamos sapply para calcular la suma de los primeros n enteros para varios valores de n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
n <- 1:25
s_n <- sapply(n, compute_s_n)

# Función map que devuelve una lista
s_n <- map(n, compute_s_n)
class(s_n)

# Función map_dbln para vector numérico
s_n <- map_dbl(n, compute_s_n)
class(s_n)

# Uso de map_df
s_n <- map_df(n, compute_s_n) #la función que llamamos debe devolver un vector o una lista con nombres, por esta razón, el siguiente código daría como resultado un error Argument 1 must have names

# Cambiar la función para corregir el error
compute_s_n <- function(n){
  x <- 1:n
  tibble(sum = sum(x))
}
s_n <- map_df(n, compute_s_n)
s_n
print(s_n,n=25)

#S2_C12_Condicionales tydy -----------------------
library(dplyr)
# Uso de la función case_when para vectorizar declaraciones condicionales
x <- c(-2, -1, 0, 1, 2)
case_when(x < 0 ~ "Negative",
          x > 0 ~ "Positive",
          TRUE ~ "Zero")

# Comparar las tasas de asesinatos en cuatro grupos de estados: New England, West Coast, South y Other. Usar case_when para cada estado, primero preguntamos si está en New England. Si la respuesta es no, entonces preguntamos si está en el West Coast, y si no, preguntamos si está en el South y, si no, entonces asignamos ninguna de las anteriores (Other).
murders |>
  mutate(group = case_when(
    abb %in% c("ME", "NH", "VT", "MA", "RI", "CT") ~ "New England",
    abb %in% c("WA", "OR", "CA") ~ "West Coast",
    region == "South" ~ "South",
    TRUE ~ "Other")) |>
  group_by(group) |>
  summarize(rate = sum(total)/ sum(population) * 10^5)

# Verificar si los elementos de un vector x están entre a y b
a <- -1
b <- 1
x >= a & x <= b

# Función between para verificar si los elementos de un vector x están entre a y b
between(x, a, b)
