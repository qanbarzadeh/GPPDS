library(shiny)
library(quantmod)

# A predefined list of stocks
stocks <- c('Apple' = 'AAPL', 'Google' = 'GOOG', 'Wallmart' = 'WMT','Amazon'='AMZN',
            'S&P 500' = '^GSPC','NASDAQ'='^IXIC')
features <- c('Bollinger Bands'='addBBands()', 'Volume'='addVo()',
             'Commodity Channel Index'='addCCI()')

# The UI part
ui <- fluidPage(
  headerPanel('Financial Data Analysis'),
  sidebarPanel(
    helpText('Select the stock and the time period to visualize the stock price changes'),
    # Drop down for user to select a stock
    selectInput(inputId = 'stock', label = 'Stock', choices = stocks,
                selected = 0, multiple = FALSE, selectize = FALSE, width = NULL, 
                size = NULL),
    # Slider for user to select time frame
    sliderInput(inputId='time', label='Time Period',
                min = 1, max = 365, value = 30),
    # Checkbox for user to select features to show in chart
    checkboxGroupInput(inputId='features', label='Features', choices=features,
                       selected='addBBands()')
  ),
  mainPanel(
    plotOutput('price_plot'),
    textOutput('selected_stock'),
    textOutput('selected_time'),
    textOutput('selected_features')
  )
)

# The main function that handle input from UI and output graphs
server <- function(input, output, session) {
  # Checking the input is obtained correctly
  output$selected_stock <- renderText({
    paste("You have selected ", input$stock)
    })
  output$selected_time <- renderText({
    paste("You have selected this time period", input$time)
  })
  output$selected_features <- renderText({
    paste(input$features, collapse=';')
  })
  
  # Output the chart
  output$price_plot <- renderPlot({
    data <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    chartSeries(data,theme = "white",TA=paste(input$features, collapse = ';'),
                subset = paste('last', input$time, "days"))
  })
  
}

shinyApp(ui = ui, server = server)