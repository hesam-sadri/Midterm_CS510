# Midterm_CS510
This Repository is crated to save the midterm project of CS510
In this project we will use stock market Data and try to predict the future stuck prices, I wonder how many times we would predict successfully.
I will use different time series models and a sliding window, based on the data in the range of window I will predict tommorrow's market direction. Later I will evaluate the correctness of my prediction by comparing it with the real value of the stock.
So I will go to back in time (for example 5 years) and will use a sliding window (for example 100 days data) and based on this data I will predict the next day market direction, later I will evaluate the performance of my prediction and then move the window further and do another prediction and so on.
I also do my prediction using 2 different models, one of them by using auto.arima function which try to find the best model time series model which fit to our data and the other one by using Holt-winter methods.
Additionally I separate each of this models based on their remainder, If a model have been fitted to our data properly the remainders should be independent of each other. I want to know what percentage of good models and bad models predict future value correctly.
Finally I gathered all of this information in a final table.
