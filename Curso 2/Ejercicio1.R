# Ejercicio 1 Tipos de datos
# Oscar Eduardo Maciel Castillo

#1.- Nombre de variables
library(dslabs)
data(heights)
names(heights) #Ver variables 
    # "sex"    "height"

#2.- Tipos de variables
head(heights)
unique(heights['sex'])
     # Opción 2
     # Sex es de tipo Categórica no ordinal

#3.- Valores numéricos
library(dslabs)
data(heights)
x <- heights$height
length(unique(x)) #Calcular la cantidad de alturas únicas
      # 139 alturas únicas

#4.- Tablas
tab <- table(x) #obtener la cantidad de alturas repetidas en una tabla
      # 50 - 2| 51 - 1 | * * * |81 - 1 | 82.6771653543307 - 1

#5.- Indicadores de variables
sum(tab==1) # Encontrar cuantas alturas son únicas
      # 63

#6.- Tipos de datos - alturas
      # Opción 1: Es más efectivo considerar las alturas como numéricas