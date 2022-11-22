# dashboardSidebar(
#   width = 250,
#   div(class = "inlay", style = "height:10px;"),
#   div(style = "overflow: visible;width:inherit;", #
#       # sidebarMenu(
#       #             textAreaInput("google_search","Add a search term",value = "Amazon, Walmart, Best Buy, Target",height = "100px"),
#       #            #uiOutput("country"),
#       #            uiOutput("google_pro"),
#       #            uiOutput("time"),
#       #            uiOutput("spe_date"),br(),
#       #            actionButton("submit","Add to the searching list",icon("save"),
#       #                         style = "color: #fff; background-color: #32907c; border-color: #32907c; width: 91%;"),br(),hr()
#       #   )
#       )
#   )

convertMenuItem <- function(mi,tabName) {
  mi$children[[1]]$attribs['data-toggle']="tab"
  mi$children[[1]]$attribs['data-value'] = tabName
  mi
}

# Side bar Panel
dashboardSidebar(
  width = 250,
  collapsed = TRUE,
  sidebarMenu(id = "tab", style = "font-size:13px; padding-top:18px;",
              menuItem("Home", tabName = "homeTab",icon = icon("home")),
              menuItem("Under Investigation Reports",tabName="under_investigationTab",icon = icon("dashboard")),
              menuItem("Resolved Breach Reports", tabName = "resolvedTab",icon = icon("bar-chart")
              # menuItem("Generate Report", tabName = "reportTab",icon = icon("file-archive-o")),
              # menuItem("About Us", tabName = "aboutTab",icon = icon("info")
              )
  )
)


