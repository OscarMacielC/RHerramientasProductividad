# ¡Instale el paquete data.table antes de usarlo!
# install.packages("data.table")

#¿Regla general?
# Undatatable[condiciones, .campos por definir o usar, agrupación y resumen]

# Cargue el paquete data.table
library(data.table)

# Cargue otros paquetes y conjuntos de datos
library(tidyverse)
library(dplyr)
library(dslabs)
data(murders)

# Convierta el data frame en un objeto data.table
murders <- setDT(murders)

# Recuerde cómo seleccionar en dplyr
select(murders, state, region)

# Ahora, seleccione en data.table por medio de 2 métodos
murders[, c("state", "region")] |> head()
murders[, .(state, region)] |> head()

# Añadir o cambiar una columna en dplyr
murders <- mutate(murders, rate = total / population * 1^5)

# Añadir o cambiar una columna en in data.table
data(murders)
murders <- setDT(murders)
murders[, rate := total / population *  1^5]
head(murders)

# Definir columnas nuevas por medio de los argumentos rate y rank
murders[, ":="(rate = total / population * 100000, rank = rank(population))]

# Es importante hacer copias de una tabla, y se refiere a x y := cambia por referencia
x <- data.table(a = 1)
y <- x

# Verificar valores de los objetos
x[,a := 2]
y
y[,a := 1]
x


# Use copy para crear una verdadera copia
xc <- data.table(a = 1)
yc <- copy(xc)
xc[,a := 2]
yc
xc

# S2_C15_Filtros -----------------------------------------

# Cargar paquetes y preparar los datos
data(murders)
murders <- setDT(murders)
murders[, rate := total / population * 100000]

# Manera de crear subconjuntos en dplyr
#filter(murders, rate <= 0.7)

# Forma de crear subconjuntos en data.table
murders[rate <= 0.7]

# Combinar filter y select en dplyr
#murders |> filter(rate <= 0.7) |> select(state, rate)

# Combinar filter y select en data.table
murders[rate <= 0.7, .(state, rate)]

# S2_C16_Resumiendo datos -----------------------------------------
# Cargar paquetes y preparar la data - conjuntos de datos de alturas
library(tidyverse)
library(dplyr)
library(dslabs)
data(heights)
heights <- setDT(heights)

# Resumir en dplyr
# s <- heights |>
#   summarize(average = mean(height), standard_deviation = sd(height))

# Resumir en data.table
s <- heights[, .(average = mean(height), standard_deviation = sd(height))]
s
# Crear subconjuntos y entonces resumir en dplyr
# s <- heights %>%
#   filter(sex == "Female") %>%
#   summarize(average = mean(height), standard_deviation = sd(height))

# Crear subconjuntos y entonces resumir en in data.table
s2 <- heights[sex == "Female", .(average = mean(height), standard_deviation = sd(height))]
s2

# Función anteriormente definida para median min max
median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
}

# Múltiples resúmenes en data.table
heights[, .(median_min_max(height))]

# Agrupar y luego resumir en data.table
heights[, .(average = mean(height), standard_deviation = sd(height)), by = sex]

# S2_C17_Ordenando datos -------------------------
data(murders)
murders <- setDT(murders)
murders[, rate := total / population * 100000]

# Ordenar por población
murders[order(rate)] |> head()

# Ordenar por población en orden descendente
murders[order(rate, decreasing = TRUE)] |> head()

# Ordenamiento anidado por región y luego tasa de homicidio
murders[order(region, rate)]
