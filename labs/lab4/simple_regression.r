#install.packages("fpp") # Install Forecasting: principles and practice examples and exercises
#library("fpp")            # Not sure if needed

install.packages("fpp", repos = "http://cran.us.r-project.org", dependencies = TRUE)
library(fpp)

data = read.table("transcoding_measurement.tsv",header=TRUE)
plot(data$size ~ data$duration,  xlab = "Duration of video", ylab = "Size of the video")
fit = lm(data$size ~ data$duration ) ; abline(fit) #Add straight lines through the current plot
summary(fit) 
# We verify by the plot that the duration of a video does affect the size of it.
# Typically, we can see the the duration and the size of a video are connected with a linear relationship.
# The Multiple R-squared error is 0.1738, meaning that the x-y variables are a bit connected. 
# We can see that the line intersects for sure many observations,
# although the data-set is too big and we can not see distinct it so much.
# They(x-y) could be less connected(we tested previously another set with an R-squared error of 0.004!)

# Also, the estimated regression line is : \hat y = 2513851.4 + 78589.4x


## Residual plots

res = residuals(fit) # Calculate residuals from the modeling function 'lm'
plot(res ~ data$duration, ylab = "Residuals", xlab = "Duration of video", ylim = c(-5.0e+08,5.0e+08)); abline(0,0)
# Seeing the plot, we can understand that most of the residuals are between the 
# -5.0e+08 and the +5.03e+08 values(0e+00 and 1e+08 value specifically,if we add the ylim parameter in the plot), 
# with most of the observations having values 0 and 3000 about the duration of the video.
# So, yes, there is a pattern since the values are not so scattered around.

## Forecasting with regression
#install.packages("forecast", dependencies=TRUE)
#library(package = "forecast")
fcast = forecast(fit, newdata=(data$duration=204.9380))
plot(fcast, xlab="Duration of video", ylab=" Size of the video" )