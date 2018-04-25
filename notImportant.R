#Group project (WQD7001, Ali,Kangwei,Kai)

# we are working with quantitiative financial data in this ..
# project first we need to intall quantmode package. 
getwd()
#setwd("C:\Users\ali\OneDrive - 365.um.edu.my\WQD7001")
setwd("/Users/Ali/Documents/GitHub/GPPDS")


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


#adding a chartSerries fucntion for Dowjones 
chartSeries(DJI$DJI.Close, theme="white", TA="addEMA(50, col='black'); addEMA(200,col='blue')")
#chartseries for DJI
chartSeries(DJI$DJI.Close, theme="white", TA="addEMA(50, col='black'); addEMA(200,col='blue')")


DowEMA10 <- EMA(DJI$DJI.Close, n=10)
DowEMA50 <- EMA(DJI$DJI.Close, n=20)
DowEMA200 <- EMA(DJI$DJI.Close, n=50)

fastMA <- DowEMA50 - DowEMA10
Fast.Diff <- DowEMA10 - DowEMA50
Slow.Diff <- DowEMA50 - DowEMA200
addTA(Fast.Diff, col='blue', type='h',legend="fast")
addTA(Slow.Diff, col='red', type='h',legend="slow")
























