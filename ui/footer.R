
fluidRow(
    tags$div(
      tags$footer("Data source:",
                  tags$a("Travel Booking",
                         href = "https://www.booking.com/",
                         target = "_blank")),
      tags$footer("Author:",
                  tags$a("Loan Kim Robinson ",
                         href = "https://www.linkedin.com/in/loan-robinson-86776994/",
                         target = "_blank")),
      tags$footer("Questions:",
                  tags$a("loankimrobinson@gmail.com",
                         href = "mailto:loankimrobinson@gmail.com",
                         target = "_blank")),

                  tags$a(
                    href = "https://www.booking.com/",
                    target = "_blank",
                    tags$img( src = "logo.png",
                              height='10%',
                              width = 70,
                              alt = "logo"))
                  
      #)
    ),
    align = "center"
  )