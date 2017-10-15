## script lin_rls.R
##
# rm(list=ls()) # Uncomment if you want clean Global Environment
library("knitr") # Package 'knitr' must be installed
par(ask=TRUE)
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


X<-seq(-pi,pi,by=.02)
N<-length(X)

y<-sin(X)+0.1*rnorm(N)

t<-numeric(2)
P<-500*diag(n+1)
mu<-0.9

# kaslou code now
# run for 80% (variables are copies of exercise2 80%-20%)
X=x_train_rls
y=y_train_rls
N<-length(X)

# then run in loop for (20%)
# X=x_test_rls
# y=y_test_rls

#endof kaslou code


for (i in 1:N){ # Package 'knitr' must be installed?!
  rls.step<-rls(c(1, X[i]),y[i],t,P,mu)
  t<-rls.step[[1]]
  P<-rls.step[[2]]
  
  #wtf is wrong with that shit?
  plot(X[1:i],y[1:i],xlim=c(-4,4),ylim=c(-2,2),main=paste("Forgetting factor mu<-",mu)) # Push 'escape' to get out of the plot loop
  #wtf
  
  lines(X[1:i],cbind(array(1,c(i,1)), X[1:i])%*%t,col="red")
}