# Ejercicio 8 - principios de visualización de datos, parte 1
# Oscar Eduardo Maciel Castillo

##remotes::install_github("r-lib/styler")
##CTRL+SHIFT+P
library(dslabs)
library(dplyr)
library(ggplot2)
data(gapminder)

#0 para guardar a word más directo
windows(width = 7, height = 5)
savePlot(filename = "clipboard", type = "wmf")

#1.- Esperanza de vida vs fertilidad - parte 1 ----------------------------  
gapminder |>
  filter(continent == "Africa", year == 2012) |>
  ggplot(aes(x = fertility, y = life_expectancy)) +
  geom_point()

#2.- Esperanza de vida vs fertilidad - parte 2 - coloreando tu gráfico ---  
#Revisando las regiones que existen
gapminder |>
  filter(continent == "Africa", year == 2012) |>
  distinct(region)

# Haciendo el gráfico por región
gapminder |>
  filter(continent == "Africa", year == 2012) |>
  ggplot(aes(x = fertility, y = life_expectancy, color = region)) +
  geom_point()

#3.- Esperanza de vida vs. fertilidad - parte 3 - seleccionando país y región  
df <- gapminder |>
  filter(continent == "Africa",
         year == 2012,
         fertility <= 3,
         life_expectancy >= 70) |>
  select(country, region)

#4.- Esperanza de vida y la Guerra de Vietnam - parte 1 ------------------  
mycountries <- c("Vietnam", "United States")

tab <- gapminder |>
  filter(country %in% mycountries, year >= 1960, year <= 2010)

head(tab)

#5.- Esperanza de vida y la Guerra de Vietnam - parte 2 ------------------  
ggplot(tab, aes(x = year, y = life_expectancy, color = country)) +
  geom_line()

#6.- Esperanza de vida en Camboya ----------------------------------------  
gapminder |>
  filter(country == "Cambodia", year >= 1960, year <= 2010) |>
  ggplot(aes(x = year, y = life_expectancy)) +
  geom_line()

#7.- Dólares por día - parte 1 -------------------------------------------  
daydollars <- gapminder |>
  mutate(dollars_per_day = gdp / population / 365) |>
  filter(continent == "Africa", year == 2010, !is.na(dollars_per_day))

head(daydollars)

#8.- Dólares por día - parte 2 -------------------------------------------  
ggplot(daydollars, aes(x = dollars_per_day)) +
  geom_density() +
  scale_x_continuous(trans = "log2")

#9.- Dólares por día - parte 3 - múltiples gráficos de densidad ----------  
daydollars <- gapminder |>
  mutate(dollars_per_day = gdp / population / 365) |>
  filter(continent == "Africa",
         year %in% c(1970, 2010),
         !is.na(dollars_per_day))

ggplot(daydollars, aes(x = dollars_per_day)) +
  geom_density() +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)

#10.- Dólares por día - parte 4 - gráfico de densidad apilado -------------  
ggplot(daydollars, aes(x = dollars_per_day, fill = region)) +
  geom_density(bw = 0.5, position = "stack") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)

#11.- Gráfico de dispersión de mortalidad infantil - parte 1 --------------  
gapminder_Africa_2010 <- gapminder |>
  mutate(dollars_per_day = gdp / population / 365) |>
  filter(continent == "Africa",
         year == 2010,
         !is.na(dollars_per_day),
         !is.na(infant_mortality))

ggplot(gapminder_Africa_2010, aes(x = dollars_per_day, y = infant_mortality, color = region)) +
  geom_point()

#12.- Gráfico de dispersión de mortalidad infantil - parte 2 - eje logarítmico  
ggplot(gapminder_Africa_2010, aes(x = dollars_per_day, y = infant_mortality, color = region)) +
  geom_point() +
  scale_x_continuous(trans = "log2")

#13.- Gráfico de dispersión de mortalidad infantil - parte 3 - añadiendo etiquetas  
ggplot(gapminder_Africa_2010, aes(x = dollars_per_day, y = infant_mortality, label = country, color = region)) +
  geom_text() +
  scale_x_continuous(trans = "log2")

#14.- Gráfico de dispersión de mortalidad infantil - parte 4 - comparación de gráficos de dispersión
gapminder_africa_1970_2010 <- gapminder |>
  mutate(dollars_per_day = gdp / population / 365) |>
  filter(continent == "Africa",
         year %in% c(1970, 2010),
         !is.na(dollars_per_day),
         !is.na(infant_mortality))

ggplot(gapminder_africa_1970_2010,
       aes(x = dollars_per_day, y = infant_mortality, label = country, color = region)) +
  geom_text() +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)
