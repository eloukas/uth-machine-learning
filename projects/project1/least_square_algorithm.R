x = as.matrix(data[,1])
y = as.matrix(data[,2])

# Least square approx
phi = matrix(c(x^0,x^1), nrow=dim(data)[1], ncol=dim(data)[2])
w = ginv(phi)%*%y #coefficients

plot(x,y)

y_approx = phi%*%w # calc the expected output!
lines(x,y_approx,col="green")