# Ejercicio 4 Cuantiles, percentiles y diagramas de caja
# Oscar Eduardo Maciel Castillo

#1.- Proporciones --------------------------------------------------------------
library(data.table)
library(tidyverse)
library(dplyr)

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]

result1 <- mean(x > 69 & x <= 72)
# 0.3337438

#2.- Distribuciones promedio y estándar ----------------------------------------  
avg <- mean(x)
stdev <- sd(x)

prob72 <- pnorm(72, avg, stdev)
prob69 <- pnorm(69, avg, stdev)
result2 <- prob72-prob69
# 0.3061779

#3.- Aproximaciones ------------------------------------------------------------
result3 <- result1 / result2
# 1.090032

#4.- Jugadores de siete pies y la NBA ------------------------------------------
player_ft <- 7
player_in <- player_ft*12
smaller_7ft <- pnorm(player_in, mean = 69, sd = 3)
taller_7ft <- 1 - smaller_7ft
result4 <- taller_7ft
# 2.866516e-07

#5.- Estimación del número de jugadores de siete pies  -------------------------
p <- taller_7ft
result5 <- round(p * 10^9)
# 287

#6.- ¿Cuántos jugadores de siete pies hay en la NBA?  --------------------------
jugadores_activos <- 10
result6 <- jugadores_activos / N
# 0.03484321

#7.- Altura de Lebron James ----------------------------------------------------
lebron_in <- (6*12) + 8
lebron_p <- 1 - pnorm(lebron_in, mean = 69, sd = 3)
lebron_N <- round(lebron_p * 10^9)
nba_80in <- 150
result7 <- nba_80in/lebron_N
# 0.001220842

#8.- Interpretación ------------------------------------------------------------
# Opción 3: Como se ve en el ejercicio 3,
# la aproximación normal tiende a subestimar los valores extremos.
# Es posible que haya más jugadores de siete pies de lo que predijimos.
result8 <- 'Opción 3'
