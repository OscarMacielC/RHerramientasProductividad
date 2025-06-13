# Utilizar if else para imprimir el recíproco de a a menos que a sea 0
a <- 0
if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

# Cargar datos para analizar otro ejemplo
library(dslabs)
data(murders)
murder_rate <- murders$total/ murders$population*100000

# Utilizar if else para determinar los estados, en caso de haberlos, que tienen una tasa de homicidios inferior a 0.5 por 100,000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind])
} else{
  print("No state has murder rate that low")
}
# Ahora calcular pero con la tasa de 0.25
if(murder_rate[ind] < 0.25){
  print(murders$state[ind])
} else{
  print("No state has a murder rate that low.")
}

# Función ifelse, parecido a terniario
a <- 0
ifelse(a > 0, 1/a, NA)

# Examinar con tabla el resultado de ifelse
a <- c(0, 1, 2, -4, 5)
result <- ifelse(a > 0, 1/a, NA)

# Uso de ifelse para reemplazar los valores faltantes con 0 en una base de datos
data(na_example)
no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(no_nas)
# Examinar funciones any y all
z <- c(TRUE, TRUE, FALSE)
any(z)
all(z)
