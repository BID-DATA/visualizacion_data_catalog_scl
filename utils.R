#!/usr/bin/env Rscript
########################################
## Instalación y preparación de Ambiente
########################################

# Instalar los paquetes usados en este repositorio
instalar <- function(paquete) {
  if (!require(paquete,character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)) {
    install.packages(as.character(paquete), repos = "http://cran.us.r-project.org")
    library(paquete, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  }
}

paquetes <- c('ggplot2','tidyverse','plyr','scales','knitr', 
              'kableExtra', 'ggmap','ROAuth', 'twitteR',
              'devtools', 'rtweet', 'igraph', 'tidygraph',
              'ggraph', 'networkD3','seriation', 'influenceR',
              "jsonlite", "stringi", "extrafont",
              "ggthemes", "writexl", "DataExplorer",
              "tidyverse", "stats", "data.table")

lapply(paquetes, instalar)