
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
source("RestaurantDataPrep.R")

shinyServer(function(input, output) {
  
  reactdata <- reactive({
    subset(fullresult, fullresult$State == input$states)
    
  })
  
  trans_factor <- reactive({
  socio_lookup[input$factor, ]
    
  })
  
  output$povPlot <- renderPlotly({
  d <- reactdata()[,c("FSRPTH07", "POVRATE10","MEDHHINC10","State", "County")]
  f <- list(
    family = "Tahoma",
    size = 8,
    color = "#7f7f7f"
  )
  x <- list(
    title = "Fast Food per 1000 Residents",
    titlefont = f
  )
  y <- list(
    title = "County Poverty Rate Income",
    titlefont = f
  )
  plot_ly(d,x= ~FSRPTH07, y = ~POVRATE10, name="Fast Food Restaurants per 1000 Residents and County Poverty Rate" , mode="markers",  type="scatter", color=~ State,  text = ~paste("County: ", County),
        marker=list(size=15, width=8)
          
          
          
          ) %>%
    layout(xaxis = x, yaxis = y, title="Fast Food Restaurants per 1000 Residents and County Poverty Rate", font=list(size=12, color="navy"))
  
  })
  
  output$incPlot <- renderPlotly({
    f <- list(
      family = "Tahoma",
      size = 8,
      color = "#7f7f7f"
    )
    x <- list(
      title = "Fast Food per 1000 Residents",
      titlefont = f
    )
    y <- list(
      title = "County Median Household Income",
      titlefont = f
    
    )
    
    d <- reactdata()[,c("FSRPTH07", "POVRATE10","MEDHHINC10","State", "County")]
    
    plot_ly(d,x= ~FSRPTH07, y = ~MEDHHINC10, name= "Fast Food Restaurants per 1000 Residents and County Median income Rate", mode="markers",  type="scatter", color=~ State,  text = ~paste("County: ", County),
            marker=list(size=15, width=8)) %>%
              layout(xaxis = x, yaxis = y, title="Fast Food Restaurants per 1000 Residents and County Median income Rate", font=list(size=12, color="navy"))
            
  })
  
  

})
