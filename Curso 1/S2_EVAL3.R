library(tidyverse)
library(dplyr)
library(dslabs)
data(heights)
names(heights)

heights <- setDT(heights)
heights[height > mean(height)]

heights[height > mean(height)]
count(heights[height > mean(height)]) #Arriba del promedio
heights[sex == "Female" & height > mean(height)]
count(heights[sex == "Female" & height > mean(height)])#Arriba del promedio y mujeres
heights[sex == "Female" ]
count(heights[sex == "Female" ]) #Número de mujeres
count(heights)
FemaleProp <- count(heights[sex == "Female" ])/count(heights) #Proporción de individuos
round(FemaleProp,3)
