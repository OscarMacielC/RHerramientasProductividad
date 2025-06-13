vec_num <- c(11, 2, 67, 4, 53)
vec_num > 10
over10 <- vec_num[vec_num>10]

max1=max(vec_num)
max2=sort(vec_num, decreasing = T)[1]
# generar secuencia saltada
seq(1, 10, by = 2)


#Entrando a un dataframe con dplyr la columna
library(dplyr)

df %>% select(nombre)
# o con select(df,nombre)


# Revisando una matriz
list_vect <- list(
  a = c(1, 2, 3),
  b = c(4, 5, 6),
  c = c(7, 8, 9),
  d = c(10, 11, 12)
)

list_vect$b[3]
list_vect[[2]][3]

#dataframe

df <- data.frame(
  edad = c(20, 25, 30, 35),
  altura = c(160, 170, 175, 180)
)

df$edad_doble <- df$edad * 2

### df[df$edad > 12 & df$altura > 150]

#dividir vector en 2 mitades
x <- seq(10, 70, by = 10)

mitad <- round(length(x) / 2)

v1 <- x[1:mitad]
v2 <- x[(mitad + 1):length(x)]

#ordenar factores
x <- c("bajo", "medio", "alto", "medio", "alto")
f <- factor(x)
levels(f)

#removiendo nas
mean(x,na.rm =T)

#Paquete tidyverse


