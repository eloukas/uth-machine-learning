## script lin_rls.R
##
#rm(list=ls()) # Uncomment if you want clean Global Environment
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

X = as.matrix(data[,1])
N<-length(X)
y = as.matrix(data[,2])
t<-numeric(2)
P<-500*diag(n+1)
mu<-0.9

for (i in 1:N){ # Package 'knitr' must be installed?!
  rls.step<-rls(c(1, X[i]),y[i],t,P,mu)
  t<-rls.step[[1]]
  P<-rls.step[[2]]
  
  plot(X[1:i],y[1:i],main=paste("Forgetting factor mu<-",mu)) # Push 'escape' to get out of the plot loop
  
  lines(X[1:i],cbind(array(1,c(i,1)), X[1:i])%*%t,col="red")
}