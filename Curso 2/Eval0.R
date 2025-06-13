#install.packages("titanic")

options(digits = 3) # reportar 3 cifras significativas
library(tidyverse)
library(titanic)
library(ggplot2)

titanic <- titanic_train |>
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) |>
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

# 1 ----------------------------------------

head(titanic_train)
str(titanic_train)

#  | Variable | Tipo de variable     |
#  | -------- | -------------------- |
#  | Survived | Categoría no ordinal |
#  | Pclass   | Categoría ordinal    |
#  | Sex      | Categoría no ordinal |
#  | SibSp    | Discreta             |
#  | Parch    | Discreta             |
#  | Fare     | Continua             |
  
# 2 ----------------------------------------

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.4, position = "identity") +
  facet_wrap(~ Sex)

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.4, position = "identity")

titanic_train |>
  filter(!is.na(Age)) |>
  mutate(group = ifelse(Age < 17, "under_17", "17_or_older")) |>
  group_by(Sex, group) |>
  summarise(n = n()) |>
  mutate(prop = n / sum(n))

titanic_train |>
  filter(!is.na(Age), Age == 40) |>
  count(Sex)

titanic_train |>
  filter(!is.na(Age)) |>
  mutate(group = ifelse(Age >= 18 & Age <= 35, "age_18_35", "other")) |>
  group_by(Sex, group) |>
  summarise(n = n()) |>
  mutate(prop = n / sum(n))

titanic_train |>
  count(Sex)

titanic_train |>
  filter(!is.na(Age), Age > 60) |>
  count(Sex)


# [V]- La distribución de la edad era bimodal, con una moda alrededor de los 25 años y una segunda moda más pequeña alrededor de los 5 años.
# [F]- Los pasajeros más ancianos eran mujeres.
# [F]- Había más mujeres que hombres.
# [V]- El recuento de hombres de 40 años era mayor que el recuento de mujeres de 40 años.
# [V]- La proporción de hombres de 18-35 años era más alta que la de mujeres de 18-35 años.
# [V]- La proporción de mujeres menores de 17 años era más alta que la de hombres menores de 17 años.
# [V]- Las mujeres y los hombres tenían la misma forma general de distribución de edad.

# 3 ----------------------------------------

params <- titanic_train |>
  filter(!is.na(Age)) |>
  summarize(mean = mean(Age), sd = sd(Age))

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(sample = Age)) +
  geom_qq(dparams = list(mean = params$mean, sd = params$sd)) +
  geom_abline()

# Gráfico con línea
# Gráfico con eje de X de 0 a 75

# 4 ----------------------------------------
ggplot(titanic_train, aes(x = Sex, fill = factor(Survived))) +
  geom_bar()

ggplot(titanic_train, aes(x = factor(Survived))) +
  geom_bar()

ggplot(titanic_train, aes(x = Sex, fill = factor(Survived))) +
  geom_bar()

ggplot(titanic_train, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = position_dodge())

ggplot(titanic_train, aes(x = factor(Survived), fill = Sex)) +
  geom_bar(position = position_dodge())

# [V]- Menos de la mitad de los pasajeros sobrevivió.
# [F]- La mayoría de los hombres sobrevivió.
# [V]- La mayoría de los sobrevivientes eran mujeres.
# [V]- La mayoría de las mujeres sobrevivió

# 5 ----------------------------------------

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.2, position = "identity") +
  labs(fill = "Survived", x = "Edad", y = "Recuento")

# Edades de corte
breaks <- c(0, 8, 10, 18, 30, 50, 70, 80)
titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.7, position = "identity") +
  geom_vline(xintercept = breaks, linetype = "dashed", color = "black") +
  labs(fill = "Survived", x = "Edad", y = "Recuento") +
  scale_x_continuous(breaks = seq(0, 80, by = 10)) +
  theme_minimal()

titanic_train |>
  filter(!is.na(Age)) |>
  mutate(age_group = cut(Age,
                         breaks,
                         include.lowest = TRUE,
                         right = FALSE)) |>
  group_by(age_group, Survived) |>
  summarise(count = n()) |>
  tidyr::pivot_wider(names_from = Survived, values_from = count, values_fill = 0) |>
  mutate(
    total = `0` + `1`,
    prop_died = `0` / total
  ) |>
  arrange(desc(prop_died))

#1.- 0-8
#2.- 18-30
#3.- 70-80
  
# 6 ----------------------------------------
titanic_train |>
  filter(Fare > 0) |>
  ggplot(aes(x = factor(Survived), y = Fare)) +
  geom_boxplot(outlier.shape = NA) +  # oculta los outliers para que no se solapen con jitter
  geom_jitter(width = 0.2, alpha = 0.3, color = "blue") +
  scale_y_continuous(trans = "log2") +
  labs(x = "Supervivencia", y = "Tarifa (log2)", title = "Tarifa por Supervivencia (log2)")

