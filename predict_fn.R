# #################### PREDICTION FUNCTION ########################

get_prediction = function(name,symbol){
  w_length = 50             #sliding window length
  final = list();
  final["symbol"] = name
  arma_good_count = 0
  hw_good_count = 0
  arma_poor_count = 0
  hw_good_count = 0
  hw_poor_count = 0
  good_count = 0
  poor_count = 0
  test_period = 100
  for(i in 1:test_period){
    
    w_start = nrow(symbol)- (test_period + w_length) + i #prerdict windows start index
    arma_forecast = forecast(auto.arima(symbol[w_start:(w_start+w_length)]),h=1)$mean[1]
    Btest = Box.test(resid(auto.arima(symbol[w_start:(w_start+w_length)])))
    
    if (Btest$p.value >= 0.05){
      good_count = good_count+1
      
      if((((symbol[(w_start+w_length)] - symbol[(w_start+w_length+1)]) >= 0) == ((symbol[(w_start+w_length)] - arma_forecast) >= 0))){
        arma_good_count = arma_good_count + 1;
      }
      
      tryCatch({
        hw_forecast = forecast(HoltWinters(symbol[w_start:(w_start+w_length)],gamma=FALSE,),h=1)$mean[1]
      }, error=function(e){})
      
      
      
      
      if((((symbol[(w_start+w_length)] - symbol[(w_start+w_length+1)]) >= 0) == ((symbol[(w_start+w_length)] - hw_forecast) >= 0))){
        hw_good_count = hw_good_count + 1;
      }
    }else{
      poor_count = poor_count+1
      
      if((((symbol[(w_start+w_length)] - symbol[(w_start+w_length+1)]) >= 0) == ((symbol[(w_start+w_length)] - arma_forecast) >= 0))){
        arma_poor_count = arma_poor_count + 1;
      }
      
      tryCatch({
        hw_forecast = forecast(HoltWinters(symbol[w_start:(w_start+w_length)],gamma=FALSE,),h=1)$mean[1]
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