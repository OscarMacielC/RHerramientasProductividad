library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

# 1 -----------------------------------------------

# *** Parcialmente correcto 0.67 -.-
# [F]- temp_carbon |> filter(!is.na(carbon_emissions)) |> max(.$year)
# [F]- temp_carbon |> filter(!is.na(carbon_emissions)) |> max(year)
# [F]- temp_carbon |> .$year |> max()
# [F]- temp_carbon |> filter(!is.na(carbon_emissions)) |> .$year |> max()
# [V]- temp_carbon |> filter(!is.na(carbon_emissions)) |> select(year) |> max()
# [V]- temp_carbon |> filter(!is.na(carbon_emissions)) |> pull(year) |> max()

# 2 -----------------------------------------------

first_year <- temp_carbon |>
  filter(!is.na(carbon_emissions)) |>
  pull(year) |>
  min()
last_year <- temp_carbon |>
  filter(!is.na(carbon_emissions)) |>
  pull(year) |>
  max()

first_emission <- temp_carbon |>
  filter(year == first_year) |>
  pull(carbon_emissions)

last_emission <- temp_carbon |>
  filter(year == last_year) |>
  pull(carbon_emissions)
ratio <- last_emission / first_emission

#1.-1751
#2.-2014
#3.-3285

# 3 -----------------------------------------------

first_year <- temp_carbon |>
  filter(!is.na(temp_anomaly)) |>
  pull(year) |>
  min()

last_year <- temp_carbon |>
  filter(!is.na(temp_anomaly)) |>
  pull(year) |>
  max()

first_temp <- temp_carbon |>
  filter(year == first_year) |>
  pull(temp_anomaly)

last_temp <- temp_carbon |>
  filter(year == last_year) |>
  pull(temp_anomaly)

change <- last_temp - first_temp

# Mostrar resultados
cat("1. ", first_year, "\n2. ", last_year, "\n3. ", round(change, 2), "\n")
       
#1.-1880
#2.-2018
#3.-0.93

# 4 -----------------------------------------------

library(ggplot2)

p <- temp_carbon |>
  filter(!is.na(temp_anomaly)) |>
  ggplot(aes(x = year, y = temp_anomaly)) +
  geom_line(color = "firebrick") +
  labs(title = "Anomalía de temperatura global por año",
       x = "Año",
       y = "Anomalía de temperatura (°C)") +
  theme_minimal()

# Respuesta, debe ser hline y blue entre comillas
p <- p + geom_hline(aes(yintercept = 0), col = "blue")

p

# 5 -----------------------------------------------

#Ésta es la respuesta, pero se ve mejor usando annotate
p + ylab("Anomalía de temperatura (grados C)") +
  ggtitle("Anomalía de temperatura relativa a la media del siglo XX, 1880-2018") +
  geom_text(aes(x = 2000, y = 0.05, label = "Media del siglo XX"), col = "blue")

p

p <- p +
  labs(
    y = "Anomalía de temperatura (grados C)",
    title = "Anomalía de temperatura relativa a la media del siglo XX, 1880-2018"
  ) +
  annotate(
    "text",
    x = 2000,
    y = 0.05,
    label = "Media del siglo XX",
    color = "blue"
  )

p

# 6 -----------------------------------------------

temp_carbon |>
  filter(!is.na(temp_anomaly), temp_anomaly > 0) |>
  slice_min(year)
#1939
temp_carbon |>
  filter(!is.na(temp_anomaly), temp_anomaly < 0) |>
  slice_max(year)
#1976
temp_carbon |>
  filter(!is.na(temp_anomaly), temp_anomaly > 0.5) |>
  slice_min(year)
#1997

#1.- 1939
#2.- 1976
#3.- 1997

# 7 -----------------------------------------------

p <- p +
  geom_line(aes(y = land_anomaly, color = "Tierra"), linewidth = 0.7, na.rm = TRUE) +
  geom_line(aes(y = ocean_anomaly, color = "Océano"), linewidth = 0.7, na.rm = TRUE) +
  scale_color_manual(
    name = "Tipo de anomalía",
    values = c(
      "Global" = "firebrick",
      "Tierra" = "forestgreen",
      "Océano" = "steelblue"
    )
  )

p

#1.- Tierra
#2.- Tierra
#3.- Océano

# 8 -----------------------------------------------

greenhouse_gases |>
  ggplot(aes(x = year, y = concentration)) +
  geom_line() +
  facet_grid(gas ~ ., scales = "free") +
  geom_vline(xintercept = 1850) +
  ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
  ggtitle("Concentración de gases de efecto invernadero atmosférico por año, 0-2000")

#8.1
#year, concentration ...
#8.2
#gas ~ .   ...
#8.3
#geom_vline(xintercept = 1850) .  ...

# 9 -----------------------------------------------

#*** Parcialmente correcto *** 0.4
#*
#*creo que por poner n2o en lugar de no2
#1.- n2o
#2.- ch4
#3.- ninguno
#4.- n2o
#5.- co2

# 10 ----------------------------------------------

temp_carbon |>
  filter(!is.na(carbon_emissions)) |>
  ggplot(aes(x = year, y = carbon_emissions)) +
  geom_line(color = "darkred") +
  labs(
    x = "Año",
    y = "Emisiones de carbono (toneladas métricas por año)",
    title = "Emisiones de carbono a lo largo del tiempo"
  ) +
  theme_minimal()

# *** Parcialmente correcto 0.75 ¿Quizá no siempre suben?
# [F]- Las emisiones de carbono cambian con la misma tendencia que los niveles de gases de efecto invernadero atmosféricos (co2, ch4, n2o)
# [F]- Las emisiones de carbono han aumentado cada año registrado.
# [F]- Las emisiones de carbono están alcanzando un nivel estable.
# [V]- Las emisiones de carbono se han duplicado desde finales de los años 70.
# [V]- Las emisiones de carbono en 2014 fueron aproximadamente 4 veces mayores que las de 1960.
# [V]- Las emisiones de carbono eran esencialmente cero antes de 1850 y han aumentado exponencialmente desde entonces

# 11 ----------------------------------------------

co2_time <- historic_co2 |>
  ggplot(aes(x = year, y = co2, color = source)) +
  geom_line() +
  labs(
    title = "Concentración de CO₂ atmosférico a lo largo del tiempo",
    x = "Año",
    y = "Concentración de CO₂ (ppm)",
    color = "Fuente"
  ) +
  theme_minimal()
co2_time

# *** Parcialmente correcto 0.33

# [V]- En la mayoría de los casos, parece que lleva más tiempo para que los niveles de co2 disminuyan que para aumentar.
# [V]- Hay ciclos naturales de aumento y disminución de co2 que duran 50,000-100,000 años por ciclo.
# [F]- La concentración de co2 ha sido al menos 200 ppm durante los últimos 800,000 años.
# [V]- Los niveles actuales de co2 son más altos que en cualquier punto de los últimos 800,000 años.

# 12 ----------------------------------------------

co2_time + coord_cartesian(xlim = c(-800000, -775000))
co2_time + coord_cartesian(xlim = c(-375000, -330000))
co2_time + coord_cartesian(xlim = c(-140000, -120000))
co2_time + coord_cartesian(xlim = c(-3000, 2018), ylim= c(275,410))

# 1.- 10,000
# 2.- 25,000
# 3.- 9,000
# 4.- 250