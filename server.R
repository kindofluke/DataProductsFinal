
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("RestaurantDataPrep.R")

shinyServer(function(input, output) {
  
  reactdata <- reactive({
    subset(fullresult, fullresult$State == input$states)
    
  })
  
  trans_factor <- reactive({
  socio_lookup[input$factor, ]
    
  })
  
  output$povPlot <- renderPlot({
  print("start")
  x <- reactdata()$FSRPTH07
  y_poverty <- reactdata()$POVRATE10
  plot(x,y_poverty,xlab="Fast Food Restaurants per 1000", ylab="Poverty Rate", col="lightgreen", pch = 20, cex = 3)
  
  })
  
  output$incPlot <- renderPlot({
    x_2 <- reactdata()$FSRPTH07
    y_income <- reactdata()$MEDHHINC10
    plot(x_2,y_income, col="lightblue",xlab="Fast Food Restaurants per 1000", ylab="Median Househodl Income",  pch = 20, cex = 3)
    
  })

})
