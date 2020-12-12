# #################### PREDICTION FUNCTION ########################

get_prediction <- function(name,symbol,w_length){
 # w_length <- 50             #sliding window length
  final <- list();
  final["symbol"] <- name
  arma_good_count <- 0
  hw_good_count <- 0                      # counting the number of Holt-winter models which remainders pass Box test
  arma_poor_count <- 0                    # counting the number of Arma models which remainders pass Box test
  hw_good_count <- 0                      # counting the number of Holt-winter models which remainders cannot pass Box test
  hw_poor_count <- 0                      # counting the number of Arma models which remainders cannot pass Box test
  good_count <- 0                         # total number of models in which remainders pass Box test 
  poor_count <- 0                         # total number of models in which remainders cannot pass Box test
  test_period <- 100                      
  for (i in 1:test_period){
    
    w_start <- nrow(symbol) - (test_period + w_length) + i              #prerdict windows start index
    window_renge <- w_start:(w_start+w_length)
    window <- w_start + w_length
    arma_forecast <- forecast(auto.arima(symbol[window_renge]),h=1)$mean[1]
    Btest <- Box.test(resid(auto.arima(symbol[window_renge])))
    
    if (Btest$p.value >= 0.05){
      good_count <- good_count + 1
      
      if ((((symbol[window] - symbol[(window + 1)]) >= 0) == ((symbol[(window)] - arma_forecast) >= 0))){
        arma_good_count <- arma_good_count + 1;
      }
      
      tryCatch({
        hw_forecast <- forecast(HoltWinters(symbol[window_renge],gamma=FALSE,),h=1)$mean[1]
      }, error=function(e){})
      
      
      
      
      if ((((symbol[window] - symbol[(window + 1)]) >= 0) == ((symbol[window] - hw_forecast) >= 0))){
        hw_good_count <- hw_good_count + 1;
      }
    }else{
      poor_count <- poor_count + 1
      
      if ((((symbol[(window)] - symbol[(window + 1)]) >= 0) == ((symbol[window] - arma_forecast) >= 0))){
        arma_poor_count <- arma_poor_count + 1;
      }
      
      tryCatch({
        hw_forecast <- forecast(HoltWinters(symbol[window_renge],gamma=FALSE,),h=1)$mean[1]
      }, error=function(e){})
      
      
      
      
      if((((symbol[(w_start+w_length)] - symbol[(w_start+w_length+1)]) >= 0) == ((symbol[(w_start+w_length)] - hw_forecast) >= 0))){
        hw_poor_count = hw_poor_count + 1;
      }
      
    }
  }
  final["ARMA-good"] = arma_good_count/good_count;
  final["HW_good"] = hw_good_count/good_count;
  final["ARMA-poor"] = arma_poor_count/poor_count;
  final["HW_poor"] = hw_poor_count/poor_count;
  final["GOOD_PERCENT"] = good_count/test_period
  final
}