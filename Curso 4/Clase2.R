library(dslabs)
library(dplyr)

data(murders)

View(murders)
murders%>%
  select(state,population,total)
