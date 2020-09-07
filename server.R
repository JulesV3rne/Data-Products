library(dplyr)
library(shiny)
library(UsingR)
library(plotly)
data(galton)

model <- lm(mpg ~ wt + hp, mtcars)


shinyServer(
  function(input, output) {

    output$mpgGraph <- renderPlotly({
      hp <- input$hp
      wt <- input$wt
      pred_mpg <- predict(model, newdata=data.frame(wt=wt,hp=hp))
      output$prediction <- renderText({paste(round(pred_mpg[[1]],3), " MPG")})
      plot_ly() %>%
        add_trace(z= mtcars$mpg, y=mtcars$wt,x=mtcars$hp) %>%
        add_trace(x=hp,y=wt,z=pred_mpg) %>%
        layout(scene = list(
          xaxis = list(title = "Horsepower"),
          yaxis = list(title = "Weight (tons)"),
          zaxis = list(title = "Fuel Efficiency (MPG)")
        ))
      #mu <- input$hp
      #lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      #mse <- mean((galton$child - mu)^2)
      #text(63, 150, paste("mu = ", mu))
      #text(63, 140, paste("MSE = ", round(mse, 2)))
      })
    
  }
)
