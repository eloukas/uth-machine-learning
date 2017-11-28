-0- Preparation:
We changed the `HealthStatus` Column:

Poor is equal to 1

Fair to 2

Good to 3

Excellent to 4


-1-
Then, Data->Data Analysis->Regression:

Input Y must be OOPExp

Input X must be Age, TotInc, Health-Status

If you include row no1, you should tick 'include labels'

Tick 'residuals'

Run Regression and get:
$ OOPExp=𝛽\beta_0 + \beta_1×TotInc + \beta𝛽_2×Age + \beta 𝛽_3×HealthStatus + \epsilon $𝜖

where   \beta_0 = Intercept = 271.0841
		\beta_1 =0.6111
		\beta_2 = 0.031311
		\beta_3 = -94.35388 

as seen in the outputs of the Regression execution.


