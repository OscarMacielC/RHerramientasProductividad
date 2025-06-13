# Podemos escribir una versión sencilla de una función que calcula el promedio así:
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

# Ahora avg es una función que calcula el promedio (también vemos que la función anterior y la función R mean() preconstruida son idénticas):
x <- 1:100
identical(mean(x), avg(x))

# Observen que las variables definidas dentro de una función no se guardan en el espacio de trabajo. Por lo tanto, mientras usamos "s" y "n" cuando llamamos (call en inglés) "avg", los valores se crean y cambian solo durante la llamada. Aquí podemos ver un ejemplo ilustrativo:
s <- 3
avg(1:10)
s

# Las funciones que definen pueden tener múltiples argumentos, así como valores predeterminados. 
# Por ejemplo, podemos definir una función que calcule el promedio aritmético o geométrico dependiendo de una variable definida por usuarios como ésta:
avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}

# S3_C5_Namespaces -----------------------
# Forzar el uso de un namespace específico con dos puntos dobles ( ::), utilice el filter del paquete stats
stats::filter
# Forzar el uso de filter del paquete dplyr
dplyr::filter

# S3_C6_Bucles -----------------------

# Genera una función que calcule la suma de los números enteros del 1 al n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
compute_s_n(100)

# Quizás el ejemplo más sencillo de un bucle - for 
for(i in 1:5){
  print(i)
}

# Un bucle - for para nuestra suma
m <- 100
s_n <- vector(length = m) # crear un vector vacío
for(n in 1:m){
  s_n[n] <- compute_s_n(n)
}
s_n
# Crear un gráfico para buscar un patrón y revisar si la fórmula anterior funciona 
n <- 1:m
plot(n, s_n)

# Genera una tabla de valores que compara nuestra función con la fórmula de suma cabeza "Formula head":
(data.frame(s_n = s_n, formula = n*(n+1)/2))

# Superponer nuestra función con la fórmula de suma
plot(n, s_n)
lines(n, n*(n+1)/2)

