fold = 8
n = dimensions[1]/fold # divide into groups

# random distribution of numbers
random_numbers = runif(dimensions[1],1,dimensions[1]) 
I = order(random_numbers)

# init MSE matrix
MSE = matrix(0, fold,1)
group_start = 1

# cross validation!
for (i in 1:fold){
  group_end = i*n
  test_set_indices = I[group_start:group_end]
  training_set_indices = setdiff(I,test_set_indices)
  
  test_set = data[test_set_indices,]
  training_set = data[training_set_indices,]
  
  x_test = test_set[,1]
  y_test = test_set[,2]
  
  x_train = training_set[,1]
  y_train = training_set[,2]
  
  phi_train = matrix(c(x_train^0,x_train^1), nrow = dimensions[1]-n , ncol = 2) # Do the regression
  w = ginv(phi_train)%*%y_train
  
  # Now we have learned the weights from the training data.
  # We need to determine how well these learned weights work for
  # the unseen test set points.
  
  phi_test = matrix(c(x_test^0,x_test^1), nrow = n , ncol = 2) 
  y_test_predicted = phi_test%*%w # Find the estimates of y_test
  
  MSE[i] =   sum((y_test-y_test_predicted)^2)/length(y_test)
  group_start = group_end + 1
}
barplot(MSE, beside = TRUE, names.arg = 1:dim(MSE)[1])