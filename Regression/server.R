library(shiny)

fit.true<-function(n=100, sigma=10, int=0, slope=5, min=-10, max=10,
                   legend="topleft"){
  x<-runif(n, min=min, max=max)
  y<-rnorm(n, mean=int + slope*x, sd=sigma)
  mod<-lm(y~x)
  plot(x, y, pch=20)
  abline(a=int, b=slope)
  abline(a=mod$coef[1], b=mod$coef[2], col='red')
  legend(legend, c(paste("y=", int, "+", slope, "x, True Model", sep=""),
                   paste("y=", round(mod$coef[1],2), "+", 
                         round(mod$coef[2], 2), "x, Estimated Model", sep="")), 
         lty=c(1,1), col=c('black', 'red'))
}

shinyServer(function(input,output){
  output$graph<-renderPlot({
    input$plot
    isolate({fit.true(n=input$n, sigma = input$Sigma, 
             int=input$int, slope=input$slope,
             min=input$vals[1],
             max=input$vals[2],
             legend=input$legend)})
  })
})