library(shiny)
library(gapminder)

# Define UI
shinyUI(fluidPage(
  titlePanel(tags$em(tags$strong('Esperanza de vida al nacer vs PIB'))),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = 'intervalos',
                  label = 'Número de intervalos',
                  min = 1,
                  max = 50,
                  value = 40),
      tags$h6(tags$b('Desarrollado por:')),
      tags$img(src = 'LogoRLadiesTras.png', height = 110, weight = 110)
    ),
    mainPanel(
      plotOutput(outputId = 'MiHistograma')
    )
  )
))

# install.packages('rsconnect')
# rsconnect::setAccountInfo(name='robinson-montes',
#                          token='2E1BBB9F7242A2E6950975BB2500250F',
#                          secret='cneQ7DfwfB0y9eW9eHixDQVBxg5+BOCzRDXyHbnp')
