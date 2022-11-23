
tagList(
  fluidRow(column(12,
                  div(style = "padding-left:10px; padding-top:200px; padding-right:10px;text-align:center;",
                      HTML('<div class="container">
                      <div class="row">
                      <div class="col-md-12 text-center">
                      <h5 class="animate-charcter">Find Your Perfect Place to Stay</h3>
                      </div>
                           </div>
                           </div>'))
                  )),
  br(),
  fluidRow(
        column(2,""),
        column(6,
               div(class = "row no-gutter", style = "display:inline;outline:none;vertical-align: top;align:right;",
               uiOutput("search"))),
        column(2,
               div(class = "row no-gutter",style = "display:inline;outline:none;vertical-align: top;align:left;",
               actionButton("search_bt",icon =  icon("fas fa-search"), label = NULL, 
                            style = "height: 50px; width:100%;background-color:#ec6205;border-color:#ec6205;border:0px;border-radius:0px;"))
        )
              )
        )

