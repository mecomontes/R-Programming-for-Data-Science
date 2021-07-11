library(shiny)
library(gapminder)

# Define Server
shinyServer(function(input, output) {
  output$MiHistograma <- renderPlot({
    lf <- gapminder$lifeExp
    intervalos <- seq(min(lf), max(lf), length.out = input$intervalos + 1)
    hist(lf, breaks = intervalos, col = 'darkorchid3', border = 'white',
         xlab = 'Esperanza de vida al nacer (Años)', ylab = 'Frecuencia', main = 'Mi primer Histograma')
  })
})