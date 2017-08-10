library(shiny)
library(googleVis)
data=read.csv('C://Data Science/final.csv')
data<-data[-1]
MyState<-'
{
  "colorOption":"_UNIQUE_COLOR"
  }'
shinyServer(
  function(input, output) {
      output$view <- renderGvis({
        gvisMotionChart(data,idvar = "State",timevar = "Year", xvar = input$xaxis,yvar = input$yaxis,options=list(showChartButtons=F,state=MyState)
      )}
    )}
)


