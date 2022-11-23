

output$search_out <- renderUI({
  fluidRow(
        column(12,
               selectInput(
                 inputId = "search", 
                 label = NULL,
                 choices = search_list ,
                 selected = NULL,
                 multiple = F,
                 width = "100%"
               )
    ))
})


