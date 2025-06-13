#Session 1 Practical exercise 1

#Create a vector and make operations
x <- c(735,320,392,15:20)
x

sum(x)
mean(x)
median(x)

#Same vector and operations with NAs
xNA <- c(735,320,NA,392,15:20,NA)
xNA

sum(xNA,na.rm=T)
mean(xNA,na.rm=T)
median(xNA,na.rm=T)

#Looking at Datasets---------------------
library(datasets)

?datasets

data(package="datasets")

#Data sets in Spanish:
#cienciadedatos.github.io/datos/

#Opening data set rivers
data("rivers")
?rivers

rivers

# Sorting rivers
sort(rivers)
sort(rivers,decreasing = T)
riversIndexToSort <- order(rivers)
rivers[riversIndexToSort]
riversSortedIndex <- rank(rivers)
riversSortedIndex

#Acceder a los datos
rivers[1:5]

rivers+xNA
# CAMBIANDO DE EJERCICIO-------------------
#install.packages("dslabs") #Si no está instalado
library(dslabs)

data("reported_heights")
summary(reported_heights)
str(reported_heights)
unique(reported_heights$sex)

reported_heights$height2 <- as.numeric(reported_heights$height)
reported_heights

# Ver por filas [filas,columnas]
reported_heights[1,]
reported_heights[100:105,2:3]

#filtrar con corchetes
reported_heights[reported_heights$sex == "Female",]
reported_heights[reported_heights$height2 < 70,]
short_males <- reported_heights[reported_heights$sex == "Male" & reported_heights$height2<70,]

reported_heights[reported_heights$sex == "Male" & reported_heights$height2<70,] |> 
  View()

#---------------
hist(rivers)
hist(short_males$height2)

boxplot(reported_heights$height2 ~ reported_heights$sex)
