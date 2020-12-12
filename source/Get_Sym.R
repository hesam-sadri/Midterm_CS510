# Downloading the Data for the specified stock: TRyCatch will repeat until it gets a valid symbol for a stock

get_symbol <- function(){
  
  got_stock <- FALSE
  
  while (!got_stock){
    stock_sym <- readline("Please enter a Symbol:>>> ")
    tryCatch({
      my_stock <- getSymbols(stock_sym, verbose = TRUE, src = "yahoo",
                    from=start_date,to=end_date, return.class='ts', auto.assign=FALSE)
    got_stock <- TRUE
    
    },
    error = function(e){
      message('Try again!')
    })

  
 
  }
  
  return(list(symbol=stock_sym, stock=my_stock))
}

