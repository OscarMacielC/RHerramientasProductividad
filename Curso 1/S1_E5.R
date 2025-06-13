# Asigne los nombres de las ciudades a `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Guarde los valores de las temperaturas en `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Convierta la temperatura a Celsius y reescriba los valores originales de 
temp_c <- (5/9) * (temp-32) 
#'temp' con los valores Celsius 

# Genere un data frame llamado `city_temps` 
city_temps <- data.frame(name = city, temperature = temp)

#--------------------------

# ¿Cuál es la suma de la siguiente ecuación: 1 + 1/2^2 + 1/3^2 + ... + 1/100^2? Gracias a Euler sabemos que debe ser cercana a pi^2/6.
# Defina un objeto x que contenga los números del 1 al 100.
x <- seq(1,100)
sum(1/x^2)
#aprox pi^2/6

#-------------------------

library(dslabs)
data(murders)

# Guarde la tasa de homicidios por 100,000 para cada estado y guárdela en un objeto "murder_rate"
murder_rate=murders$total/murders$population*100000
# Calcule el promedio de estas tasas de homicidio y escriba cuál es el promedio
mean(murder_rate)
