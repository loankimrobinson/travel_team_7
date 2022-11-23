
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



#Read data from data folder
all_files <- list.files("data", pattern = c(".csv"))
dt_list  <- vector("list", length = length(all_files))

for(i in 1:length(all_files)){
    dt_list[[i]] <- read.csv(paste0("data/",all_files[[i]]), stringsAsFactors = F,fileEncoding="latin1")
}

names(dt_list) <- gsub(".csv","",all_files)
list2env(dt_list, envir=.GlobalEnv)

names(michelin_geo) <- c("id_res", "latitude_res", "longitude_res","zipCode_res")
names(michelin_restaurants)[1] <- "id_res"
names(dt_list$nbhd)[1] <- "id"
names(dt_list$geometry)

search_dt <- merge(dt_list$geometry, dt_list$nbhd, by = "id")
search_dt$search <- paste0(search_dt$neighbourhood_cleansed, " - ", search_dt$zipcodes)










