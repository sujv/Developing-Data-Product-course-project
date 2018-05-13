#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting distance from car speed"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
     
       sliderInput("SliderSpeed","Speed of the car",0,50,value=20),
      checkboxInput("Showmodel","Show/Hide model",value = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Predicted distance from car speed"),
       plotOutput("Plot1")
    )
  )
))
