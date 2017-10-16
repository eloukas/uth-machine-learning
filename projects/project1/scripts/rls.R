## script lin_rls.R
##
#rm(list=ls()) # Uncomment if you want clean Global Environment
library("knitr") # Package 'knitr' must be installed
n<-1;

# RLS function

# x = xT(n+1) (xT= x inverse)
# y = y(n+1)

# t = β (least squares estimator)
# mu = μ (forgetting factor)
# P.new = V(n+1)
# epsi = e = error
rls<-function(x,y,t,P,mu=1){
  
  P.new <-(P-(P%*%x%*%x%*%P)/as.numeric(1+x%*%P%*%x))/mu
  ga <- P.new%*%x
  epsi <- y-x%*%t
  t.new<-t+ga*as.numeric(epsi)
  list(t.new,P.new) #returns t.new & P.new
  
}

# 20% of dataset from exercise 2
X <- x_test_rls 
y <- y_test_rls

# solution from exercise 2
t <- w_rls

N<-length(X)
P<-solve(t(x_train_rls)%*%x_train_rls)[1]*diag(n+1) # inverse of A transpose * A, where A=training_set!
mu<-0.9


for (i in 1:N){ # Package 'knitr' must be installed?!
  rls.step<-rls(c(1, X[i]),y[i],t,P,mu)
  t<-rls.step[[1]]
  P<-rls.step[[2]]
}

# plot after RLS
plot(x_train_rls, y_train_rls,main=paste("Forgetting factor mu<-",mu),xlab="x",ylab="y")
points(X[1:i],y[1:i],col = "blue") # Push 'escape' to get out of the plot loop

# 80% data
phi = matrix(c(x_train_rls^0,x_train_rls^1), nrow = dimensions-N , ncol = 2) 
lines(x_train_rls,phi%*%w_rls,col="red")

# after RLS
lines(X[1:N],cbind(array(1,c(N,1)), X[1:N])%*%t,col="blue")

