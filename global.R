
rm(list = ls())


library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinydashboardPlus)
library(shinycssloaders)
library(shinyWidgets)


library(leaflet)
#devtools::install_github('bhaskarvk/leaflet.extras')
library(leaflet.extras)# to add addSearchFeatures #http://leaflet-extras.github.io/leaflet-providers/preview/index.html
library(plotly)
library(RColorBrewer)
library(ggplot2)
library(htmlwidgets)


library(DT)
library(dplyr)
library(glue)
library(rlang)
library(stringr)
library(reshape2)
library(tidyverse)
library(data.table)
library(readxl)
library(rio)



#Read data from data folder
all_files <- list.files("data", pattern = c(".csv|.xlsx"))
dt_list  <- vector("list", length = length(all_files))
dt_list <- lapply(all_files, function(i) {
  dt <- rio::import(paste0("data/",i))
})
names(dt_list) <- gsub(".csv|.xlsx","",all_files)
list2env(dt_list, envir=.GlobalEnv)









