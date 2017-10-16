random_numbers = as.matrix(rnorm(dimensions[1])) # Get 168(nunber of rows) random numbers
I = order(random_numbers) # use it for taking a random test set

test_set_indices = I[1:floor(dimensions[1]*0.2)] # Put dimensions[1] to remove the warning
training_set_indices = setdiff(I,test_set_indices)

numberOfTestPoints = floor(dimensions[1]*0.2)
numberOfTrainingPoints = dimensions[1] - numberOfTestPoints

test_set = data[test_set_indices,] # Take the training & test data
training_set=data[training_set_indices,]

x_test = test_set[,1]
y_test = test_set[,2]

x_train = training_set[,1]
y_train = training_set[,2]

# variables for exercise 4
x_train_rls = x_train
y_train_rls = y_train
x_test_rls = x_test 
y_test_rls = y_test

phi_train = matrix(c(x_train^0,x_train^1), nrow = numberOfTrainingPoints , ncol = 2) # Do the regression
w = ginv(phi_train)%*%y_train
w_rls = w # for exercise 4

# Now we have learned the weights from the training data.
# We need to determine how well these learned weights work for
# the unseen test set points.

phi_test = matrix(c(x_test^0,x_test^1), nrow = numberOfTestPoints , ncol = 2) 
y_test_predicted = phi_test%*%w # Find the estimates of y_test

#plot(x_test,y_test)
#par(new=TRUE) # hold on;
#lines(x_test,y_test_predicted,col="green")
#par(new=FALSE) # hold off;

MSE_from_test = sum((y_test-y_test_predicted)^2)/length(y_test)

MSE_from_train = sum((y_train - phi_train%*%w)^2)/length(y_train)

print(MSE_from_test)
print(MSE_from_train)