library(shiny)
library(quantmod)
library(TTR)
library(binhf)

# A predefined list of stocks
stocks <- c('Apple' = 'AAPL', 'Google' = 'GOOG', 'Wallmart' = 'WMT','Amazon'='AMZN',
            'S&P 500' = '^GSPC','NASDAQ'='^IXIC')
features <- c('Bollinger Bands'='addBBands()', 'Volume'='addVo()',
             'Commodity Channel Index'='addCCI()', 'Simple Moving Average (red)'='addSMA()',
             'Exponential Moving Average (blue)'='addEMA()', 'Rate of Change' = 'addROC()')
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
    # Radio button for theme selection
    radioButtons(inputId = 'theme', label='Theme', choices=c('White'=1, 'Black'=2),
                 selected=1),
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
    plotOutput('predict_plot'),
    br()
    #dataTableOutput('stock_table')
  )
)

# The main function that handle input from UI and output graphs
server <- function(input, output, session) {
  output$stock_table <- renderDataTable({
    stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
  })
  
  # Output the chart
  output$price_plot <- renderPlot({
    stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    # Theme color selection
    themeCol <- 'white'
    if (input$theme==1) {
      themeCol <- 'white'
    } else {
      themeCol <- 'black'
    }
    
    # Calculating the EMA for the moving averages
    ema.10 <- EMA(stock[, 4, drop=FALSE], n=10) 
    ema.50 <- EMA(stock[, 4, drop=FALSE], n=50) 
    ema.200 <- EMA(stock[, 4, drop=FALSE], n=200)
    fastDifference <- ema.10 - ema.50
    slowDifference <- ema.50 - ema.200
    
    # Plotting the main chart
    chartSeries(stock,name='Stock Price Movement', theme=themeCol, TA=paste(input$features, collapse = ';'),
                subset = paste('last', input$time, "days"), show.grid=TRUE)
    # Plot the average based on user input
    if (input$average==1) {
      addTA(fastDifference, on=NA, col='blue', legend="Fast moving average")  
    } else {
      addTA(slowDifference, on=NA, col='blue', legend="Slow moving average") 
    }
  })
  
  output$predict_plot <- renderPlot({
    stock <- getSymbols(input$stock, src='yahoo', auto.assign = FALSE)
    
    # Calculating the EMA for the moving averages
    ema.10 <- EMA(stock[, 4, drop=FALSE], n=10) 
    ema.50 <- EMA(stock[, 4, drop=FALSE], n=50) 
    ema.200 <- EMA(stock[, 4, drop=FALSE], n=200)
    fastDifference <- ema.10 - ema.50
    slowDifference <- ema.50 - ema.200
    
    buySignal <- ifelse(
      slowDifference  > 0 &
        fastDifference  > 0 &
        shift(v=as.numeric(fastDifference), places=1, dir="right") < 0, stock[, 4, drop=FALSE], NA)
    
    # look for long exits (same thing but inverse signts)
    sellSignal <- ifelse(
      slowDifference  < 0 &
        fastDifference  < 0 &
        shift(v=as.numeric(fastDifference), places=1, dir="right") > 0, stock[, 4, drop=FALSE], NA)
    
    plot(stock[, 4, drop=FALSE],type='l',grid.col='white',grid2='white',
         subset='2015::2018', main='Buying and Selling oppotunity')
    
    points(buySignal, col='blue', cex=3, pch=17)
    points(sellSignal, col='red',bg='red', cex=3, pch=25)
  })
  
}

shinyApp(ui = ui, server = server)