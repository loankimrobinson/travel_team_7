source("global.R")
options(shiny.maxRequestSize=100*1024^2)

server <-  function(input, output, session){
  source(file.path("server", "home_server.R"),  local = TRUE)$value
  source(file.path("server", "searching_server.R"),  local = TRUE)$value
  # source(file.path("server", "resolved_server.R"),  local = TRUE)$value
}