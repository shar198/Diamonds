library(shiny)
library(ggplot2)

## GUI

ui = fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
  sidebarPanel(
    helpText("This app is to visualize the diamonds dataset"),
    textInput(inputId = "title",
              label = "Chart title",
              value = ""),
    selectInput(inputId = "pos",
                label = "Position",
                choices = list("stack","dodge"),
                selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    
    )
  )
)


### Server

server = function(input,output){
  output$plot = renderPlot({
    ggplot(diamonds,aes(x=cut,fill = clarity))+
      geom_bar(position = input$pos)+
      ggtitle(input$title)
  })
}

### Run the app

shinyApp(ui,server)
