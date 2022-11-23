

output$search <- renderUI({
  fluidRow(
        column(12,
               selectInput(
                 inputId = "search", 
                 label = NULL,
                 choices = unique(search_dt$search),
                 selected = NULL,
                 multiple = F,
                 width = "100%"
               )
    ))
})