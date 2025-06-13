# Ejercicio 2 Visualización de datos en R
# Oscar Eduardo Maciel Castillo

#1.- Longitudes de vectores -----------------------------------------------
library(data.table)
library(tidyverse)
library(dplyr)
library(dslabs)
data(heights)
names(heights)

heights <- setDT(heights)

#Obteniendo los datos por sexo
male <-  heights[sex == "Male", .(height)]
female <-  heights[sex == "Female", .(height)]

#revisando columnas
nrow(male)   # 812
nrow(female) # 238

######## Hacerlo directamente desde la tabla

#male_count <-  heights[sex == "Male", .N]     # 812
#female_count <-  heights[sex == "Female", .N] # 238

######## Ambos en una línea

#heights[, .N, by = sex]

#2.- Percentiles ---------------------------------------------------------
female_percentiles <- quantile(female[,height], probs = c(0.1, 0.3, 0.5, 0.7, 0.9))
male_percentiles   <- quantile(male[,height], probs = c(0.1, 0.3, 0.5, 0.7, 0.9))

percentile_names <- c("p10", "p30", "p50", "p70", "p90")

df <- data.frame( #dt <- data.table(  para seguir con tables
  percentile = c("p10", "p30", "p50", "p70", "p90"),
  female = as.vector(female_percentiles),
  male   = as.vector(male_percentiles)
)
df

#3.- Interprentando Boxplots 1 -------------------------------------------
data(gapminder)

# Revisando los datos
names(gapminder)
str(gapminder)
glimpse(gapminder)
head(gapminder)

#Convirtiendo a tabla y quitando NAs o toda la suma sale NA
gapminder <- na.omit(gapminder)
gapminder <- setDT(gapminder)

# Agrupar por continente y sumar población
# Primero: Suma la población por continente
# Segundo: Ordena por población descendente
# Tercero: Toma solo el primer continente y muestra el continente y la población total
gapminder[, .(total_population = sum(population)), by = continent][order(-total_population)][1, .(continent, total_population)]

# Agregando aesthetic mapping para x,y,fill
# Usando geom_boxplot y scale_y_log10 (o no se ve bien)
ggplot(gapminder, aes(x = continent, y = population, fill = continent)) +
  geom_boxplot() +
  scale_y_log10() +
  ylab("Población (log10)") +
  xlab("Continente") +
  ggtitle("Distribuciones de poblaciones por continente") +
  theme_minimal()

boxplot(population ~ continent, data = gapminder, log = "y",
        col = c("salmon", "yellow", "green", "skyblue", "magenta"),
        main = "Población por continente",
        ylab = "Población (log10)")

# RESPUESTA Opción 3: Asia con 3977014332

#4.- Interprentando Boxplots 2 -------------------------------------------
#¿Qué continente tiene la mediana de población más grande?
#También Opción 3: Asia en el gráfico se ve la línea media más arriba

#5.- Interprentando Boxplots 3 -------------------------------------------
#Al millón más cercano, ¿cuál es el tamaño mediano de la población para África?
#No entregaron una gráfica por lo que usaré la mia, 1e+07

#6.- Cuantiles bajos ----------------------------------------------------
#¿qué proporción de países en Europa tienen poblaciones por debajo de 14 millones?
# No entregaron una gráfica, pero hay un .5 debajo de la mediana

#7.- Rango Inter-Cuartil ----------------------------------------------------
# ¿qué continente mostrado a continuación tiene el rango intercuartílico más grande para log(población)?
# En mi gráfica es Oceanía


