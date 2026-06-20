library(rvest)
library(stringr)

## Obteniendo títulos

url<-"https://elpais.com/internacional/"
web<-read_html((url))
título <- web |>
  html_elements("h1") |>
  html_text2()

títulos_h2 <- web |>
  html_elements("h2") |>
  html_text2()

titulares <- titulares[titulares != ""]

head(titulares,10)

## Obteniendo paises más poblados

url<-"https://es.wikipedia.org/wiki/Anexo:Países_por_población"
pagina_países <- read_html(url)
tablas <- pagina_países |> html_table(fill = TRUE)
length(tablas)
poblacion <- tablas[[1]]
colnames(poblacion)
head(paises_poblacion,10)
