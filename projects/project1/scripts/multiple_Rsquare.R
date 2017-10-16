y_mean = mean(y)
x_mean = mean(x)

SStot = sum((y-y_mean)**2)
SSres = sum((y-y_approx)**2)
r = 1 - (SSres/SStot)
print(r)