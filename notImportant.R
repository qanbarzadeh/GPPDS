#Group project (WQD7001, Ali,Kangwei,Kai)

# we are working with quantitiative financial data in this ..
# project first we need to intall quantmode package. 
getwd()
setwd("C:\Users\ali\OneDrive - 365.um.edu.my\WQD7001")
install.packages('quantmod')

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
head(APPL)
tail(AAPL)
#to see min , max , mean , median ...
summury(WMT)

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
