# Cargar el dataset
data(mtcars)
# Ver las primeras filas
head(mtcars)
# Ver los nombres de las columnas
colnames(mtcars)
# Calcular la media de las millas por galón
mean(mtcars$mpg)
# Filtrar autos con más de 6 cilindros
subset(mtcars, cyl > 6)

