# Podemos crear vectores numéricos o categóricos con las función concatenada
# numéricos
codes <- c(380, 124, 818)

# categóricos con uso de comillas
country <- c("italy", "canada", "egypt")

# Podemos nombrar los elementos de un vector numérico
# Observen que las tres líneas de código abajo tienen el mismo resultado
codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)
country <- c('italy', 'canada', 'egypt')

# También podemos nombrar los elementos de un vector numérico utilizando la función names()
codes <- c(380, 124, 818)
country <- c("italy","canada","egypt")
names(codes) <- country
codes

# Generar sequencias con función seq
seq(1, 10)

# Añada un tercer argumento que indica a R cuánto saltar entre los números de la sequencia
seq(1, 10, 2)

# Genere enteros consecutivos
1:10

# Los corchetes son útiles para crear subconjuntos para acceder a elementos específicos de un vector
# Accede al segundo elemento
codes[2]
# Obtenga más de una entrada utilizando un vector de entradas múltiples como índice
codes[c(1,3)]
# Acceder a los dos primeros elementos
codes[1:2]

# Si los registros de un vector tienen nombre, es posible acceder a ellos por medio de su nombre
codes["canada"]
codes[c("egypt","italy")]

#  Cambiar funciones de numéricas a carácteres
x <- 1:5
y <- as.character(x)
y
# Cambiar lo anterior y regresar los valores a numéricos
as.numeric(y)
# Conversión donde se encuentra un imposible y R convierte dicha entrada a NA o no disponible en español
x <- c("1", "b", "3")
z <- na.omit(as.numeric(x) )
attributes(z)$na.action <- NULL
z
