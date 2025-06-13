# Modifique el código de abajo para que devuelva "Por lo menos un número es positivo" 
# si ese es el caso o "Ningún número es positivo" de otra manera.
x <- c(1,2,-3,4)
if(any(x>0)){
  print("Algun numero es positivo")
}else{
  print("Ningún número es positivo")
}
# Ejercicio 2 ----- Any negado

# Defina una variable `x` como un vector de lógicos con al menos 
# dos elementos
x <- c(TRUE, FALSE, FALSE, TRUE, FALSE)
# Escriba una línea de código usando la función `any` que devuelva
# FALSE cuando `x` contenga por lo menos un verdadero.
!any(x>0) #Resultado esperado
ifelse(any(x>0),FALSE,TRUE) # Otro resultado

# Ejercicio 3 ----- All negado
# Defina una variable `x` como un vector de lógicos con al menos 
# dos elementos

x <- c(FALSE, FALSE, FALSE)
# Escriba una línea de código usando la función `all` que devuelva 
# TRUE cuando `x` contenga solo falsos .
all(!x)#Resultado esperadoo
all(x==F) # Otro resultado

#Ejercicio 4 -------- ifelse
library(dslabs)
data(murders)

# Use la función ifelse para escribir una línea de código que asigna al objeto 
# "new_names" la abreviatura del estado cuando el nombre del estado tiene más 
# de 8 caracteres y que asigna el nombre del estado cuando el nombre tiene 8 # 
# caracteres o menos. 
new_names=ifelse(nchar(murders$state)>8,murders$abb,murders$state)
                 
#Ejercicio 5 -------- sumatoria

# Calcule la sumatoria cuando `n` es igual a cada número entero del 1 al 25 
# usando la función `compute_s_n` 
# Cree la función llamada `sum_n`
# Use la función para determinar la suma de enteros del 1 al 5000

compute_s_n <- function(num){
  s_n <- numeric(25)
  for (n in 1:num) {
    s_n[n] <- sum_n(n)
  }
  return(s_n)
}

sum_n <- function(num){
  result <- 0
  for(n in 1:num){
    result <- result+n
  }
  return(result)
}

compute_s_n(25)
sum_n(5000)
#Ejercicio 6 -------- Altman_plot

# Complete el código faltante pare crear "altman_plot" que toma dos 
# argumentos x y y y grafica y-x (en el eje y) contra x+y (en el eje x)

altman_plot <- function(x, y) {
  plot(x + y, y - x)
  return(NULL)
}

x <- c(1, 2, 3, 4, 5, 6)
y <- c(2, 4, 1, 5, 7, 4)

altman_plot(x, y)

#Ejercicio 7 -------- Namespaces
# Escriba el número que resultará al llamar el código presentado en las instrucciones


my_func <- function(x){
  x <- x + 1
  print(x)
  return(NULL)
}

x <- 1
my_func(x)
print(x)


x <- 3
my_func <- function(y){
  x <- 5
  y
  print(x)
}
my_func(x)


#Ejercicio 8 -------- Bucle for

example_func <- function(n){
  sum(1:n)
}
example_func(100)

compute_s_n <- function(n){
  sum <- 0
  for(i in 1:n){
    sum <- sum+i^2
  }
  return(sum)
}
compute_s_n(10)

#Ejercicio 9 -------- Cuadrados

# Definir una función y guardarla en `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Definir un vector numérico vacío `s_n` de tamaño 25
s_n <- numeric(25)
# Calcule la sumatoria cuando `n` es igual a cada número entero del 1 al 25 
# usando la función `compute_s_n` 
for (i in 1:25) {
  s_n[i] <- compute_s_n(i)
}

s_n

#Ejercicio 10 -------- Demostración graficada

# Definir una función y guardarla en `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Definir el vector de `n`
n <- 1:25

# Definir el vector para almacenar datos
s_n <- vector("numeric", 25)

# Calcular la sumatoria cuando `n` es igual a cada número entero del 1 al 25 
# usando la función `compute_s_n` 
for (i in 1:25) {
  s_n[i] <- compute_s_n(i)
}

plot(n, s_n)

#Ejercicio 11 -------- Comprobación

# Definir una función y guardarla en `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Definir el vector de `n`
n <- 1:25

# Definir el vector para almacenar datos
s_n <- vector("numeric", 25)

# Calcular la sumatoria cuando `n` es igual a cada número entero del 1 al 25 
# usando la función `compute_s_n`
# Verifique que s_n sea idéntico a la fórmula dada en las instrucciones.
identical(s_n, n*(n+1)*(2*n+1)/6)
