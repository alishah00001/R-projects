# Load required libraries
install.packages("readxl")
library(readxl)
library(ggplot2)
library(forecast)
library(tseries)
install.packages("TTR")
install.packages("forecast")
library(TTR)
library(forecast)
install.packages("corrplot")
library(corrplot)
# Load the ggplot2 library
library(ggplot2)

# Load the Excel file
data <- read_excel("C:/Users/Chaudhary Computer/Downloads/Vital statistics in the UK.xlsx", sheet = "Birth")

# Preview the data to find the starting row for relevant data
print(head(data, 15)) 

#Now check the variables and data types for each variable.
str(data)

# Extract the relevant columns 
cleaned_dataBEW <- data[, c("Year", "Number of live births: England and Wales")]

# Preview the extracted data
head(cleaned_dataBEW)

# Convert columns to numeric
cleaned_dataBEW$Year <- as.numeric(cleaned_dataBEW$Year)
cleaned_dataBEW$`Number of live births: England and Wales` <- as.numeric(cleaned_dataBEW$`Number of live births: England and Wales`)

# Remove rows with NA
cleaned_dataBEW <- na.omit(cleaned_dataBEW)

# Preview cleaned data
head(cleaned_dataBEW)




# Plot the time series data
ggplot(cleaned_dataBEW, aes(x = Year, y = `Number of live births: England and Wales`)) +
  geom_line(color = "blue") +
  labs(title = "Number of live births: England and Wales",
       x = "Year",
       y = "Number of Births") +
  theme_minimal()




# Convert to a time series object
births_tsEW <- ts(cleaned_dataBEW$`Number of live births: England and Wales`, start = min(cleaned_dataBEW$Year), frequency = 1)
#again checking the data
births_tsEW


# Plot the time series
plot(births_tsEW, main = "Number of live births: England and Wales", ylab = "Births", xlab = "Year")



# smoothing
births_tsEWSMA <- SMA(births_tsEW,n=5)
plot.ts(births_tsEWSMA)





births_tsEWSMA3 <- SMA(births_tsEW,n=10)
plot.ts(births_tsEWSMA3)



births_tsEWSMA4 <- SMA(births_tsEW,n=15)
plot.ts(births_tsEWSMA4)



births_tsEWSMA5 <- SMA(births_tsEW,n=25)
plot.ts(births_tsEWSMA5)

frequency(births_tsEW)

#forecasts
births_tsEWforecasts <- HoltWinters(births_tsEW, gamma=FALSE)
births_tsEWforecasts

#fore cast error
births_tsEWforecasts$SSE

#plot
plot(births_tsEWforecasts)



HoltWinters(births_tsEW, gamma=FALSE, l.start=624828, b.start= 16363)


births_tsEWforecasts2 <- forecast(births_tsEW, h=15)
plot(births_tsEWforecasts2)


# ACF plot of residuals
acf(na.omit(births_tsEWforecasts2$residuals), lag.max=20)

# Box-Ljung test on residuals for lags up to 20
Box.test(na.omit(births_tsEWforecasts2$residuals), lag=20, type="Ljung-Box")

# Remove NA values from residuals
births_tsEWforecasts2$residuals <- births_tsEWforecasts2$residuals[!is.na(births_tsEWforecasts2$residuals)]


# Plot time series of residuals
plot.ts(births_tsEWforecasts2$residuals, main="Time Series Plot of Residuals", ylab="Residuals", xlab="Time")

residuals <- residuals(births_tsEWforecasts2)

time <- 1:length(residuals)
model <- lm(residuals ~ time)


library(lmtest)
bptest(model)


# Create a histogram of the residuals
hist(births_tsEWforecasts2$residuals, 
     main = "Histogram of Residuals", 
     xlab = "Residuals", 
     col = "lightblue", 
     border = "black", 
     freq = FALSE)  # freq = FALSE ensures the y-axis is density

# Add a normal distribution curve
curve(dnorm(x, 
            mean = mean(births_tsEWforecasts2$residuals, na.rm = TRUE), 
            sd = sd(births_tsEWforecasts2$residuals, na.rm = TRUE)), 
      add = TRUE, 
      col = "red", 
      lwd = 2)





#Now apply time series 
#difference the time series
births_tsEWdiff1 <- diff(births_tsEW, differences=1)
plot.ts(births_tsEWdiff1)



#diff=2
births_tsEWdiff2 <- diff(births_tsEW, differences=2)
plot.ts(births_tsEWdiff2)


births_tsEWdiff3 <- diff(births_tsEW, differences=5)
plot.ts(births_tsEWdiff3)

library(tseries)

# Perform the Augmented Dickey-Fuller test
install.packages("tseries")
library(tseries)

adf_test <- adf.test(births_tsEWdiff1)
print(adf_test)




#Selecting a Candidate ARIMA Model
#for acf
acf(births_tsEWdiff1, lag.max=20) # plot a correlogram
acf(births_tsEWdiff1, lag.max=20, plot=FALSE)

#for PCF
pacf(births_tsEWdiff1, lag.max=20) # plot a correlogram
pacf(births_tsEWdiff1, lag.max=20, plot=FALSE)


auto.arima(births_tsEW)


#Forecasting Using an ARIMA Model
births_tsEWarima <- arima(births_tsEW, order=c(0,1,1)) # fit an ARIMA(0,1,1) model
births_tsEWarima


#Specifying the confidence level for prediction intervals
births_tsEWforecasts <- forecast(births_tsEWarima, h=5, level=c(99.5))
births_tsEWforecasts

# Without Specifying the confidence level for prediction intervals
births_tsEWforecasts <- forecast(births_tsEWarima, h=5)
births_tsEWforecasts


#plotting 
plot(births_tsEWforecasts)

#make a correlogram of the forecast errors for our ARIMA(0,1,1)
acf(births_tsEWforecasts$residuals, lag.max=20)
Box.test(births_tsEWforecasts$residuals, lag=20, type="Ljung-Box")

#plotting to check the forecast errors are normally distributed
# Plot the time series of residuals
plot.ts(births_tsEWforecasts$residuals, main = "Time Series of Residuals", ylab = "Residuals", col = "blue")

# Plot the histogram of residuals
hist(births_tsEWforecasts$residuals, main = "Histogram of Residuals", xlab = "Residuals", col = "lightblue")


hist(births_tsEWforecasts$residuals, main = "Histogram of Residuals", xlab = "Residuals", col = "lightblue", freq = FALSE)
curve(dnorm(x, mean = mean(births_tsEWforecasts$residuals, na.rm = TRUE), 
            sd = sd(births_tsEWforecasts$residuals, na.rm = TRUE)), 
      add = TRUE, col = "red", lwd = 2)

#--------------------------------------------------------------------------------------------------------
#---------------------------------------------
#  -------------------------------------------
#  
# ---------------------------------





