Problem 1 - Sheet 1

a) We see that the higher the `SQFT`, the higher the price gets. 
Seems that there is a linear relationship.
About problems: There are some rooms that have a high price that we don't expect(based on their `SQFT`).
Let's hope that there are not so many datapoints like this.

b) After running the regression, we can see that it is mathematically equal to:
$ y_i $ = 64.956 + 0.606$X_i$
This is a linear equation.
The first coefficient is the intercept while the second is the slope.

We could obtain the equation by performing the maths by hand as seen in http://science.clemson.edu/physics/labs/tutorials/excel/regression.html

c) The y-intercept is the place where the regression line y = mx + b crosses the y-axis (where x = 0), and is denoted by b. 
Sometimes the y-intercept can be interpreted in a meaningful way, and sometimes not.
 This uncertainty differs from slope, which is always interpretable. 
 
 The slope is interpreted in algebra as rise over run.
 It’s a ratio of change in Y per change in X. 
 Generally, they positive slope makes sense.
 But one thing that is funny, it's that the model predicts you were going to pay 64.95 hundrends for 0 SQFT.
 
 
 d) The p-value for each term tests the null hypothesis that the coefficient is equal to zero (no effect). A low p-value (< 0.05) indicates that you can reject the null hypothesis. In other words, a predictor that has a low p-value is likely to be a meaningful addition to your model because changes in the predictor's value are related to changes in the response variable.

Conversely, a larger (insignificant) p-value suggests that changes in the predictor are not associated with changes in the response.
Our p-value for SQFT is smaller than that so it's a good attribute for us to use when regressing.

With the `critical value` method:
From the output t-statistic = 15.86
We would find the critical value.
If `t` > `critical value`, then we reject null hypothesis at level .5.

e) For a `2000 SQFT` house:
we would take our regression model:
$ y_i $ = 64.956 + 0.606$X_i$

Put 2000 where $X_i$ and this should equao to $ y_i = 1276.956 $
That's the predicted price of a house of 2000 SQFT.

f) Multiple R. 
This is the correlation coefficient. 
It tells you how strong the linear relationship is. 
For example, a value of 1 means a perfect positive relationship 
and a value of zero means no relationship at all. 
In our example, it is 0.84 which means that the linear model is strong.
(Also, it is the square root of r squared)

One way to find multiple R is to use Excel's `RSQ` function to compute R^2.
Then you could get its square and here it is, you get Multiple R!

(Second way to get Excel's "Multiple R"):
we could compute the ratio of SS Regression divided by SS Total, and then take the
square root.

SS Regression and SS Total are shown in the ANOVA section of the Regression
tool output.

g) Coefficient of Determination
it is the percentage of the response variable variation that is explained by a linear model
R-squared = Explained variation / Total variation
R-squared is always between 0 and 100%:

0% indicates that the model explains none of the variability of the response data around its mean.
100% indicates that the model explains all the variability of the response data around its mean.

In our example, it's 0.707 which means that the model fits our data pretty well.

