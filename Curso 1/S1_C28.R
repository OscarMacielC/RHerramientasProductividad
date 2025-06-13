# Cargar paquete y datos
library(dslabs)
data("murders")

# Obtener el nombre del estado con la mayor población
murders$state[which.max(murders$population)]

# Operaciones aritméticas con vectores (ejemplo de altura en pulgadas)
inches <- c(69, 62, 66, 70, 70, 73, 67, 73, 67, 70)

# Convertir a centímetros multiplicando inches por 2.54
inches * 2.54
# Calcular qué tan alto o bajo respecto a 69 pulgadas, se utiliza la resta
inches - 69

# Calcular la tasa de asesinatos
murder_rate <- murders$total / murders$population * 100000

# Ordenar los estados por tasa de asesinatos, en orden decreciente
murders$state[order(murder_rate, decreasing=TRUE)]
murders$abb[order(murder_rate, decreasing=TRUE)]

