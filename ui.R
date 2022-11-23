source("global.R")

ui = dashboardPage(
  skin = "red",
  header = source(file.path("ui", "header.R"),  local = TRUE)$value,
  sidebar = source(file.path("ui", "sidebar.R"),  local = TRUE)$value,
  body = dashboardBody(
    shinyjs::useShinyjs(),
    tags$style(HTML("g.hovertext > path {opacity: .7;}")),
    tags$head(includeCSS(file.path('www', 'style.css'))),
    tags$head(tags$style(HTML("#search + div > .selectize-input {height: 50px;padding-right:0px;padding-left: 20px;border:0px;border-radius:0px;font-size: 35px;}"))),
    tags$head(tags$style(HTML("#search .selectize-control.single .selectize-input:after{content: none;}"))),
    tags$head(tags$style(".leaflet .legend i{border-radius: 50%;width:10px;height: 10px;margin-top: 4px;}")),
    tags$head(tags$style(".leaflet .legend {background-color:transparent;color:white;}")),
    # tags$head(tags$style(HTML("#tab1_under .multicol {height: 100px;
    #                               -webkit-column-count: 2; /* Chrome, Safari, Opera */
    #                                -moz-column-count: 3;    /* Firefox */
    #                                column-count: 2;
    #                                -moz-column-fill: auto;
    #                                -column-fill: auto;
    #                              }
    #                              "))),
    # #tags$head(tags$style(type="text/css","label{ display: table-cell; text-align: center;vertical-align: middle; } .form-group { display: table-row;}")),
    # #switchInput color while on
    # tags$head(tags$style(HTML('.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-danger,
    #                                    .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-danger {
    #                                     background:#5a8d90;
    #                                     color: white;
    #                                     }'))),
    # 
    # #switchInput color while off
    # tags$head(tags$style(HTML('.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-info,
    #                                    .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-info {
    #                                     background: #A2482E;
    #                                     color: black;
    #                                     }'))),

    # tags$style(HTML('table.dataTable tr:nth-child(even) {background-color:#353c42!important;color:white;}')),
    # tags$style(HTML('table.dataTable tr:nth-child(odd) {background-color: #353c42!important;color:white;}')),
    # tags$style(HTML('table.dataTable th {background-color: #A2482E!important;color:white;}')),
    # #tags$style(HTML('table.dataTables_paginate .paginate_button.disabled {background-color: black !important;color: white;}')),
    # tags$style(HTML("#under_investigationTab-table_out .dataTables_wrapper .dataTables_length, 
    #                  #under_investigationTab-table_out .dataTables_wrapper .dataTables_filter, 
    #                  #under_investigationTab-table_out .dataTables_wrapper .dataTables_info, 
    #                  #under_investigationTab-table_out .dataTables_wrapper .dataTables_processing,
    #                  #under_investigationTab-table_out .dataTables_wrapper .dataTables_paginate .paginate_button, 
    #                  #under_investigationTab-table_out .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
    #         color: white !important;font-weight:normal;
    #     }")),
    # tags$style(HTML("#resolved-table_out .dataTables_wrapper .dataTables_length, 
    #                  #resolved-table_out .dataTables_wrapper .dataTables_filter, 
    #                  #resolved-table_out .dataTables_wrapper .dataTables_info, 
    #                  #resolved-table_out .dataTables_wrapper .dataTables_processing,
    #                  #resolved-table_out .dataTables_wrapper .dataTables_paginate .paginate_button, 
    #                  #resolved-table_out .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
    #         color: white !important;font-weight:normal;
    #     }")),
    # tags$head(tags$style(HTML("table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {background-color: #5a8d90 !important;}"))),
    # tags$style(HTML(".dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,.dataTables_wrapper .dataTables_paginate .paginate_button, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled {color: black!important;font-weight:normal;}")),
    # 
    tabItems(
      tabItem(tabName = "homeTab",
              source(file.path("ui", "home_ui.R"),  local = TRUE)$value
      ),
      tabItem(tabName = "searchingTab",
              
              source(file.path("ui", "searching_ui.R"),  local = TRUE)$value 
      ),
      tabItem(tabName = "bookingTab",
              
              #source(file.path("ui", "resolved_ui.R"),  local = TRUE)$value 
      )
      
    )
  ),
  controlbar = NULL,
  footer = dashboardFooter(source(file.path("ui", "footer.R"),  local = TRUE)$value)
  
)
