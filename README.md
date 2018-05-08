# WQD7001 Principles of Data Science
## QuantX

Group members

1. Ng Kang Wei             WQD170068
2. Alireza Ghanbarzardeh   WQD170061
3. Ng Koi Yee              WQD170081

## Introduction
QuantX is a financial data analysis app. It is used to visualize the stock price movement over a period of time. User would be able to select some indicators to be added on to the chart to show some additional information. The following sections would discuss each of the component in the user interface and each of the indicator in the app.

Content
* [User interface](#user-interface)
* [Bollinger bands](#bollinger-bands)
* [Volume](#volume)
* [Commodity channel index](#commodity-channel-index)
* [Simple moving average](#simple-moving-average)
* [Exponential moving average](#exponential-moving-average)
* [Weighted moving average](#weighted-moving-average)
* [Rate of change](#rate-of-change)
* [Average true range](#average-true-range)
* [Relative strength indicator](#relative-strength-indicator)
* [Stochastic momentum index](#stochastic-momentum-index)
* [Detrended price oscillator](#detrended-price-oscillator)
* [Price envelope](#price-envelope)
* [Fast moving average](#fast-moving-average)
* [Slow moving average](#slow-moving-average)

## User Interface
### Menu
In the drop down menu, user can select one of the stock to be analyzed.

The slider allows the user to choose to visualize how many days of the stock price movement.

The theme selection allows the user to change the theme of the chart to light or dark, according to the user preference. Some indicators can be seen better on a dark theme.

The checkboxes are the indicators selection. User can select what indicators to be added onto the chart. Elaboration on each of the indicators are in the following sections.

The radio button lets user to switch between 2 types of averages, namely fast moving average and slow moving average.

### Output
There are 2 tabs for output, one is to display the charts or the visualization of the stock price movement, another to display the summary of the stock price data.

#### Trade Strategy
This tab would output 2 charts. The chart at the top would visualize the selected stock price movement with bollinger bands and the user selected indicators.

The chart at the bottom would highlight the optimum buying and selling opportunity for the selected stock based on the historical data.

#### Summary
This tab would output a table. The table would illustrates the summary of the stock price data used to plot the chart. User can move the slider on the menu to select the time period, the summary table would reflect the changes

#### User Guide
This tab would be the documentation or the user guide for this app. It would contain this very document itself.

## Bollinger Bands
Bollinger bands are developed by John Bollinger. Bollinger bands are volatility bands placed above and below a moving average. It is the 2 lines at the top and bottom of the charts. Volatility is the degree of variation of a trading proce series over time as measured by the standard deviation of logarithmic returns.

Bollinger bands consist of a middle band with two outer band. The middle band is a simple moving average that is usually set at 20 periods. Bollinger bands are used to identify M-Tops and W-Bottoms or to determine the strength of the trend.

## Volume
Volume is simply the number of shares or contracts that trade over a given period - usually a day. Volume is used by technical analyst to confirm trends and chart patterns. The strength of any given price movement is measured primarily by the volume. In fact, a 50% rise in stock price may not be all that relevant at all if it occurs on very little volume.

## Commodity Channel Index
Commodity channel index (CCI) is developed by Donald Lambert. It is a versatile indicator that can be used to identify a new trend or warn of extreme conditions. In general, CCI measures the current price level relative to an average price level over a given period of time. CCI is relatively high when prices are far above their average. CCI is relatively low when prices are far below their average. In this manner, CCI can be used to identify overbought and oversold levels.

When CCI is used as a coincident indicator, surges above +100 reflect strong price action that can signal the start of an uptrend. Plunges below -100, reflect weak price action that can signal the start of a downtrend.

CCI as a leading indicator, chartists can look for overbought or oversold conditions that may foreshadow a mean reversion. Similarly, bullish and bearish divergences can be used to detect early momentum shifts and anticipate trend reversals.

## Simple Moving Average
Simple moving average (SMA) is an arithmetic moving average calculated by adding the closing price of the security for a number of time periods and then dividing this total by the number of time periods, which gives the average price of the security over the time period.

A simple moving average smoothes out volatility, and makes it easier to view price trend of a security. If the simple moving average points up, this means that the security's price is increasing. If it it pointing down it means that the security's price is decreasing. The longer the timeframe for the moving average, the smoother the simple moving average. A shorter-term moving average is more volatile, but its reading is closer to the source data.

## Exponential Moving Average
Exponential moving average (EMA) indicator was developed to counter the lagging of the SMA indicator by weighting more recent prices more heavily. It was designed to smooth out the effects of price volatility and create a clearer picture of changing price trends. Traders use an EMA, sometimes in concert with another EMA for a different period, to signal confirmation of a change in price behaviour.

EMAs are commonly used in conjunction with other indicators to confirm significant market moves and to gauge their validity. When the market is in a strong and sustained uptrend, the EMA indicator line will also show an uptrend and vice-versa for a downtrend.

## Weighted Moving Average
Weighted Moving Average (WMA) is a weighted average of the last 'n' price, where the weighting decreases with each previous price. This is a similar concept with EMA but the calculation for WMA is different. WMA can have different weights assigned based on number periods used in the calculation.

If there are four prices you want a weighted moving average of, then the most recent weighting could be 4/10, the period before could have a weight of 3/10, the period prior to that could have a weighting of 2/10, and so on. 10 is a randomly picked number, and a weight of 4/10 means the most recent price will amount for 40% of the value of the WMA. The price 3 periods ago only accounts of 10% of the WMA value.

## Rate of Change
The rate of change (ROC) indicator which also referred to as simple momentum, is a pure momentum oscillator that measures the percent change in price from one period to the next. ROC compares the current price with the price 'n' periods ago. The plot forms an oscillator that fluctuates above and below the zero line as the ROC moves from positive to negative.

In general, prices are rising as long as the ROC remains positive. Conversely, prices are falling when the ROC is negative. ROC expands into positive territory as an advance accelerates. ROC dives deeper into negative territory as a decline accelerates. ROC produces identifiable extremes that signal overbought and oversold conditions.

## Average True Range
Developed by J. Welles Wilder, the Average True Range (ATR) is an indicator that measures volatility. Wilder designed ATR with commodities and daily prices in mind. Commodities are frequently more volatile than stocks. They were often subject to gaps and limits moves, which occur when a commodity opens up or down its maximum allowed move for the session. A volatility formula based on the high-low range would fail to capture volatility from gap or limit moves. Wilder created ATR to capture this "missing" volatility. It is important to remember that ATR does not provide an indication of price direction, just volatility.

## Relative Strength Indicator
Relative Strength Indicator (RSI) also developed by J. Welles Wilder, is a momentum oscillator that measures the speed and change of price movements. The RSI oscillates between 0 and 100. Traditionally the RSI is considered overbought when above 70 and oversold when below 30. RSI can also be used to identify general trend.

## Stochastic Momentum Index
Stochastic Momentum Index (SMI) is considered a refinement of the stochastic oscillator. It calculates the distance of current closing price as it relates to the median of the high/low range of price. William Blau developed the SMI in an attempt to provide a more reliable indicator, less subject to false swings.

The SMI has a normal range of values between +100 and -100. When the present closing price is higher than the median or midpoint, value of the high/low range, the resulting value is positive. When the current closing price is lower than that of the midpoint of the high/low range, the SMI has a negative value. SMI is an indicator for overbought or oversold conditions in a market, it is also used as a general trend indicator. Values above 40 as indicative of a bullish trend and negative values less than -40 as showing a bearish trend.

## Detrended Price Oscillator
Detrended Price Oscillator (DPO) is an indicator designed to remove trend from price and make it easier to identify cycles. DPO does not extend to the last date because it is based on a displaced moving average. However, alignment with the most recent is not an issue because DPO is not a momentum oscillator. Instead DPO is used to identidy cycles highs/lows and estimate cycle length.

## Price Envelope
Price envelopes or percentage bands are plotted at a set of percentage above and below a moving average. The moving average which forms the base for this indicator can be a simple or exponential moving average. Each envelope is then set the same percentage above or below the moving average. This creates parallel bands that follow price action. With a moving average as the base, it can be used as a trend following indicator. It is also used to indicate overbought and oversold levels when the trend is relatively flat.

## Fast Moving Average
Fast moving average is a short term moving average. For end-of-day stock markets, for example, it maybe 5-, 10- or 25-day period. A short term moving average is faster because it only considers prices over short period of time and thus is more reactive to daily price changes.

## Slow Moving Average
Slow moving average is a medium or long term moving average, for example, 50-, 100-, 200-day period. Long term moving average is deemed slower as it encapsulates prices over a longer period and is more lethargic. However it tends to smooth out price noises which are often reflected in short term moving averages or fast moving average.