#-----------------------------
# Cuadrática a tres cifras significativas
a <- 2
b <- -1
c <- -4
x1 <- (-b + sqrt(b^2 - 4*a*c)) / (2*a)
x2 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)
round(x1,2)
round(x2,2)
#-----------------------------
# Logaritmo base 4 de 1024
help(log)
round(log(1024, base = 4))
#-----------------------------
# Dslabs movielens
# install.packages("dslabs")
library(dslabs)
data("movielens")
str(movielens)
#-----------------------------
# Class excercise
str(movielens) 
#title is chr
#genres is Factor w/901 levels
#-----------------------------
# Niveles de un factor
nlevels(movielens$genres)
