library(shiny)
library(quantmod)

stocks <- c('Apple' = 'AAPL', 'Google' = 'GOOG', 'Wallmart' = 'WMT', 'S&P 500' = '^GSPC')
timePeriod <- c('last 30 days', 'last 3 months', 'last 6 months', 'last 1 year')

ui <- fluidPage(
  headerPanel('Financial Data Analysis'),
  sidebarPanel(
    helpText('Select the stock and the time period to visualize the stock price changes'),
    selectInput(inputId = 'stock', label = 'Stock', choices = stocks,
                selected = 0, multiple = FALSE, selectize = FALSE, width = NULL, 
                size = NULL),
    #selectInput(inputId = 'time', label = 'Time Period', choices = timePeriod,
    #            selected = 0, multiple = FALSE, selectize = FALSE, width = NULL,
    #            size = NULL),
    sliderInput("time", label='Time Period',
                min = 1, max = 100, value = 30)
  ),
  mainPanel(
    plotOutput('price_plot'),
    textOutput('selected_stock'),
    textOutput('selected_time')
  )
)

server <- function(input, output) {
  output$selected_stock <- renderText({
    paste("You have selected ", input$stock)
    })
  output$selected_time <- renderText({
    paste("You have selected this time period", input$time)
  })
  
  output$price_plot <- renderPlot({
    data <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    chartSeries(data,theme = "white",TA ="addBBands()",
                subset = paste('last', input$time, "days"))
  })
  
}

shinyApp(ui = ui, server = server)