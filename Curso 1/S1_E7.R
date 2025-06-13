# Cargar paquetes y datos
library(dplyr)
library(dslabs)
data("murders")

# Gráfico de total de asesinatos versus población
x <- murders$population/ 10^6
y <- murders$total
plot(x, y)

# Uso de with para crear un gráfico rápido que no accede a las variables dos veces
with(murders, plot(population, total))
# Histograma de las tasas de homicidio
x <- with(murders, total/ population * 10^6)
hist(x)

# La función image muestra los valores en una matriz usando color
x <- matrix(1:120, 12, 10)
image(x)
###--------------------------------------
# Defina algunas variables (tome en cuenta que el conjunto de datos ha sido 
#cargado para usted)
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)
# Transforme la población (la población original, sin ajustar, no la población 
# en millones) usando la transformación logarítmica en base 10 y guárdela en el 
# objeto "log10_population" y transforme el total de homicidios con arma usando 
# la transformación logarítmica en base 10 y guárdela en el objeto 
# "log10_total_gun_murders"
log10_population <- log10(murders$population)
log10_total_gun_murders <- log10(total_gun_murders)
# Cree un gráfico de dispersión con la población transformada logarítmicamente y los homicidios
plot(log10_population, log10_total_gun_murders)
#----------------------------------
# Cree un histograma de la poblacion en millones
hist(population_in_millions)
#----------------------------
# En una sola línea de código, estratifique las poblaciones estatales por región y genere diagramas de caja para los estratos para el set de datos "murders"
with(murders,boxplot(population~region))
