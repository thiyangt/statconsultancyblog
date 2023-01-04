## app.R ##
library(shinydashboard)
library(shiny)
library(palmerpenguins)
data(penguins)
library(ggplot2)

ui <- dashboardPage(
  dashboardHeader(title="My Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    box(plotOutput("scatterplot"))
    
    
  )
)

server <- function(input, output) { 
 output$scatterplot <- renderPlot({
   ggplot(penguins, aes(x=bill_length_mm, y=flipper_length_mm)) +
     geom_point()
 })
  
    }

shinyApp(ui, server)