# [V]- La mayoría de las personas que pagaron una tarifa de alrededor de $8 no sobrevivieron.
# [V]- La tarifa media fue más baja para los pasajeros que no sobrevivieron.
# [F]- El rango intercuartílico de las tarifas fue menor para los pasajeros que sobrevivieron.
# [V]- Los pasajeros que sobrevivieron, generalmente pagaron tarifas más altas que los que no sobrevivieron.
# [F]- Solo un individuo pagó una tarifa de alrededor de $500. Ese individuo sobrevivió.

# 7 ----------------------------------------
ggplot(titanic_train, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar() +
  labs(x = "Clase del pasajero", fill = "Supervivencia")

ggplot(titanic_train, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(x = "Clase del pasajero", y = "Proporción", fill = "Supervivencia")

ggplot(titanic_train, aes(x = factor(Survived), fill = factor(Pclass))) +
  geom_bar(position = "fill") +
  labs(x = "Supervivencia", y = "Proporción", fill = "Clase del pasajero")

# [F]- Había menos pasajeros en primera clase, el segundo mayor número de pasajeros en segunda clase y la mayoría de pasajeros en tercera clase.
# [F]- La mayoría de los sobrevivientes eran de primera clase. (La mayoría significa más del 50%).
# [V]- La mayoría de los que no sobrevivieron eran de tercera clase.
# [V]- La mayoría de los pasajeros en primera clase sobrevivieron. La mayoría de los pasajeros en otras clases no sobrevivieron.
# [V]- Había más pasajeros de tercera clase que pasajeros en las dos primeras clases combinadas.
# [V]- La proporción de supervivencia fue más alta para los pasajeros de primera clase, seguida por la segunda clase. La tercera clase tuvo la proporción de supervivencia más baja

# 8 ----------------------------------------
titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Survived))) +
  geom_density(alpha = 0.5, position = "identity", aes(y = ..count..)) +
  facet_grid(Sex ~ Pclass) +
  labs(x = "Edad", y = "Recuento", fill = "Supervivencia") +
  theme_minimal()


titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Survived))) +
  geom_histogram(position = "identity", alpha = 0.5, binwidth = 3) +
  facet_grid(Sex ~ Pclass) +
  labs(x = "Edad", y = "Conteo", fill = "Supervivencia") +
  theme_minimal()


titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = Sex)) +
  geom_density(alpha = 0.4, position = "identity") +
  facet_wrap(~ Pclass) +
  labs(x = "Edad", y = "Recuento", fill = "Sexo") +
  theme_minimal()

ggplot(titanic_train, aes(x = Sex, fill = factor(Pclass))) +
  geom_bar() +
  labs(x = "Sexo", y = "Cantidad de pasajeros", fill = "Clase") +
  theme_minimal()

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Pclass))) +
  geom_density(alpha = 0.4) +
  labs(x = "Edad", y = "Densidad", fill = "Clase del pasajero") +
  theme_minimal()

titanic_train |>
  filter(Sex == "female", Pclass %in% c(1, 2, 3)) |>
  ggplot(aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(x = "Clase del pasajero", y = "Proporción", fill = "Supervivencia") +
  theme_minimal()

#Intento númerico
titanic_train |>
  filter(Sex == "female", Pclass %in% c(1, 2)) |>
  count(Pclass, Survived) |>
  group_by(Pclass) |>
  mutate(
    total = sum(n),
    prop_survived = n / total
  )

titanic_train |>
  count(Sex, Pclass,Survived)

ggplot(titanic_train, aes(x = factor(Pclass), fill = Sex)) +
  geom_bar(position = "fill") +
  labs(x = "Clase", y = "Proporción", fill = "Género") +
  theme_minimal()

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age, fill = factor(Pclass))) +
  geom_density(alpha = 0.5) +
  labs(x = "Edad", fill = "Clase") +
  theme_minimal()

titanic_train |>
  filter(!is.na(Age)) |>
  ggplot(aes(x = Age)) +
  geom_density(fill = "steelblue", alpha = 0.5) +
  facet_wrap(~Pclass) +
  labs(x = "Edad", y = "Densidad") +
  theme_minimal()

# [V]- La mayoría de las mujeres de primera y segunda clase sobrevivieron.
# [V]- El grupo más grande de pasajeros era de hombres de tercera clase.
# [F]- La distribución de género es la misma en todas las clases de pasajeros.
# [F]- La distribución de la edad es la misma en todas las clases de pasajeros.
# [V]- Casi todos los hombres de segunda clase no sobrevivieron, con la excepción de los niños.

