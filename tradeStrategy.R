library(quantmod)
#getSymbols(c('AAPL', 'WMT'), src='yahoo')
getSymbols('AAPL', src='yahoo')

chartSeries(AAPL$AAPL.Close, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')")

library(TTR)
AAPL.EMA.10 <- EMA(AAPL$AAPL.Close, n=10, ) 
AAPL.EMA.50 <- EMA(AAPL$AAPL.Close, n=50, ) 
AAPL.EMA.200 <- EMA(AAPL$AAPL.Close, n=200, ) 
fastDifference <- AAPL.EMA.10 - AAPL.EMA.50
SlowDifference <- AAPL.EMA.50 - AAPL.EMA.200
addTA(fastDifference, col='blue', type='h',legend="Fast moving average")
addTA(SlowDifference, col='red', type='h',legend="Slow moving average")


library(binhf)

buySignal <- ifelse(
  SlowDifference  > 0 &
    fastDifference  > 0 &
    shift(v=as.numeric(fastDifference), places=1, dir="right") < 0, AAPL$AAPL.Close, NA)

# look for long exits (same thing but inverse signts)
sellSignal <- ifelse(
  SlowDifference  < 0 &
    fastDifference  < 0 &
    shift(v=as.numeric(fastDifference), places=1, dir="right") > 0, AAPL$AAPL.Close, NA)

plot(AAPL$AAPL.Close,type='l',grid.col = 'white',grid2 = 'white',subset = '2017')
grid
points(buySignal, col='blue', cex=3, pch=18)
points(sellSignal, col='red', cex=3, pch=18)
#fixedsdfsdfasdf


