#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

CPIData = pd.read_csv("../UseData/CPI.csv", sep=",")
TBillData = pd.read_csv("../UseData/TBill.csv", sep=",")
StocksData = pd.read_csv("../UseData/Stocks.csv", sep=",")

# Drops DATE on StockData to avoid duplicates in merge
#CPIData.drop(columns = 'lagvalue', inplace=True)
StocksData.drop(columns = 'DATE', inplace=True)

# Calculates periodwise inflation rate
CPIData['inflation'] = (CPIData['value'] / CPIData['value'].shift(1)) - 1

#Calculates periodwise stock returns
StocksData['r_stocks'] = (StocksData['stockprice'] / StocksData['stockprice'].shift(1)) - 1

IRData = pd.merge(CPIData, TBillData, how='left', on=['year', 'month'])
IRData = pd.merge(IRData, StocksData, how='left', on=['year', 'month'])

# Sets NaN for 01/2003 inflation (bogus values originated due to calculation boundary errors)
IRData.loc[(IRData['year'] == 2003) & (IRData['period'] == 'M01'), 'inflation'] = np.NaN

IRData = IRData.sort_values(['year', 'month', 'series_id'])
IRData = IRData.reset_index(drop = True)

# Old code, new r calculation below
#IRData['r'] = IRData['TB3MS'] * (IRData['value'] / IRData['CPIBase'])
IRData['r'] = IRData['TB4WK']/100 - ((IRData['value'] / IRData['lagvalue']) - 1)


# Calculates inflation adjusted return rate of t-bills with $ r_defl = [(1+r)/(1+pi)]-1 $
IRData['r_tbills_defl'] = ((1+IRData['TB4WK']/100) / (1+IRData['inflation'])) - 1

# Calculates inflation adjusted stock returns
IRData['r_stocks_defl'] = ((1+IRData['r_stocks']) / (1+IRData['inflation'])) - 1


## run to export to CSV
IRData.to_csv("../UseData/IRDataWithStocks.csv", index=False)

