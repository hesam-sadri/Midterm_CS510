library(quantmod)
library(TSA)
library(forecast)
library(TTR)
library(readr)
source('./predict_fn.R')
options(warn=-1)
###################### LOADING DATA ###############################

# Insert the range of days you want to test on it, period_days will go back from current day to set the test start date. Then we insert the stocks symbols and 
# the data will be loaded from the yahoo finance. To do our analysis we should change the data form to ts format. I choose closing price to do my analysis, feel
# free to modify it 

period_days = 1000   
stock_list <- c("FB", "AAPL", "GOOG","INTC","IBM","NVDA","SIRI","SPOT","AMZN","WFC","GE","EBAY","VZ","DIS","NKE","WMT","TSLA","TGT","NFLX")
start_date <- Sys.Date()- period_days
end_date <- Sys.Date()


for (stock_sym in stock_list){
  getSymbols(stock_sym, verbose = TRUE, src = "yahoo",
             from=start_date,to=end_date, return.class='ts')
}
  



# 
# 
# 
final = data.frame()
# 
# 
# 
final <- rbind(final,as.data.frame(get_prediction("AAPL",AAPL)))
# final <- rbind(final,as.data.frame(get_prediction("DIS",DIS)))
# #final <- rbind(final,as.data.frame(get_prediction("EBAY",EBAY)))
# # final <- rbind(final,as.data.frame(get_prediction("FB",FB)))
# # final <- rbind(final,as.data.frame(get_prediction("GE",GE)))
# # final <- rbind(final,as.data.frame(get_prediction("GOOG",GOOG)))
# # final <- rbind(final,as.data.frame(get_prediction("IBM",IBM)))
# # final <- rbind(final,as.data.frame(get_prediction("INTC",INTC)))
# # final <- rbind(final,as.data.frame(get_prediction("NKE",NKE)))
# # final <- rbind(final,as.data.frame(get_prediction("NVDA",NVDA)))
# # final <- rbind(final,as.data.frame(get_prediction("SIRI",SIRI)))
# # final <- rbind(final,as.data.frame(get_prediction("TGT",TGT)))
# # final <- rbind(final,as.data.frame(get_prediction("TSLA",TSLA)))
# # final <- rbind(final,as.data.frame(get_prediction("WFC",WFC)))
# # final <- rbind(final,as.data.frame(get_prediction("WMT",WMT)))
# # final <- rbind(final,as.data.frame(get_prediction("VZ",VZ)))
# # final <- rbind(final,as.data.frame(get_prediction("NFLX",NFLX)))
# # final <- rbind(final,as.data.frame(get_prediction("SPOt",SPOT)))
# # final <- rbind(final,as.data.frame(get_prediction("AMZN",AMZN)))
# # result = list()
# # for (idx in seq(length(stock_list))){
# #   print(idx)
# #   stock_index = stock_list[idx]
# #  
# #   # ... make some data
# #   dat <- as.data.frame(get(stock_index))
# #   
# #   datalist[[idx]] <- dat # add it to your list
# # }
# # 
# # big_data = do.call(rbind, stock_list) 
