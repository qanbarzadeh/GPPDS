library(quantmod)
#getSymbols(c('AAPL', 'WMT'), src='yahoo')
getSymbols('AAPL', src='yahoo')

chartSeries(AAPL$AAPL.Close, theme="white", TA="addEMA(50, col='black');addEMA(200, col='blue')")

library(TTR)
AAPL.EMA.10 <- EMA(AAPL$AAPL.Close, n=10, ) 
AAPL.EMA.50 <- EMA(AAPL$AAPL.Close, n=50, ) 
AAPL.EMA.200 <- EMA(AAPL$AAPL.Close, n=200, ) 
Fast.Diff <- AAPL.EMA.10 - AAPL.EMA.50
Slow.Diff <- AAPL.EMA.50 - AAPL.EMA.200
addTA(Fast.Diff, col='blue', type='h',legend="Fast moving average")
addTA(Slow.Diff, col='red', type='h',legend="Slow moving average")


library(binhf)

Long_Trades <- ifelse(
  Slow.Diff  > 0 &
    Fast.Diff  > 0 &
    shift(v=as.numeric(Fast.Diff), places=1, dir="right") < 0, AAPL$AAPL.Close, NA)

# look for long exits (same thing but inverse signts)
Short_Trades <- ifelse(
  Slow.Diff  < 0 &
    Fast.Diff  < 0 &
    shift(v=as.numeric(Fast.Diff), places=1, dir="right") > 0, AAPL$AAPL.Close, NA)

plot(AAPL$AAPL.Close,type='l')
grid
points(Long_Trades, col='blue', cex=1.5, pch=18)
points(Short_Trades, col='red', cex=1.5, pch=18)
#fixedsdfsdfasdf


