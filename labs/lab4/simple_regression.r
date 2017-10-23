#install.packages("fpp") # Install Forecasting: principles and practice examples and exercises
#library("fpp")            # Not sure if needed

data1 = read.table("transcoding_measurement.tsv",header=TRUE)
plot(data1$size ~ data1$duration,  xlab = "Duration of video", ylab = "Size of the video")
fit = lm(data1$size ~ data1$duration ) ; abline(fit) #Add straight lines through the current plot
summary(fit) 
# We verify by the plot that the duration of a video does affect the size of it.
# Typically, we can see the the duration and the size of a video are connected with a linear relationship.
# The Multiple R-squared error is 0.1738, meaning that the x-y variables are a bit connected. 
# We can see that the line intersects for sure many observations,
# although the data1-set is too big and we can not see distinct it so much.
# They(x-y) could be less connected(we tested previously another set with an R-squared error of 0.004!)

# Also, the estimated regression line is : \hat y = 2513851.4 + 78589.4x


## Residual plots

res = residuals(fit) # Calculate residuals from the modeling function 'lm'
plot(res ~ data1$duration, ylab = "Residuals", xlab = "Duration of video", ylim = c(-5.0e+08,5.0e+08)); abline(0,0)
# Seeing the plot, we can understand that most of the residuals are between the 
# -5.0e+08 and the +5.03e+08 values(0e+00 and 1e+08 value specifically,if we add the ylim parameter in the plot), 
# with most of the observations having values 0 and 3000 about the duration of the video.
# So, yes, there is a pattern since the values are not so scattered around.

## Forecasting with regression
#library(package = "forecast")
#fitted(fit)[1]
#fcast <- forecast(fit, newdata=data.frame(data1$duration=30))
#plot(fcast, xlab="City (mpg)", ylab="Carbon footprint (tons per year)")


## P-value 
summary(fit)$coef # We calculate the probability of obtaining a value of  β^1
                  # as large as we have calculated if the null hypothesis were true

## Confidence intervals
confint(fit, level = 0.95) # Provide an interval estimate for β^1 in the fitted model

### Non-linear functional forms
# Simply transforming variables y and/or x and then estimating a regression model 
# using the transformed variables is the simplest way of obtaining a non-linear specification.
# We are going to use the log-log functional form 

par(mfrow=c(1,2), mar=c(9,4,0,2)+0.1)
fit2 <- lm(log(data1$size) ~ log(data1$duration)) # Do the fit for : log(y_i) = β_0 + β_1*log(x_i) + ε_i

plot(data1$size ~ data1$duration,  xlab = "Duration of video", ylab = "Size of the video") # Plot standard x-y form
lines(1:25000, exp(fit2$coef[1]+fit2$coef[2]*log(1:25000))) 

plot(log(data1$size) ~ log(data1$duration),  xlab = "log Duration of video ", ylab = "log Size of the video") # log-log functional form
abline(fit2) # Draw a line through our second fitting model
# See that in this log-log form, the regression is much better since it gets through a lot more points

## Residuals in log-log functional form

res = residuals(fit2)
plot( res ~ data1$duration, xlab = "log(Duration)", ylab= "Residuals")
# We see that most residuals are between -2 and +3 while most log(Duration) points is between 0 and 3000
# Oh, and there is our lonely value right there with log(Duration) = ~25000


## Regression with time series data

# We are going to replace our x variable with 'utime' now.
# utime = total transcoding time for transcoding
# We are trying to impersonate utime with 'time' in this series of data, for the sake of simplicity.
# So, we can give as input a "future" 'utime' value and we will 'scenario-based' forecast the size of the video, 
# after we do the regression.
#
# Warning: It would be better to replace the 'utime' variable with a 'Year' variable. As said, we do not want to change
# the data only because of this example!

par(mfrow=c(1,2)) # Change parameters for plot

fit.ex3 <- lm(data1$size ~ data1$utime) # Linear Model Fit for size ~ utime
plot(data1$size ~ data1$utime, ylab="% change in consumption and income", type="single", col=1:2, xlab="utime") #plot

legend("topright", legend=c("Size","utime"), lty=1, col=c(1,2), cex=.9)

plot(data1$size ~ data1$utime, ylab="% change in size", xlab="% change in utime")

abline(fit.ex3)
summary(fit.ex3)$coef

# The scatter plot includes the estimated regression line \hat{C} = 21760322.7 + 325380.9i
#

