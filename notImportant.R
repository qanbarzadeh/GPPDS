#Group project (WQD7001, Ali,Kangwei,Kai)

# we are working with quantitiative financial data in this ..
# project first we need to intall quantmode package. 
getwd()
#setwd("C:\Users\ali\OneDrive - 365.um.edu.my\WQD7001")
#setwd("/Users/Ali/Documents/GitHub/GPPDS")

#LIST OF FINANCIAL DATASETS
#Amazon.com, Inc. (AMZN), S&P 500 (^GSPC), Dow Jones Industrial Average (^DJI), ASDAQ Composite (^IXIC),
#Russell 2000 (^RUT), EUR/USD (EURUSD=X), FTSE 100 (^FTSE), USD/JPY (JPY=X), Nikkei 225 (^N225), Domino's Pizza, Inc. (DPZ),
# Domino's Pizza, Inc. (DPZ), Facebook, Inc. (FB), Facebook, Inc. (FB), Micron Technology, Inc. (MU), Intel Corporation (INTC), 
# Apple Inc. (AAPL), American Airlines Group Inc. (AAL), AT&T Inc. (T), Sprint Corporation (S), AT&T Inc. (T),
# CAC 40 (^FCHI), KOSPI Composite Index (^KS11), Microsoft Corporation (MSFT),Baidu, Inc. (BIDU)
#-----------------------------------------------------------------------------------------------

#LIST OF TECHNICAL INDICATORS

#https://www.quantmod.com/examples/charting/

#--------------------------------------------------





install.packages('quantmod')
install.packages('TTR')

#loading quantmod library
library(quantmod)

#downloading stock and symbols we need with peice of code
#we are going to downlaod many symbols, here I get Wamlmart

#Apple stock
getSymbols('AAPL', src = 'yahoo')
#Walmart
getSymbols('WMT', src = 'yahoo')
#google
getSymbols('GOOG', src='yahoo')

#inputing APPL to view() function u can see their respective dataset
# head and tail 
head(AAPL)
tail(AAPL)
#to see min , max , mean , median ...
summary(AAPL)

# user may want to call several symbols at once..
#we can impelement it in our UI(Shiny) eith this command

several_symbols <-c('WMT','AAPL','^GSPC')
getSymbols(several_symbols, src='yahoo')

#to make sure rows are in the same date and putting in dataframe
portfolio <-data.frame(as.xts(merge(AAPL,WMT,GOOG)))


#------------------------------------------------------------------
#now we have charts,we are going to visualzie them , so in in our shiny UI
#we should desgin a dropdownlist or whatever similar object to hold our stock symbols
# ;) 

#drawing a line chart for Apple

lineChart(AAPL,line.type = 'h', theme ="white")

#bar chart , TA = null for hiding volume section below chart
barChart(AAPL,bar.type = 'hlc',TA= NULL)

#candel chart 

candleChart(AAPL,TA = NULL, subset= '2017')
#or pcik a sepcific date , Kwang 
candleChart(AAPL, TA=NULL, subset ='2017-05::2017-07')
#------------------------------------------------------
candleChart(AAPL,theme = 'white', subset = '2017-05::2017-07')
#-----------------------------------------------------------------

# we are going to add some indicotors to our charts : 
#1-simple moving average SMA
# 2-rate of change 
# 3-CCI indictor 
# 4- bollingerBands or bband
# 5 - a cusotm indictor that ise fomred using the difference between two 
# .. moving avarages e.g 200,50 

#adding multiple moving averages to predict chart trend 

install.packages('TTR')
#adding another financial chart type ri enable us to add more features ,indocators  (chart series)
library(TTR)
chartSeries(AAPL, theme = 'white')
?TTR
chartSeries(AAPL,theme = 'white')
#adding a moveing average indictor 
addSMA(n=200) # 200 day sma 
#adding ROC 
addROC(n=100)
#add CCI 
chartSeries(GOOG,theme='white',TA= "addCCI();addSMA(n=200)")
#add BBands
chartSeries(GOOG,theme='white',TA="addBBands(n=50)",subset ='2014::2017')

