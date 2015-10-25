library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Exploring Simple Linear Regression"),
  
  sidebarPanel(
    sliderInput("n", "Sample Size", min = 5, 
                max = 100, value = 50),
    numericInput("Sigma", "Standard Deviation",
                 value = 1,step=0.01,min=0),
    conditionalPanel("input.Sigma<=0",
                     helpText("Variation must be greater than 0")),
    sliderInput("int", "Intercept", min = -50, 
                max = 50, value = 50, step=0.01),
    numericInput("slope", "Slope",
                 value = 0,step=0.01),
    sliderInput("vals", "Predictor Values", min = -10, 
                max = 10, value = c(-5, 5)),
    selectInput("legend", "Legend Location", 
                choices = list("Left" = "topleft", "Right" = "topright"), 
                selected = 1),
    actionButton("plot","Plot!")
    ),
  
  mainPanel(
    plotOutput("graph"))
  )
)