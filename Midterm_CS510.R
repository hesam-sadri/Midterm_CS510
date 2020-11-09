#if you don't have these libraries please un-comment the line and run the code to install the related package.

# install.packages("TSA")
# install.packages("forecast")
# install.packages("TTR")
# install.packages("quantmod")
# install.packages("reader")


rm(list=ls())
library(quantmod)
library(TSA)
library(forecast)
library(TTR)
library(readr)
source('./predict_fn.R')
source('./Get_Sym.R')
options(warn=-1)

###################### LOADING DATA ###############################

# Insert the range of days you want to test on it, period_days will go back from current day to set the test start date. Then we insert the stocks symbols and 
# the data will be loaded from the yahoo finance. To do our analysis we should change the data form to ts format. I choose closing price to do my analysis, feel
# free to modify it 

period_days = 1000   
start_date <- Sys.Date()- period_days
end_date <- Sys.Date()

cat('please Enter the symbol you want : ')
cat('Some famous stock symbols are : "FB", "AAPL", "GOOG","INTC","IBM","NVDA","SIRI","SPOT","AMZN","WFC","GE","EBAY","VZ","DIS","NKE","WMT","TSLA","TGT","NFLX" ')

sym_stock = get_symbol()
stock_sym <- sym_stock$symbol
my_stock <- sym_stock$stock

final = data.frame()
final <- rbind(final,as.data.frame(get_prediction(stock_sym, my_stock)))
print("Here is the success rate: ")
print(final)
