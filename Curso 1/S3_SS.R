format(Sys.Date(),format="%d %b %Y")

n<-20

for(i in n){
  print(n)
}

library(dslabs)
data("nyc_regents_scores")
names(nyc_regents_scores)
str(nyc_regents_scores)

nyc_scores <- nyc_regents_scores |>
  dplyr::select(-score)

names(nyc_scores)
total_grades <- apply(nyc_scores,MARGIN=1,sum,na.rm=T)
total_grades
avg_grades <- apply(nyc_scores,MARGIN=2,median,na.rm=T)
max_grades <- apply(nyc_scores,MARGIN=2,max,na.rm=T)
min_grades <- apply(nyc_scores,MARGIN=2,min,na.rm=T)
avg_grades
max_grades
min_grades

#MICROBENCHMARK -----------------------------------

#install.packages("microbenchmark")
library(microbenchmark)
microbenchmark::microbenchmark(apply(nyc_scores,MARGIN=2,min,na.rm=T))

f <- function() NULL
res <- microbenchmark(NULL, f(), times=1000L)

# Función desde 0 -------------------------------------

#Función para saludad dependiendo de la hora del día:
#Entradas: La hora en númerico, opcional el idioma
#Salidas: Hora en formato númerico militar
# saludo <- function(hora,idioma="español"){
#   if(!is.numeric(hora)){ 
#     print("La hora no tiene el formato correcto")
#     return()
#   }
#   hh <- hora %/% 100
#   if(hh>24){ 
#     print("La hora no es correcta")
#     return()
#   }
#   momento <- dplyr::case_when(hh>0 & hh <14 ~ "di",
#                               hh <14 ~ "ta",
#                               default ~ "no")
#   dplyr::case_when(momento =="di"~"Buenos días",
#                    momento =="ta"~"Buenas tardes",
#                    momento =="no"~"Buenas noches",
#                    )
# }
# 
# saludo(1000)


# Calculo de tasas de incidencia por año ----------
library(dplyr)
library(coronavirus)
data(coronavirus)
names(coronavirus)
str(coronavirus)
unique(coronavirus$type)

#Función de cálculo de tasas de mortalidad por año
f_tasa_mort_año <- function(pais, año, mes) {
  coronavirus_m <- coronavirus |> 
    mutate(year=as.numeric(format(as.Date(date),"%Y"))) |>
    mutate(month=as.numeric(format(as.Date(date),"%Y"))) |>
    filter(country==pais & year==año & type=="death") |>
    group_by(country,province) |>
    summarise(pobl = sum(population, na.rm=T),
              casos=sum(cases), na.rm=T),
              .groups = "drop"|>
    mutate(tasa_mortalidad=casos/pobl*10^5) |>
    select(country,province,tasa_mortalidad)
  
  return(coronavirus_m)
}

#Función de cálculo de tasas de incidencia por año
f_tasa_inc_año <- function(pais, año) {
  coronavirus_m <- coronavirus |> 
    mutate(year=as.numeric(format(as.Date(date),"%Y"))) |>
    filter(country==pais & year==año & type=="confirmed") |>
    group_by(country) |>
    summarise(pobl=sum(population, na.rm=T),
              casos=sum(cases), na.rm=T),
              .groups = "drop"|>
    mutate(confirmados=casos/pobl*10^5) |>
    select(country,confirmados)
  
  return(coronavirus_m)
}

#Función de cálculo de tasas de incidencia por mes
f_tasa_mort_mes <- function(pais, año) {
  coronavirus_m <- coronavirus |> 
    mutate(
      year = as.numeric(format(as.Date(date), "%Y")),
      month = as.numeric(format(as.Date(date), "%m"))
    ) |>
    filter(country == pais & year == año & type == "death") |>
    group_by(country, month) |>
    summarise(
      pobl = sum(population, na.rm = TRUE),
      casos = sum(cases, na.rm = TRUE),
      .groups = "drop"
    ) |>
    mutate(tasa_mortalidad = casos / pobl * 10^5) |>
    select(country, month, tasa_mortalidad) |>
    arrange(month)
  
  return(coronavirus_m)
}


f_tasa_mort_diaria <- function(pais) {
  coronavirus_m <- coronavirus |> 
    filter(country == pais & type == "death") |> 
    mutate(
      date = as.Date(date),
      tasa_mortalidad = cases / population * 1e5
    ) |> 
    group_by(date) |> 
    summarise(tasa_mortalidad = sum(tasa_mortalidad, na.rm = TRUE)) |> 
    arrange(date)
  
  plot(coronavirus_m$date, coronavirus_m$tasa_mortalidad, type = "l",
       xlab = "Fecha", ylab = "Tasa de mortalidad (por 100,000)",
       main = paste("Serie diaria de defunciones en", pais))
  
  return(coronavirus_m)
}

#Función para graficar una serie de tiempo diaria
#Entrada:
#       1-Pais en caracter miembro de unique(coronavirus$country)
#       2-Opcional, tipo de conteo 1)"acumulativo" por defecto o 2)"puntual"
#Salida:
#       Plot de las defunciones diarias
#Ejemplo de uso:
#       f_tasa_mort_grafica("China")
#       f_tasa_mort_grafica("Canada",1)
#       f_tasa_mort_grafica("Canada",2)

f_tasa_mort_grafica <- function(pais,conteo=1) {
  #Revisando el segundo parametro, que puede ser string o entero
  conteo <-tolower(conteo)
  if(!(conteo %in% c("1", "2","acumulativo","puntual"))){
    print("La segunda variable debe ser 1 o 2")
         return()
  }
  if(conteo %in% c("1", "acumulativo")){conteo <- 1}
  else if(conteo %in% c("2", "puntual")){conteo <- 2}
  
  #Obteniendo los datos
  coronavirus_m <- coronavirus |> 
    filter(country == pais & type == "death") |> 
    mutate(
      date = as.Date(date),
      tasa_mortalidad = cases / population * 1e5
    ) |> 
    group_by(date) |>
    reframe(
      tasa_mortalidad_cumsum = cumsum(tasa_mortalidad), # no permine na.rm
      tasa_mortalidad_sum = sum(tasa_mortalidad,na.rm = T),
      .groups = "drop"
    ) |>
    arrange(date)
  
  #Cambiando tasa de mortalidad a que sea puntual
  if (conteo == 1) {
    plot(coronavirus_m$date, coronavirus_m$tasa_mortalidad_cumsum)
  }else{
    plot(coronavirus_m$date, coronavirus_m$tasa_mortalidad_sum)
  }
}

f_tasa_mort_año("Canada",2021)
f_tasa_inc_año("Canada",2021)
f_tasa_mort_mes("Canada",2021)
f_tasa_mort_grafica("Canada",1)
f_tasa_mort_grafica("Canada",2)

