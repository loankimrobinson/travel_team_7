
fluidRow(
    tags$div(
      tags$footer("Data source:",
                  tags$a("U.S. Department of Health & Human Services",
                         href = "https://www.hhs.gov/",
                         target = "_blank")),
      tags$footer("Author:",
                  tags$a("Loan Kim Robinson ",
                         href = "https://www.linkedin.com/in/loan-robinson-86776994/",
                         target = "_blank")),
      tags$footer("Questions:",
                  tags$a("loankimrobinson@gmail.com",
                         href = "mailto:loankimrobinson@gmail.com",
                         target = "_blank")),
      # tags$footer(("Built with"),
      #             tags$a(href = "http://www.r-project.org/",
      #                    target = "_blank",
      #                    "R,"),
      #             tags$a(href = "http://shiny.rstudio.com",
      #                    target = "_blank",
      #                    "Shiny"),
      #             ("&"),
      #             tags$a(href = "http://www.rstudio.com/products/shiny/shiny-server",
      #                    target = "_blank",
      #                    "Shiny Server."),
                  tags$a(
                    href = "https://www.hhs.gov/",
                    target = "_blank",
                    tags$img( src = "hhsLogo.png",
                              height='10%',
                              width = 70,
                              alt = "logo"))
                  
      #)
    ),
    align = "center"
  )