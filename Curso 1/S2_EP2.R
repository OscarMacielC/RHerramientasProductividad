#Sesión 2 ejercicio práctico 2

#------------------------------------
# Revisando un ejercicio de alturas
library(dslabs)
data("reported_heights")
reported_heights
summary(reported_heights)

#agregar columna como númerica
reported_heights <- reported_heights |> mutate(height2=as.numeric(height))

#filtrar
reported_heights |> filter(height2<65)
unique(reported_heights$sex)
reported_heights |> filter(sex=="Female")
library(dplyr)

reported_heights_summary <- reported_heights |> mutate(height_cm = height2*2.54) |> summary()
reported_heights_cm <- reported_heights |> 
  mutate(height_cm = height2 * 2.54)
reported_heights_cm

valid_heights <- reported_heights_cm |>
  filter(!is.na(height_cm) & height_cm<280 & height_cm>50)

plot(valid_heights$height2, valid_heights$height_cm)
hist(valid_heights$height_cm)
boxplot(reported_heights_cm$height_cm ~ reported_heights_cm$sex)
boxplot(valid_heights$height_cm ~ valid_heights$sex)

#------------------------------------------
#Coronavirus en méxico

#install.packages("coronavirus")
library(dplyr)
library(coronavirus)

#Visualizando
data("coronavirus")
summary(coronavirus)

#¿Hay NAs?
sum(is.na(coronavirus))

# Buscar paises con menos casos confirmados
coronavirus|>
  select(country, type, cases)|>
  filter(type=="confirmed")|>
  arrange(desc(cases))

# Buscar sólo los casos en méxico
coronavirus|>
  select(country, date)|>
  filter(country=="Mexico")

coronavirus_mx <- coronavirus|>
  filter(country=="Mexico")

# Buscar las muertes por cada 100,000
coronavirus_year_mx <- coronavirus_mx |>
  mutate(date = as.Date(date),
         year=format(date, "%Y")) |>
  filter(type=="death") |>
  group_by(year) |>
  summarise(deathsPer100k=sum(cases),
            populationMean = mean(population)) |>
  mutate(deathrate=deathsPer100k/populationMean*100000)
coronavirus_year_mx
summary(coronavirus_mx)

#Obtaining the earliest and latest dates
a_date_mx <- min(coronavirus_mx$date)
a_date_mx <- max(coronavirus_mx$date)
global_date <- min(coronavirus$date)
global_date <- max(coronavirus$date)

#Using the dates to check how many cases there were
coronavirus_mx |>
  filter(date == a_date_mx)|>
  summarise(confirmed_total = sum(cases))

coronavirus |>
  filter(date == a_date)|>
  summarise(confirmed_total = sum(cases))

##Graphs

# Scatter
plot(coronavirus_mx$date[coronavirus_mx$type=="confirmed"],coronavirus_mx$cases[coronavirus_mx$type=="confirmed"])

# Another way to do it
plot(coronavirus_mx[coronavirus_mx$type=="confirmed","date"],coronavirus_mx[coronavirus_mx$type=="confirmed","cases"])

# Or if is preffered using 2 lines
df_conf <- coronavirus_mx |> filter(type == "confirmed")
plot(df_conf$date, df_conf$cases,
     xlab = "Fecha", 
     ylab = "Casos confirmados",
     col = "cyan")
lines(df_conf$date, df_conf$cases)

my_box <- df_conf |>
  mutate(date=as.Date(date),
         year=format(date,"%Y"))

boxplot(my_box$cases~my_box$year)

summary_by_year <- summary(my_box$year)

coronavirus_mx<-summary(as.factor(my_box$year))
coronavirus_mx

#Gráfica de pie
cases_by_year <- my_box |>
  group_by(year) |>
  summarise(total = sum(cases, na.rm = TRUE))
labels <- paste0(cases_by_year$year, ": ",
                 round(100 * cases_by_year$total / sum(cases_by_year$total), 1), "%")
pie(cases_by_year$total, labels = labels, main = "Casos confirmados por año en México")
