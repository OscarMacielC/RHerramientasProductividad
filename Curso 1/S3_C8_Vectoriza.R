# Ejemplos de funciones vectorizadas para las cuales no se requiere bucles-for.
x <- 1:10
sqrt(x)
y <- 1:10
x*y

# Este fragmento de código no ejecuta la función en cada entrada de n
n <- 1:25
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}
compute_s_n(n)

# Uso de la función sapply
x <- 1:10
sapply(x, sqrt)

# Reescribir el bucle-for anterior
n <- 1:25
s_n <- sapply(n, compute_s_n)
s_n
