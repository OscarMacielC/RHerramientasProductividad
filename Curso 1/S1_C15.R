# Para cargar el paquete dslabs y el set de datos de "murders" utilicen:
library(dslabs)
data(murders)

# Para determinar si el set de datos es parte de la clase de (dataframe) utilicen:
class(murders)

# Si quieren investigar un poco más de la estructura del objeto utilicen:
str(murders)

# Para ver las primeras 6 líneas del set de datos utilicen:
head(murders) 

# Para obtener la columna de la población utilicen:
murders$population

# Para mostrar los nombres de las variables del set de datos "murders" utilicen:
names(murders)

# Escriban "murders$p" puesto que autocompleta o usar TAB
murders$p
