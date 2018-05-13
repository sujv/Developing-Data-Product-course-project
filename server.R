#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   model<-lm(dist~speed,data=cars)
   
   modelpred<-reactive({
     speedInput<-input$SliderSpeed
     predict(model,newdata=data.frame(speed=speedInput))
   })
   output$Plot1<-renderPlot({
  speedInput<-input$SliderSpeed
    # plot with the specified number of Sepallength
    plot(cars$speed,cars$dist,xlab="speed of car",ylab="distance traveled by car",
         bty="n",pch=16,xlim = c(1,30),ylim = c(1,150))
    if(input$Showmodel){
      abline(model,col="red",lw=2)
      points(speedInput,modelpred(),col="blue",pch=16,cex=2)
    }
    
  })
  
})
