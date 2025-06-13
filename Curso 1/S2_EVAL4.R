library(dslabs)
data(heights)
names(heights)
unique(heights$sex)

sex_count <- ifelse(heights$sex=="Female",1,2)
sum(sex_count)

is_tall_72 <- ifelse(heights$height>72,heights$height,0)
round(mean(is_tall_72),2)

inches_to_ft <- function(x){
  feet <- x/12
  return(feet)
}
inches_to_ft(144)

heights_in_ft <- sapply(heights$height, inches_to_ft)
is_short <- ifelse(heights_in_ft<5,1,0)
sum(is_short)
# Pregunta 2 Lógicos -------------
any(T,T,T) #T
all(F,F,F) #F
any(T,T,F) #T
all(T,F,F) #F
all(T,T,F) #F
all(T,T,T) #T
any(T,F,F) #T
any(F,F,F) #F
# Pregunta 3 FACTORIALES -------------
m <- 10
f_n <- vector(length = m)

for(n in 1:m){
  f_n[n] <- factorial(n)
}

f_n
