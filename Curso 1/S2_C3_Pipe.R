library(tidyverse)
library(dslabs)
data("murders")
# PIPE ANTIGUO %>%  y nuevo |>
# PIPE hace que no se necesite repetir el primer argumento nuevamente y tidy hace que no tengamos que usar $
# usando el pipe para el ejercicio en S2C2
murders |> select(state, region, rate) |> filter(rate <= 0.71)

# el pipe envía el resultado que se encuentra en el lado izquierdo del pipe para ser el primer argumento de la función en el lado derecho del pipe:
16 |> sqrt()
16 |> sqrt() |> log2()
16 |> sqrt() |> log(base = 2)

# S2_C4_Tibble
# Analizar con el ejemplo que hemos utilizado y observen la línea #a tibble seguida por sus dimensiones
murders |> group_by(region)

# Explorar la clase de objeto devuelto:
murders |> group_by(region) |> class()

# Comparar la presentación de los datos de las dos siguientes maneras:
murders
as_tibble(murders)

# Al crear subconjuntos de las columnas de un data frame, puede devolver un objeto que no es un data frame, como un vector o escalar, pero con tibbles eso no sucede. Compare las dos opciones a continuación:
class(murders[,4])
class(as_tibble(murders)[,4])

# Para acceder al vector que define una columna y no recuperar un data frame utilice el operador de acceso $:
class(as_tibble(murders)$population)

# Compare las dos siguientes formas. Escriba el nombre de la variable incorrectamente (Population en lugar de population) y obtendrá una advertencia si intenta acceder a una columna que no existe. Tibbles, además de advertencia, proporciona información.
murders$Population
as_tibble(murders)$Population

# Crear un tibble en lugar de un data frame
grades <- tibble(names = c("John", "Juan", "Jean", "Yao"),
                 Final_grade = c(95L, 80L, 90L, 85L),
                 exam = c(90.5, 85.5, 85.0, 94.0))

grades
