
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
all_files <- list.files("data", pattern = c(".csv"))
dt_list  <- vector("list", length = length(all_files))

for(i in 1:length(all_files)){
    dt_list[[i]] <- read.csv(paste0("data/",all_files[[i]]), stringsAsFactors = F,fileEncoding="latin1")
}
names(dt_list) <- gsub(".csv","",all_files)
list2env(dt_list, envir=.GlobalEnv)







