# Proyecto integral
library(tidyverse)
library(pdftools)
options(digits = 3) # reportar 3 dígitos significativos

fn<-system.file("extdata","RD-Mortality-Report_2015-18-180531.pdf",package="dslabs")
#system2("open",args=fn)
#system("cmd.exe",input=paste("start",fn))

txt=pdf_text(fn)
length(txt)

pagina9 <- txt[9]
library(stringr)
x <- str_split(pagina9, pattern = "\n")[[1]]
s <- x[1]
s <- str_trim(s)
substr(s, nchar(s), nchar(s))
header_index <- str_which(x, "2015")[1]
header_line <- x[header_index]
header <- str_split(header_line, "\\s+", simplify = TRUE)
month <- header[1]
header_names <- header[2:5]

tail_index <- str_which(x, "Total")[1]
tail_index

n<-str_count(x, "\\d+")
sum(n == 1)

out <- c(1:header_index, which(n == 1), tail_index:length(x))
s <- x[-out]
length(s)

s <- str_remove_all(s, "[^\\d\\s]")  # correcta

# Crear matriz con day + 4 columnas de años
tab <- str_split_fixed(s, "\\s+", n = 6)[, 1:5]
tab

# Asignar nombres de columna
colnames(tab) <- c("day", header[2:5])  # ← asegúrate de que header esté bien

# Convertir a tibble y a numérico, añadir columna de mes
tab <- as_tibble(tab) |>
  mutate(across(everything(), as.numeric),
         month = month)

