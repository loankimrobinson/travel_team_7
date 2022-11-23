

values <- reactiveValues(global_dt = dt_list$search_dt,
                         restaurants = dt_list$restaurants,
                         property = dt_list$property,
                         review = dt_list$review
                         )


observeEvent(input$search_bt,{
  
  dt <-  dt_list$search_dt
  dt <- dt[dt$search %in% input$search, ]
  values$global_dt = dt
  
  res_dt <- dt_list$restaurants
  res_dt <-  res_dt[res_dt$zipcode %in%  dt$zipcodes, ]
  values$restaurants =  res_dt 
  values$restaurants_choices <- res_dt$name
  
  pro_dt <- dt_list$property
  pro_dt <-  pro_dt[pro_dt$id %in%  dt$id, ]
  values$property = pro_dt
  
  review_dt <- dt_list$review
  review_dt <-  review_dt[review_dt$id %in%  dt$id, ]
  values$review = review_dt
  values$review_scores_rating = unique(review_dt$review_scores_rating)
  
  
  print(str(values$property))
  print(str( values$restaurants))
  print(str(values$global_dt))
  

  
})


observeEvent(input$search_bt,{
  updateTabItems(session, "tab", selected = "searchingTab")
})



output$global_search <- renderUI({
  tagList(
    airDatepickerInput(
      inputId = "checkin",
      label = "Check In Date",
      placeholder = "Check In Date",
      multiple = 1, clearButton = TRUE
    ),
    airDatepickerInput(
      inputId = "checkout",
      label = "Check Out Date",
      placeholder = "Check Out Date",
      multiple = 1, clearButton = TRUE
    ),
    pickerInput2(
      inputId = "rest",
      label = "Restaurant",
      multiple = TRUE,
      inline = F,
      width = "100%",
      choices = values$restaurants_choices,
      selected = values$restaurants_choices[1:3] ,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `virtual-scroll` = TRUE,
        `style` = "btn-inline",
        size = 14),
      choicesOpt = list(
        content = values$restaurants_choices
      )
    ),
    pickerInput(
      inputId = "rating",
      label = "Review Rating",
      multiple = TRUE,
      inline = F,
      width = "100%",
      choices = values$review_scores_rating,
      selected = values$review_scores_rating[1:3] ,
      options = list(
        `actions-box` = TRUE,
        `live-search` = TRUE,
        `virtual-scroll` = TRUE,
        `style` = "btn-inline",
        size = 14),
      choicesOpt = list(
        content = values$review_scores_rating
      )
    ),br(),
    div(style = "text-align:center;",
        actionButton("submit_bt",icon =  icon("fas fa-search"), label = "Search", 
                     style = "height: 40px; width:90%;color:white;background-color:#ec6205;border-color:#ec6205;border:0px;border-radius:0px;")),
    br(),
    br()
  )
})
