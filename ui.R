
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
library(markdown)
source("RestaurantDataPrep.R")

shinyUI(fluidPage(

  # Application title
  titlePanel("Fast Food Penetration In US Counties"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("Select one or more states chart."),
      selectInput('states', 'States:',as.character(states[0:51]), selected = "NH", multiple = TRUE)
      
      ),
  
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plots", fluidRow(plotlyOutput("povPlot")), fluidRow(plotlyOutput("incPlot")) ),
        tabPanel("Documentation", includeHTML("documentation.html"))
      )

    )
  )
))

