-0- In order for the X Input range to be contiguous, we changed the dataset:
The Gender male column went last.
Now, Net Income and Age are contiguous.

Also, we deleted the rows that had empty values under the 'Age' column.
We could replace them with the mean of the column if we wanted the other datapoints of the row not to be trashed.

a) Regression can be found in `I50 cell`

b) ` Regression equation`: $\hat y = 182.2718 + 0.100*Net_income + 12.56*age ; $
Seems that tha `age` attribute contributes more to the Salary than the `Net Income` attrb
The intercept is where the regression line meets the y-axis and it's 'ok' if you think
that we talk in thousands.

c) The R-squared is 0.45 which is just below average.
This means that the model does not fit the data so good.

d) Statistics course! Wait one year!

e) There are many tests for normality of the residuals.
We can quickly check the normality by looking the p-values of the attributes.
The net income p-value is pretty much close to zero so it's good to keep it.
The `age p-value` is 0.11 which is considered a big p-value (>0.5) so we could throw it away.

f) Statistics course! Wait one year!
If you want, you can check this tutorial: https://help.xlstat.com/customer/en/portal/articles/2062433-breusch-pagan-white-heteroscedasticity-tests-in-excel

g) Statistics course!

h)Yes, there are some outliers like the `SLB` and `T` rows.
Having outliers often has a significant effect on your mean and standard deviation.
This can be verified easily on a small dataset.