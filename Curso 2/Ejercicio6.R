# Ejercicio 6 Introducción a ggplot2
# Oscar Eduardo Maciel Castillo

#0.- Preparación
library(data.table)
library(tidyverse)
library(dplyr)
library(dslabs)
library(ggplot2)
data(murders)
data(heights)

#1.- Fundamentos de ggplot2 ----------------------------------------------------
p <- murders |> ggplot()
respuesta1 <- class(p)
# "gg"     "ggplot"

#2.- Impresión -----------------------------------------------------------------
p
# Opción 2: Un gráfico en blanco

#3.- Pipes ---------------------------------------------------------------------
q <- heights |> ggplot()

#4.- Capas ---------------------------------------------------------------------
names(murders)
#[1] "state"      "abb"        "region"    
#[4] "population" "total"   
#Opción 3: total and population

#5.- geom_point 1 --------------------------------------------------------------
murders |>   ggplot(aes(x = population, y = total)) + 
  geom_point()

#6.- geom_point 2 --------------------------------------------------------------
murders |>   ggplot(aes(total,population)) + 
  geom_point()

#7.- geom_point text -----------------------------------------------------------
# Opción 1: Necesitamos mapear un carácter
# a cada punto a través del argumento label en aes.

#8.- geom_point text -----------------------------------------------------------
murders |>
  ggplot(aes(x = population, y = total, label = abb)) +
  geom_label()

#9.- geom_point colors ---------------------------------------------------------
# Opción 4: Usando el argumento color en geom_label

#10.- geom_point colors 2 ------------------------------------------------------
murders |>
  ggplot(aes(x = population, y = total, label = abb)) +
  geom_label(color = "blue")

#11.- geom_labels by region ----------------------------------------------------
#Opción 2: Mapeando los colores a través del argumento color de aes
# porque cada etiqueta necesita un color diferente.

#12.- geom_label colors --------------------------------------------------------
murders |>
  ggplot(aes(x = population, y = total, label = abb, color = region)) +
  geom_label()

#13.- Log-scale ----------------------------------------------------------------
p + scale_x_log10() + scale_y_log10()

#14.- Títulos ------------------------------------------------------------------
p + 
  scale_x_log10() + 
  scale_y_log10() + 
  ggtitle("Gun murder data")

#15.- Histogramas --------------------------------------------------------------
names(heights)
#[1] "sex"    "height"
#Opción 3: height

#16.- Un segundo ejemplo -------------------------------------------------------
p <- heights |> ggplot(aes(x = height))

#17.- Histogramas 2 ------------------------------------------------------------
p + geom_histogram()

#18.- Ancho de Bins del Histograma ---------------------------------------------
p + geom_histogram(binwidth = 1)

#19.- Gráfico de Densidad Suavizada --------------------------------------------
heights |>
  ggplot(aes(x = height)) +
  geom_density()

#20.- Dos Gráficos de Densidad Suavizada ---------------------------------------
heights |>
  ggplot(aes(x = height, group = sex)) +
  geom_density()

#21.- Dos Gráficos de Densidad Suavizada 2 -------------------------------------
heights |>
  ggplot(aes(x = height, color = sex)) +
  geom_density()

#22.- Dos Gráficos de Densidad Suavizada 3 -------------------------------------
heights |>
  ggplot(aes(x = height, fill = sex)) +
  geom_density(alpha = 0.2)
