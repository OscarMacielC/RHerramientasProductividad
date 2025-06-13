# Ejercicio 5 Resúmenes robustos con valores atípicos
# Oscar Eduardo Maciel Castillo

#0.- Preparación
library(data.table)
library(tidyverse)
library(dplyr)
library(dslabs)

#install.packages("HistData")

#1.- Explorando el conjunto de datos de Galton: promedio y mediana -------  
library(HistData)
data(Galton)
x <- Galton$child

mean(x)
# 68.08847
median(x)
# 68.2

#2.- Explorando el conjunto de datos de Galton - DE y MAD ----------------  
sd(x)
# 2.517941
mad(x)
# 2.9652

#3.- Impacto del error en el promedio -----------------------------------  
x_with_error <- x
if(x_with_error[1]<100)
{
  x_with_error[1] <- x_with_error[1]*10
}

mean(x_with_error)
# 68.68685
result3 <- abs(mean(x)-mean(x_with_error))
# 0.5983836 inches difference

#4.- Impacto del error en la DE -----------------------------------------  
result4 <- abs(sd(x)-sd(x_with_error))
#15.6746

#5.- Impacto del error en la mediana ------------------------------------  
result5 <- abs(median(x)-median(x_with_error))
#0

#6.- Impacto del error en la MAD ----------------------------------------  
result6 <- abs(mad(x)-mad(x_with_error))
#0

#7.- Utilidad del Análisis Exploratorio de Datos (EDA) ------------------  
# Opción 3: Un diagrama de caja, histograma o gráfico qq
# revelaría claramente un valor atípico.

#8.- Utilizando EDA para explorar cambios -------------------------------
error_avg <- function(k) {
  x_modified <- x
  x_modified[1] <- k
  return(mean(x_modified))
}

error_avg(10000)
# 78.79784
error_avg(-10000)
# 57.24612
