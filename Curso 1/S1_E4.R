library(dslabs)
data(murders)

# Acceda a la variable `state` (estados) y guárdela en un objeto llamado 'states' 
states <- murders$state 

# Clasifique el objeto alfabéticamente y redefina el objeto states  
states <- sort(states) 

# Reporte el primer valor alfabético   
states[1]

# Acceda a los valores de la población (population) del set de datos y 
#guárdelo en "pop"
pop <- murders$population 
# Clasifique el objeto y guárdelo en el mismo objeto 
pop <- sort(pop)
# Reporte el menor tamaño de población en "pop" 
pop[1]
# Use el comando order para encontrar el vector de índices que ordena pop y 
#guárdelo en un objeto llamdo 'ord' 
ord <- order(pop)
# Encuentre el número del índice de la entrada con el tamaño de población más 
#pequeña 
ord[1]
# Encuentre el índice del valor más pequeño de población
which.min(murders$population)
# Defina la variable i para ser el índice del estado más pequeño 
i <- which.min(murders$population)
# Defina la variable states que guarde a los estados 
states <- (murders$state)
# Use el índice que acaba de definir y states para encontrar el estado con la población 
#más pequeña
states[i]

# Guarde las temperaturas en un objeto llamado 'temp' 
#temp <- c(35, 88, 42, 84, 81, 30)

# Guarde los nombres de las ciudades en un objeto 'city'  
#city <- c("Beijing", "Lagos", "París", "Río de Janeiro", "San Juan", "Toronto")

# Genere un data frame con los nombres de las ciudades y las temperaturas 
#city_temps <- data.frame(name = city, temperature = temp)

# Defina una variable estados 'states' para que contenga el nombre de los 
#estados provenientes del set de datos murders
states <- (murders$state)
# Defina una variable de rangos 'ranks' para determinar el rango de los tamaños 
#de la población  
ranks <- rank(murders$population)
# Genere un data frame my_df con el nombre de los estados y su rango 
my_df <- data.frame(name = states, rank = ranks)
# Genere una variable 'ind' para guardar los índices necesarios para ordenar 
#los valores de la población con el comando order.
ind <- order(murders$population)
# Genere un data frame 'my_df' con el nombre del estado y su rango ordenado 
#del de menor población al de mayor población 
my_df <- data.frame(name = states[ind], rank = ranks[ind])
# ------------------------
# Utilizar el nuevo set de datos 
library(dslabs)
data(na_example)

# Revisar la estructura 
str(na_example)

# Encontrar cuál es el promedio del set de datos completo 
mean(na_example)

# Use 'is.na' para crear un índice lógico en un objeto llamado 'ind' que diga qué entradas son NA
ind <- is.na(na_example)
# Determine cuántos NA existen en la variable ind por medio de la función sum 
sum(ind)
#-------------------
# Cuando intentamos calcular el promedio, obtenemos como respuesta NA 
mean(na_example)
# Calcule el promedio (la media) de 'na_example' después de remover las 
#entradas  `NA` por medio de usar el operador '!' en 'ind'
mean(na_example[!ind])
