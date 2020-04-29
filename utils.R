#!/usr/bin/env Rscript
########################################
## Installation and preparation of environment
########################################

# Install the packages used in this repository
install_me <- function(me) {
  if (!require(me,character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)) {
    install.packages(as.character(me), repos = "http://cran.us.r-project.org")
    library(me, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  }
}

libraries <- c('ggplot2','tidyverse','plyr','scales','knitr', 
              'kableExtra', "tidyverse", "stats", "data.table")

lapply(libraries, install_me)
