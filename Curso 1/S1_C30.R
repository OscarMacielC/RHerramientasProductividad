# Continuamos con el ejemplo
library(dslabs)
data("murders")
# Para definir la tasa de homicidio como hicimos anteriormente, utilizamos:
murder_rate <- murders$total / murders$population * 100000
# Para crear un vector lógico que especifica si la tasa de homicidio en ese estado es menor a 0.71, escribimos:
ind <- murder_rate < 0.71
# Para crear un vector lógico que especifica si la tasa de homicidio en ese estado es menor o igual a 0.71, utilizamos:
ind <- murder_rate <= 0.71
# Si revisa el vector, encontrará TRUE o FALSE para cada entrada, dependiendo si cumplen con las características que especificamos
ind
# Para examinar cuáles son los estados en particular que contiene el vector y cumplen con la condición:
murders$state[ind]
# Ahora calculamos cuántos estados tienen una tasa de homicidio que cumplen con la condición de ser menor o igual a 0.71, utilizamos:
sum(ind)
# Uso de operadores lógicos, queremos que el resultado sea TRUE cuando dos condiciones sean TRUE
TRUE & TRUE
#> [1] TRUE
TRUE & FALSE
#> [1] FALSE
FALSE & FALSE
#> [1] FALSE
# Formaremos dos lógicos para nuestro ejemplo:
west <- murders$region == "West"
safe <- murder_rate <= 1
# Para definir un índice & e identificar los estados en los cuales ambas condiciones son verdaderas, utilizamos:
ind <- safe & west
murders$state[ind]
#-------
# Podemos ver la tasa de asesinatos de un estado en particular, por ejemplo California, con la función which:
ind <- which(murders$state == "California")
murder_rate[ind]

# Para ver las tasas de varios estados, por ejemplo, de New York (Nueva York), Florida, y Texas, utilizamos:
ind <- match(c("New York", "Florida", "Texas"), murders$state)

# Podemos analizar en qué lugar se encuentran cada uno de estos estados:
ind
# Ahora podemos ver la tasa de asesinatos de esos tres estados:
murder_rate[ind]

# Función %in% para ver si Boston, Dakota, and Washington son estados, utilizamos:
c("New Mexico", "Mexico", "Dakota", "Washington") %in% murders$state
