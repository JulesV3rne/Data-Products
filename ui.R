library(shiny)
library(plotly)

shinyUI(pageWithSidebar(
  headerPanel("Fuel Efficiency Calculator"),
  sidebarPanel(
    sliderInput('wt', 'Enter the car\'s weight (tons)',value = 3, min = 1.5, max = 5.4, step = 0.05,),
    sliderInput('hp', 'Enter the car\'s horsepower',value = 120, min = 52, max = 335, step = 0.5,),
  ),
  mainPanel(
    h4('Your estimated fuel efficiency:'),
    textOutput("prediction"),
    plotlyOutput('mpgGraph'),
    p('The above tool is designed to provide an estimate of fuel effiency based on
      a linear model prediction looking at a car\'s weight and horsepower. Play with 
      the sliders above to adjust your estimated stats and the tool will output your projected fuel efficiency.')
  )
))
