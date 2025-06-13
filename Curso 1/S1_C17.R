# Los vectores pueden ser de clases numéricas y de caracteres
class(murders$pop)
length(murders$pop)
class(murders$state)
length(murders$state)

# Vectores lógicos son verdaderos (TRUE) o falsos (FALSE)
z <- 3 == c(1, 3)
z
class(z)
length(z)

# Los factores son otro tipo de clases
class(murders$region)

# Para obtener los niveles de un factor utilice:
levels(murders$region)

#Tome la suma del total de asesinatos en cada región y reordene el factor según estas sumas:
region <- murders$region
value <- murders$total
region <- reorder(region, value, FUN = sum)
levels(region) 


# Crear una lista utilizando la función list:
record <- list(name = "John Doe",
               student_id = 1234,
               grades = c(95, 82, 91, 97, 93),
               final_grade = "A")

# La lista de arriba incluye un carácter, un número, un vector con cinco números y un carácter:
record
class(record)

# Extraer los componentes de la lista con el operador $:
record$student_id

# Extraer los componentes de la lista con los corchetes dobles [[:
record[["student_id"]]

# Encontrar listas sin nombres de variables:
record2 <- list("John Doe", 1234)
record2

# Utilizar método de corchetes para extraer elementos cuando una lista no tiene nombres de variables:
record2[[1]] 