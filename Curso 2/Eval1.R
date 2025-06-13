library(tidyverse)
library(dslabs)
library(ggplot2)
data(stars)
options(digits = 3) # reportar 3 dígitos significativos

# 1 -----------------------------------------------

mean(stars$magnitude)
#4.26
sd(stars$magnitude)
#7.35

# 2 -----------------------------------------------
ggplot(stars, aes(x = magnitude)) +
  geom_density(fill = "skyblue", alpha = 0.5) +
  labs(title = "Distribución de la Magnitud de las Estrellas",
       x = "Magnitud absoluta",
       y = "Densidad") +
  theme_minimal()
#Tiene 2 picos

# 3 -----------------------------------------------

ggplot(stars, aes(x = temp)) +
  geom_density(fill = "orange", alpha = 0.5) +
  labs(title = "Distribución de la Temperatura de las Estrellas",
       x = "Temperatura (Kelvin)",
       y = "Densidad") +
  theme_minimal()
#La mayoría tiene temp baja

# 4 -----------------------------------------------

ggplot(stars, aes(x = temp, y = magnitude)) +
  geom_point(color = "steelblue", size = 2) +
  labs(title = "Diagrama HR: Temperatura vs. Magnitud Absoluta",
       x = "Temperatura (Kelvin)",
       y = "Magnitud Absoluta") +
  theme_minimal()

#Exponencial decreciente

# 5 -----------------------------------------------

ggplot(stars, aes(x = log10(temp), y = magnitude)) +
  geom_point(color = "steelblue", size = 2) +
  scale_x_reverse() +          # Temperaturas altas a la izquierda
  scale_y_reverse() +          # Magnitudes brillantes arriba
  labs(
    title = "Diagrama HR: Temperatura log10 vs. Magnitud Absoluta",
    x = "log10(Temperatura en Kelvin)",
    y = "Magnitud Absoluta"
  ) +
  theme_minimal()

#1- Superior Izquierda
#2- Mayor

# 6 -----------------------------------------------

#Las enanas blancas son calientes no brillantes
#4

# 7 -----------------------------------------------

#gigantes arriba a la derecha, hay varias
# Su temperatura deben estar por el 3.7 kelvin en log
# 10^3.75 = 5623, aprox 5,000
# 5000K (kelvin)

# 8 -----------------------------------------------
library(ggrepel)
stars <- stars |>
  mutate(log_temp = log10(temp))

ggplot(stars, aes(x = log_temp, y = magnitude)) +
  geom_point(color = "gray", size = 2) +
  geom_text_repel(aes(label = star), size = 1.5, max.overlaps = 20) +
  scale_x_reverse() +
  scale_y_reverse() +
  labs(
    title = "Diagrama HR con nombres de estrellas",
    x = "log10(Temperatura en Kelvin)",
    y = "Magnitud Absoluta"
  ) +
  theme_minimal()

# Estrellas a resaltar para el ejercicio
highlighted_stars <- c("Sun", "Betelgeuse", "Antares", "vanMaanen'sStar")
stars_labeled <- stars |>
  mutate(
    log_temp = log10(temp),
    is_highlighted = star %in% highlighted_stars
  )

# Gráfico
ggplot(stars_labeled, aes(x = log_temp, y = magnitude)) +
  geom_point(aes(color = is_highlighted), size = 2) +
  geom_text_repel(
    data = filter(stars_labeled, is_highlighted),
    aes(label = star),
    size = 3,
    fontface = "bold",
    color = "black",
    max.overlaps = Inf
  ) +
  scale_x_reverse() +
  scale_y_reverse() +
  scale_color_manual(
    values = c("TRUE" = "cyan", "FALSE" = "black"),
    labels = c("Otras", "Estrellas destacadas")
  ) +
  labs(
    title = "Diagrama HR con estrellas destacadas",
    x = "log10(Temperatura en Kelvin)",
    y = "Magnitud Absoluta",
    color = "Estrella destacada"
  ) +
  theme_minimal()

#1.- Van Maanen's Star
#2.- Betelgeuse y Antares
#3.- Estrella de secuencia principal

# 9 -----------------------------------------------

# Calcular log10 de temperatura
stars_labeled <- stars |>
  mutate(log_temp = log10(temp))

# Paleta personalizada de colores (puedes ajustar los valores si quieres otros tonos)
custom_colors <- c(
  "O" = "#1f77b4",  # Azul
  "B" = "#9467bd",  # Violeta
  "A" = "#17becf",  # Cian
  "F" = "#2ca02c",  # Verde
  "G" = "#ff7f0e",  # Naranja
  "K" = "#d62728",  # Rojo claro
  "M" = "#8c564b"   # Rojo oscuro
)

# Graficar sin etiquetas, color por tipo espectral
ggplot(stars_labeled, aes(x = log_temp, y = magnitude, color = type)) +
  geom_point(size = 2) +
  scale_x_reverse() +
  scale_y_reverse() +
  scale_color_manual(values = custom_colors) +
  labs(
    title = "Diagrama HR por tipo espectral",
    x = "log10(Temperatura en Kelvin)",
    y = "Magnitud Absoluta",
    color = "Tipo espectral"
  ) +
  theme_minimal()

#1.- M
#2.- O
#3.- No