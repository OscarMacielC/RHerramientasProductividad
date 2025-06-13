full <- c("Beijing"=35,"Lagos"=88,"París"=42,"Río de Janeiro"=84,"San Juan"=81,"Toronto"=30)

temp <- c(35,88,42,84,81,30)
city <- c("Beijing","Lagos","París","Río de Janeiro","San Juan","Toronto")
names(temp) <- city

temp[c("París","San Juan")]
# Use el operador : para crear una secuencia de enteros consecutivos que empiecen en el número 12 y terminen en el 73 y guárdelo en un objeto x.
x<-12:73
#Después, determine el tamaño del objeto x.
length(x)
#Genere un vector de los números positivos nones menores a 100. Los números deberán estar en orden ascendente.
seq(1,100,2)
#Use solamente una línea de código para determinar la longitud de un vector de números que comiencen en 6, no pasen de 55 y en incrementos de 4/7 (los primeros tres números serán 6, 6+4/7 y 6+8/7).
length(seq(6,55,4/7))
#Determine la clase de un vector generado con seq utilizando el argumento length.out. Específicamente, ¿cuál es la clase del siguiente objeto a <- seq(1, 10, length.out = 100)?
a <- seq(1, 10, length.out = 100)
class(seq(1,10))
class(a)
# Defina el siguiente vector: x <- c(1, 3, 5,"a").
  # Note que x ha sido forzado a ser una serie de caracteres.
  # Use la función as.numeric() para redefinir (convertir)
  # x a un vector de números en lugar de uno de caracteres.
x <- c(1, 3, 5,"a")
as.numeric(x)
class(x)
class(as.numeric(x))
