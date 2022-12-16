## app.R ##
library(shinydashboard)
library(shiny)
library(palmerpenguins)
data(penguins)
library(ggplot2)

ui <- dashboardPage(
  dashboardHeader(title="Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    box(plotOutput("Scatterplot"))
    )
)

server <- function(input, output) { 
  output$Scatterplot <- renderPlot(ggplot(data = penguins, 
                                          aes(x = flipper_length_mm,
                                              y = body_mass_g)) +
                                     geom_point(aes(color = species, 
                                                    shape = species),
                                                size = 3,
                                                alpha = 0.8) )
    
    
    }

shinyApp(ui, server)