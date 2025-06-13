library(dslabs)
data(murders)
sort(murders$total)

# Ordene los elementos del siguiente vector con sort
x <- c(31, 4, 15, 92, 65)
x
sort(x)

# Calcule el índice que pondrá a x en orden y reacomode por medio del índice (ordenar)
index <- order(x)
x[index]
order(x)

# Vectores que contienen los nombres de estados y abreviaturas
murders$state[1:10]
murders$abb[1:10]

# Ordene los nombres de los estados de acuerdo con el número total de asesinatos
ind <- order(murders$total)
murders$abb[ind]

# Calcule el número mayor de total de asesinatos
max(murders$total)

# Calcule el índice del valor mayor de asesinatos
i_max <- which.max(murders$total)

# Obtenga el nombre del estado con el mayor número de asesinatos
murders$state[i_max]

# Calcule el rango de un vector x con rank
x <- c(31, 4, 15, 92, 65)
x
rank(x)   
order(x)
x[order(x)]
x[c(2,3,1,5,4)]
# Genere dos vectores de distinta longitud
x <- c(1, 2, 3)
y <- c(10, 20, 30, 40, 50, 60, 70)

# Realice la suma de los dos vectores de arriba y observe la advertencia y el reciclaje del último dígito del resultado
x+y 
#se reciclan (clonan) los números del menor vector

