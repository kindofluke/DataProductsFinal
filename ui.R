
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("RestaurantDataPrep.R")

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(selectInput('states', 'States:',as.character(states[0:51]), selected = "NH", multiple = FALSE)),
  
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("povPlot"),
      plotOutput("incPlot")
    )
  )
))

