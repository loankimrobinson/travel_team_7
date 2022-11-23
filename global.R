
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

pickerInput2 <- function (inputId, label = NULL, choices, selected = NULL, multiple = FALSE, 
                          options = list(), choicesOpt = NULL, width = NULL, inline = FALSE, ratio = c(3,9)) 
{
  if (ratio[1] + ratio[2] != 12) stop("`ratio` has to add up 12.")
  choices <- shinyWidgets:::choicesWithNames(choices)
  selected <- restoreInput(id = inputId, default = selected)
  if (!is.null(options) && length(options) > 0) 
    names(options) <- paste("data", names(options), sep = "-")
  if (!is.null(width)) 
    options <- c(options, list(`data-width` = width))
  if (!is.null(width) && width %in% c("fit")) 
    width <- NULL
  options <- lapply(options, function(x) {
    if (identical(x, TRUE)) 
      "true"
    else if (identical(x, FALSE)) 
      "false"
    else x
  })
  maxOptGroup <- options[["data-max-options-group"]]
  selectTag <- tag("select", shinyWidgets:::dropNulls(options))
  selectTag <- tagAppendAttributes(tag = selectTag, id = inputId, 
                                   class = "selectpicker form-control")
  selectTag <- tagAppendChildren(tag = selectTag, shinyWidgets:::pickerSelectOptions(choices, 
                                                                                     selected, choicesOpt, maxOptGroup))
  if (multiple) 
    selectTag$attribs$multiple <- "multiple"
  divClass <- "form-group shiny-input-container"
  labelClass <- "control-label"
  if (inline) {
    divClass <- paste(divClass, "form-horizontal")
    selectTag <- tags$div(class = paste0("col-sm-", ratio[2]), selectTag)
    labelClass <- paste(labelClass, paste0("col-sm-", ratio[1]))
  }
  pickerTag <- tags$div(class = divClass, style = if (!is.null(width)) 
    paste0("width: ", validateCssUnit(width), ";"), if (!is.null(label)) 
      tags$label(class = labelClass, `for` = inputId, label), 
    selectTag)
  shinyWidgets:::attachShinyWidgetsDep(pickerTag, "picker")
}





#Read data from data folder
all_files <- list.files("dataclean", pattern = c(".csv"))
dt_list  <- vector("list", length = length(all_files))

for(i in 1:length(all_files)){
    dt_list[[i]] <- read.csv(paste0("dataclean/",all_files[[i]]), stringsAsFactors = F)
}

names(dt_list) <- gsub(".csv","",all_files)
list2env(dt_list, envir=.GlobalEnv)

names(michelin_geo) <- c("id_res", "latitude_res", "longitude_res","zipCode_res")
names(michelin_restaurants)[1] <- "id_res"


search_list <- unique(dt_list$search_dt$search)[order(unique(dt_list$search_dt$search))]


# search_dt <- merge(dt_list$geometry, dt_list$nbhd, by = "id")
# search_dt$search <- paste0(search_dt$neighbourhood_cleansed, " - ", search_dt$zipcodes)
# weird <- unique(search_dt$search)[order(unique(search_dt$search))][1:49]
# search_dt <- search_dt[!search_dt$search %in% c(weird), ]
# weird1 <- unique(search_dt$search)[order(unique(search_dt$search))][c(299:309,636)]
# search_dt <- search_dt[!search_dt$search %in% c(weird1), ]
# search_dt <- search_dt[-c(grep(" - NA",search_dt$search)), ]
# search_dt$search <- gsub("t - ", "REMOVE",search_dt$search,fixed=TRUE)
# search_dt$search <- gsub("f - ", "REMOVE",search_dt$search,fixed=TRUE)
# search_dt <- search_dt[-c(grep("REMOVE",search_dt$search)), ]
# write.csv(search_dt, "data/search_dt.csv", row.names = F)


# calender <- read.csv("data/calendar.csv", stringsAsFactors = F)
# calender$date <- as.Date(calender$date, format = "%m/%d/%y")
# calender <- calender[calender$date > "2022-12-06",] 
# calender_4 <-  calender_3 <- calender_2 <- calender 
# calender_2$listing_id <- paste0(calender_2$listing_id, "_2")
# calender_3$listing_id <- paste0(calender_3$listing_id, "_3")
# calender_4$listing_id <- paste0(calender_4$listing_id, "_4")
# calender <- rbind(calender,calender_2, calender_3, calender_4)
# calender <- calender %>% group_by(listing_id)  %>% dplyr::mutate(id = cur_group_id()) 
# calender <- calender[calender$id %in% c(1:10000),]
# write.csv(calender[,c("id", "date","available", "price","adjusted_price","minimum_nights","maximum_nights")], "data/calendar.csv", row.names = F)












