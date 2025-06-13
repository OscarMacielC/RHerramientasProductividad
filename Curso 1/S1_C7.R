a <- 3
b <- 2
c <- -1

print(a)

x1 <- (-b + sqrt(b^2 - 4*a*c)) / (2*a)
x2 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)

sprintf("El resultado es %.3f",x)

#Guardando espacios de trabajo
#Poner sufijo rda o RData

save.image(file='S1_E7.RData')
load('S1_E7.RData')
