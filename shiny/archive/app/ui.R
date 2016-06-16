##
## ui file for PrEP Guidelines Paper
##

library(shiny)
library(dygraphs)

shinyUI(
navbarPage(title = NULL, windowTitle = "PrEP Guidelines",
  tabPanel("Introduction",
           column(7, offset = 1,
               h3("Impact of HIV Pre-Exposure Prophylaxis among MSM in the United States",
                  style = "color: #193556;"),
               h4("An Web-Based Modeling Tool for Public Health Practice", style = "color: #2E619E;"),
               p("This software tool provides additional opportunities to explore the
                 mathematical models of the paper:",
                  tags$blockquote("Jenness SM, Goodreau SM, Rosenberg E,
                 Beylerian EN, Hoover KW, Smith DK, Sullivan P.", em("Impact of CDC’s HIV Pre-Exposure                          Prophylaxis Guidelines among MSM in the United States.")),
                 "Application in progress.")
                  )

           )
))
