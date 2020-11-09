# Downloading the Data for the specified stock:

get_symbol <- function()
  
{
  while (TRUE){
    stock_sym <- readline("Please enter a Symbol:>>> ")
    tryCatch({
      my_stock <- getSymbols(stock_sym, verbose = TRUE, src = "yahoo",
                    from=start_date,to=end_date, return.class='ts', auto.assign=FALSE)
    break
    },
    error = function(e){
      message('Try again!')
    })

  
 
  }
  
  return(list(symbol=stock_sym, stock=my_stock))
}

