library(dplyr)
library(ggplot2)
library(dslabs)
library(tidyr)

data("murders")

murders |>
  group_by(region) |>
  summarise(total_asesinatos = sum(total)) |>
  ggplot(aes(x = region, y = total_asesinatos, fill = region)) +
  geom_col() +
  labs(
    title = "Total de asesinatos por región",
    x = "Región",
    y = "Total de asesinatos"
  ) +
  theme_minimal()

murders |>
  mutate(tasa = total / population * 100000) |>
  ggplot(aes(x = population, y = tasa, color = region)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_x_log10() +
  labs(
    title = "Tasa de asesinatos vs población",
    x = "Población (escala logarítmica)",
    y = "Tasa de asesinatos por 100,000 habitantes"
  ) +
  theme_minimal()
