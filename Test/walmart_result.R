# This is a test_file to see if the programs work properly on pre-selected stock(WALMART)

rm(list=ls())
library(quantmod)
library(TSA)
library(forecast)
library(TTR)
library(readr)
source('../source//predict_fn.R')
source('../source//Get_Sym.R')
options(warn=-1)

###################### LOADING DATA ###############################



period_days <- 1000   
start_date <- Sys.Date()- period_days
end_date <- Sys.Date()

sym_stock <- getSymbols("WMT", verbose = FALSE, src = "yahoo",
                        from=start_date,to=end_date, return.class='ts', auto.assign=FALSE)




################## Analyzing the data and printing the results #############
print("please wait ...")
final = data.frame()
final <- rbind(final,as.data.frame(get_prediction("WMT", sym_stock,50)))
print("Here is the success rate for Walmart: ")
print(final)

print("The first 2 values are success ratio of Arma model,Holt-Winter models when the remainder pass independece test")
print("The next 2 values are success ratio of Arma model,Holt-Winter models when the remainder do not pass independece test")
print("The last value shows how many of the models have passed the remainder test")
