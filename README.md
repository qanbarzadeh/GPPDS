# WQD7001 Principles of Data Science
## Group project 
Group members

1. Ng Kang Wei             WQD170068

2. Alireza Ghanbarzardeh   WQD170061

3. Ng Koi Yee              WQD170081

## Introduction
This financial analysis app is used to visualize the stock price movement over a period of time and let user select some of the features to be added on the chart. This document would explains the user interface of this app and the features available for the user to select in the app.

Content

* [User interface](#user-interface)

* [Bollinger bands](#bollinger-bands)

* [Volume](#volume)

* [Commodity channel index](#commodity-channel-index)

* [Simple moving average](#simple-moving-average)

* [Exponential moving average](#exponential-moving-average)

* [Rate of change](#rate-of-change)

* [Fast moving average](#fast-moving-average)

* [Slow moving average](#slow-moving-average)


## User Interface
### Menu
In the drop down menu, user can select one of the stock to be analyzed.

The slider allows the user to choose to visualive how many days of the stock price movement.

The theme selection allows the user to change the theme of the chart to light or dark, according to the user preference. Some features can be seen better on a dark theme.

The checkboxes is the features selection. User can select what features to be added onto the chart. Elaboration on each of the features are in the following sections.

The radio button lets user to switch between 2 types of averages, namely fast moving average and slow moving average.

### Output
There are 2 tabs for output, one is to display the charts or the visualization of the stock price movement, another to display the summary of the stock price data.

#### Trade Strategy
This tab would output 2 charts. The chart at the top would visualize the selected stock price movement with bollinger bands and the user selected features

The chart at the bottom would highlight the optimum buying and selling opportunity for the selected stock based on the historical data.

#### Summary
This tab would output a table. The table would illustrates the summary of the stock price data used to plot the chart. User can move the slider on the menu to select the time period, the summary table would reflect the changes

#### User Guide
This tab would be the documentation or the user guide for this app. It would contain this very document itself.

## Bollinger Bands
Bollinger bands are developed by John Bollinger. Bollinger bands are volatility bands placed above and below a moving average. It is the 2 lines at the top and bottom of the charts. Volatility is the degree of variation of a trading proce series over time as measured by the standard deviation of logarithmic returns.

Bollinger bands consist of a middle band with two outer band. The middle band is a simple moving average that is usually set at 20 periods. Bollinger bands are used to identify M-Tops and W-Bottoms or to determine the strength of the trend.

## Volume
Volume is simply the number of shares or contracts that trade over a given period - usually a day. Voulme is used by technical analyse to confirm trends and chart patterns. The strength of any given price movement is measured primarily by the volume. In fact, a 50% rise in stock price may not be all that relevant at all if it occurs on very little volume.

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

## Rate of Change
The rate of change (ROC) indicator which also referred to as simple Momentum, is a pure momentum oscillator that measures the percent change in price from one period to the next. ROC compares the current price with the price 'n' periods ago. The plot forms an oscillator that fluctuates above and below the zero line as the ROC moves from positive to negative.

In general, prices are rising as long as the ROC remains positive. Conversely, prices are falling when the ROC is negative. ROC expands into positive territory as an advance accelerates. ROC dives deeper into negative territory as a decline accelerates. ROC produces identifiable extremes that signal overbought and oversold conditions.

## Fast Moving Average
Fast moving average is a short term moving average. For end-of-day stock markets, for example, it maybe 5-, 10- or 25-day period. A short term moving average is faster because it only considers prices over short period of time and thus is more reactive to daily price changes.

## Slow Moving Average
Slow moving average is a medium or long term moving average, for example, 50-, 100-, 200-day period. Long term moving average is deemed slower as it encapsulates prices over a longer period and is more lethargic. However it tends to smooth out price noises which are often reflected in short term moving averages or fast moving average.