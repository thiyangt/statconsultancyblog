library(shiny)
library(shinydashboard)
library(ggplot2)
library(palmerpenguins)
data("penguins")


ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        selectInput("scat_x", label = h2("select x-axis"), 
                      choices = colnames(penguins)),
        selectInput("scat_y", label = h2("select y-axis"), 
                      choices = colnames(penguins)),
          ),
      
      box(plotOutput("scatter", height = 250))
    )
    
  )
)

server <- function(input, output) {
  output$scatter<- renderPlot({
    ggplot(penguins, aes_string(x=input$scat_x, y=input$scat_y)) + geom_point()
  })
}


shinyApp(ui, server)