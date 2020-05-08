
---
#  title: "Graficos Metadata SCL"
#  output: ""
#  html_document:
#  df_print: paged
---

# Set `main_dir` 
  
main_dir = "C:/Users/alop/Inter-American Development Bank Group/Data Governance - SCL - General"
data_dir = paste0(main_dir, "/Proyecto - Metadata management")
plot_dir = paste0(main_dir, "/Proyecto - Infrastructure - administración de objetos (DataLake)")

setwd(data_dir)

# instalo paquetes 
install.packages("readxl")
install.packages("tidyverse")

# Leo el archivo 
library("readxl")
meta_data <- read_excel("metadata_scl.xlsx", sheet = "catalog")


setwd(plot_dir)
library(dplyr)
# Bases de datos por pais

meta_data %>% dplyr::count(id_country) %>% 
  ggplot(aes(x=reorder(id_country,n), y=n)) + 
  geom_bar(stat="identity", position=position_dodge())+
  ggtitle("Bases de Datos por País") +
  scale_fill_brewer(palette="Paired") +
  coord_flip()+
  theme_minimal() + xlab("Número de Bases de Datos") + 
  ylab("País")
ggsave("paises_AL.png")

# Bases de datos por tipos de estudio
meta_data %>% dplyr::count(study_type) %>% 
  ggplot(aes(x=reorder(study_type,n), y=n)) + 
  geom_bar(stat="identity", position=position_dodge(), fill = "#009999" ) +
  scale_fill_brewer(palette="Blues") +
  coord_flip()+
  theme_minimal() +  
  ggtitle("Número de Bases de Datos por Tipo de Estudio") + 
  xlab("Número de Bases de Datos") + 
  ylab("Tipo de Estudio")  
ggsave("tipos_AL.png")