#-------------------------------------------------------------------
library(quantmod)
#getSymbols(c('AAPL', 'GOOG'), src='yahoo')
chartSeries(AAPL$AAPL.Close, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')")
#names(AAPL) to see Open close hogh and low ... of this stock 
#same thing for GSPC 
chartSeries(GSPC$GSPC.Close, theme="white", TA="addEMA(50, col='black'); addEMA(200, col='red')")

#aadding difference of moving aeverage indicators to predcit price trend 
library(TTR)

AAPL.EMA.50<- EMA(AAPL$AAPL.Close, n=50, ) 
AAPL.EMA.200<- EMA(AAPL$AAPL.Close, n=200, )  
addTA(AAPL.EMA.50 - AAPL.EMA.200,col='blue', type='h',legend="Difference of MA's")


#----------------------------------#----------------------------------#----------------------------------
#----------------------------------#----------------------------------#----------------------------------
#----------------------------------#----------------------------------#----------------------------------
#In this section we build the TradingSystem.@Kwangwei you use the code produced in this section as an alert; 
#for portfolio  diversification purposes I work on dowJones (^DJI) and nasdq (^DJI); 

install.packages('binhf')
library(binhf)
library(quantmod)
install.packages('TTR')
library(TTR)
getSymbols(c('^DJI'), src='yahoo')
getSymbols(c('IBEX', 'SPY'), src='yahoo')

chartSeries(IBEX$IBEX.Close, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')",subset = '2017')
chartSeries(SPY, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')",subset = '2017')

SPY.EMA.50<- EMA(SPY$SPY.Close, n=50 ) 
SPY.EMA.200<- EMA(SPY$SPY.Close, n=200 )  
addTA(SPY.EMA.50 - SPY.EMA.200,col='blue', type='h',legend="50-200 MA")


library(TTR)
chartSeries(IBEX, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')",subset = '2017')

IBEX.EMA.50 <- EMA(IBEX$IBEX.Close, n=50) 
IBEX.EMA.200 <- EMA(IBEX$IBEX.Close, n=200) 
addTA(IBEX.EMA.50 - IBEX.EMA.200, col='blue', type='h',legend="50-200 MA")

chartSeries(IBEX, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')",subset = '2017')


IBEX.EMA.10 <- EMA(IBEX$IBEX.Close, n=10) 
IBEX.EMA.50 <- EMA(IBEX$IBEX.Close, n=50) 
IBEX.EMA.200 <- EMA(IBEX$IBEX.Close, n=200) 
Fast.Diff <- IBEX.EMA.10 - IBEX.EMA.50
Slow.Diff <- IBEX.EMA.50 - IBEX.EMA.200
addTA(Fast.Diff, col='blue', type='h',legend="10-50 MA")
addTA(Slow.Diff, col='red', type='h',legend="50-200 MA")

getSymbols('SPY')
chartSeries(SPY, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')")

SPY.EMA.10 <- EMA(SPY$SPY.Close, n=10) 
SPY.EMA.50 <- EMA(SPY$SPY.Close, n=50) 
SPY.EMA.200 <- EMA(SPY$SPY.Close, n=200 ) 
Fast.Diff <- SPY.EMA.10 - SPY.EMA.50
Slow.Diff <- SPY.EMA.50 - SPY.EMA.200
addTA(Fast.Diff, col='blue', type='h',legend="10-50 MA")





#----------------------------------#----------------------------------#----------------------------------
#----------------------------------#----------------------------------#----------------------------------
#coding for trading 
getSymbols('SPY')
EMA.Fast <- EMA(SPY$SPY.Close, n=10) 
EMA.Medium <- EMA(SPY$SPY.Close, n=50 ) 
EMA.Slow <- EMA(SPY$SPY.Close, n=200) 
Fast.Diff <- EMA.Fast - EMA.Medium
Slow.Diff <- EMA.Medium - EMA.Slow

# trading strategy for buying
Long_Trades <- ifelse(
  Slow.Diff  > 0 &
    Fast.Diff  > 0 &
    shift(v=as.numeric(Fast.Diff), places=1, dir="right") < 0, SPY$SPY.Close, NA)

# trading strategy for selling 
Short_Trades <- ifelse(
  Slow.Diff  < 0 &
    Fast.Diff  < 0 &
    
    shift(v=as.numeric(Fast.Diff), places=1, dir="right") > 0, SPY$SPY.Close, NA)
    




    
    
    
    
    
