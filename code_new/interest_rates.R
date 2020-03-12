## This code imports raw interest rates and stock price data 
## Data Source:
## Output is a csv file containing XXXXXXXXXXXXXXXXXXX

#setwd()

## Imports Weekly T-Bill Rates from FRED
## Description: 4-Week Treasury Bill: Secondary Market Rate (WTB4WK)
## Frequency: Weekly, Ending Friday -- Averages of business days.
## Unit: Percent, Not Seasonally Adjusted 
## Dates: January 2003 -- December 2016
## Source: https://fred.stlouisfed.org/series/WTB4WK
## Primary Source: Board of Governors of the Federal Reserve System (US)
## Retrival Date: March 12, 2020

A = read.csv('data_raw/fred_tbill_rates_weekly.csv')


## Imports Monthly T-Bill Rates from FRED
## Description: 4-Week Treasury Bill: Secondary Market Rate (TB4WK)
## Frequency: Monthly -- Averages of business days.
## Unit: Percent, Not Seasonally Adjusted 
## Dates: January 2003 -- December 2016
## Source: https://fred.stlouisfed.org/series/TB4WK
## Primary Source: Board of Governors of the Federal Reserve System (US)
## Retrival Date: March 12, 2020

B = read.csv('data_raw/fred_tbill_rates_monthly.csv')


## Imports Daily S&P500 Stock Prices
## Description: S&P 500 (^GSPC)
## Frequency: Daily
## Unit: USD
## Dates: January 2003 -- December 2016
## Source: https://finance.yahoo.com/quote/^GSPC/history
## Primary Source: ICE Data Services
## Retrival Date: March 12, 2020

C = read.csv('data_raw/yahoo_sp500_stockprices_daily.csv')

