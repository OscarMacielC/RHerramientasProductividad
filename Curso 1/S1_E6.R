library(dslabs)
data(murders)

# Guarde la tasa (rate) de homicidios por cada 100,000 para cada estado, en 
#`murder_rate`
murder_rate <- murders$total / murders$population * 100000

# Guarde los valores de tasas (rate) de homicidio por cada 100,000 que sean menores 
#que 1,`murder_rate < 1`, en el objeto `low` 
low <- murder_rate[which(murder_rate < 1)]
low2 <- murder_rate[murder_rate < 1]
# Determine los índices murder_rate asociados con los valores menores a 1
which(murder_rate < 1)
#-----------------
# Nombres de los estados con tasas de homicidio menores a 1
murders$state[which(murder_rate < 1)]
# Cree un vector `ind` para estados localizados en el noreste y con tasas de 
#homicidio menores que 1. 
northeast <- murders$region == "Northeast"
ind <- low & northeast
# Nombres de estados `ind` 
murders$state[ind]
#-----------------
# Calcule la tasa promedio de homicidio usando `mean` y guárdela en un objeto 
#llamado `avg`
avg=mean(murder_rate)
# ¿Cuántos estados tienen tasas de homicidio por debajo de avg? Compruebe esto 
#usando `sum`
sum((murder_rate < avg))
#-----------------
# Guarde las 3 abreviaturas de interés en un vector llamado `abbs` 
# (recuerde que son vectores de caracteres y requieren comillas)
abbs <- c("AK", "MI","IA")
# Relacione los abbs a los murders$abb y guárdelo en `ind`
ind <- match(abbs, murders$abb)
# Imprima desde `ind` los nombres de los estados
murders$state[ind]
#-----------------
# Guarde las 5 abreviaturas de interés en `abbs`. (recuerde que son vectores de 
# caracteres)
abbs <- c("MA", "ME","MI","MO","MU")
# Use el operador %in% para comprobar si las entradas de `abbs` son 
# abreviaturas en el data frame de homicidios
abbs %in% murders$abb
#-----------------
# Use la función `which` y el operador `!` para averiguar 
# cuáles de las abreviaturas indexadas no forman parte del conjunto 
# de datos y guárdelas en `ind`
ind <- which(!abbs %in% murders$abb)
# Muestre las entradas de abbs que no son abreviaturas reales
abbs[ind]
