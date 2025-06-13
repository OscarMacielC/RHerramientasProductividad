library(dslabs)
str(murders)
names(murders)
a <- murders$abb
class(a)
b <- murders[["abb"]]
identical(a, b)
class(murders$region)
length(levels(murders$region))

table(murders$region)
