
tagList(
  fluidRow(column(width = 4,
                  box(
                    title = "Searching Place",
                    width = 12,
                    div(style="max-height:600px; position: relative",#overflow-y: scroll; overflow-x: scroll;
                        uiOutput("global_search")
                    )
                  )
                  
                  ),
           column(width = 8,"")
  )
)