library(shiny)
library(quantmod)
library(TTR)

# A predefined list of stocks
stocks <- c('Apple' = 'AAPL', 'Google' = 'GOOG', 'Wallmart' = 'WMT','Amazon'='AMZN',
            'S&P 500' = '^GSPC','NASDAQ'='^IXIC')
features <- c('Bollinger Bands'='addBBands()', 'Volume'='addVo()',
             'Commodity Channel Index'='addCCI()', 'Simple Moving Average'='addSMA()',
             'Rate of Change' = 'addROC()', 'Exponential Moving Average'='addEMA()')
averages <- c('Fast moving average'=1, 'Slow moving average'=2)

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
                       selected='addBBands()'),
    # Radio buttons for user to select a type of average
    radioButtons(inputId='average', label='Type of average', choices=averages,
                 selected=1)
  ),
  mainPanel(
    plotOutput('price_plot'),
    br(),
    dataTableOutput('stock_table')
    #textOutput('selected_stock'),
    #textOutput('selected_time'),
    #textOutput('selected_features'),
    #tabsetPanel(
    #  id = 'table',
    #  tabPanel('stock', DT::dataTableOutput('stockTable'))
    #)
  )
)

# The main function that handle input from UI and output graphs
server <- function(input, output, session) {
  # Checking the input is obtained correctly
  #output$selected_stock <- renderText({
  #  paste("You have selected ", input$stock)
  #  })
  #output$selected_time <- renderText({
  #  paste("You have selected this time period", input$time)
  #})
  #output$selected_features <- renderText({
  #  paste(input$features, collapse=';')
  #})
  #output$stockTable <- DT::renderDataTable({
  #  stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
  #  DT::datatable(stock, options = list(orderClasses=TRUE))
  #})
  output$stock_table <- renderDataTable({
    stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    #sub_stock <- stock[, 4, drop=FALSE]
  })
  # Output the chart
  output$price_plot <- renderPlot({
    stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    ema.10 <- EMA(stock[, 4, drop=FALSE], n=10, ) 
    ema.50 <- EMA(stock[, 4, drop=FALSE], n=50, ) 
    ema.200 <- EMA(stock[, 4, drop=FALSE], n=200, )
    fastDifference <- ema.10 - ema.50
    slowDifference <- ema.50 - ema.200
    chartSeries(stock,theme = "white",TA=paste(input$features, collapse = ';'),
                subset = paste('last', input$time, "days"))
    
    if (input$average==1) {
      addTA(fastDifference, on=NA, col='blue', legend="Fast moving average")  
    } else {
      addTA(slowDifference, on=NA, col='red', legend="Slow moving average") 
    }
  })
  
}

shinyApp(ui = ui, server = server)