# Definir una matriz utilizando matrix y especificando número de filas y columnas:
mat <- matrix(1:12, 4, 3)
mat

# Utilizar corchetes [ para acceder a una entrada específica:
mat[2, 3]

# Acceder a toda la segunda fila al dejar en blanco el lugar de la columna (el resultado será un vector):
mat[2, ]

# Acceder a la tercera columna completa al dejar en blanco el lugar de las filas (el resultado será un vector):
mat[, 3]

# Acceder a más de una columna o fila (el resultado será una nueva matriz):
mat[, 2:3]

# Crear subconjuntos basados en ciertas filas y columnas (el resultado será una nueva matriz):
mat[1:2, 2:3]

# Convertir matrices a data frames utilizando la función as.data.frame
dataframe_mat <- as.data.frame(mat)

# Utilizar corchetes [ para acceder a filas y columnas de un data frame:
data("murders")
murders[25, 1]
murders[2:3, ]