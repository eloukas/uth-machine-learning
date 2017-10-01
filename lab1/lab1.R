college = read.csv(file = "College.csv")
fix(college) # First column is just the name of each university, might be useful later

rownames(college) = college[,1] # Take first col of each row and assign it to rownames(college)
fix(college)

college =  college[,-1] # Eliminate first column
fix(college)
# Now, our sheet's first column is the name of each university, data not to be processed,
# and all other columns are data.

summary(college); # Display numerical summary of variables in college
pairs(college[,1:10]) # Scatter plot
plot(college$Outstate,college$Private) # To refer to a variable, we must type 'dataSet$variableName'

Elite = rep("No", times = nrow(college)) # Init every uni to a 'no' (it is not elite)
Elite[college$Top10perc > 50] = "Yes" # If top 10% from high school classes > 50 % college, then it's an elite uni.
Elite = as.factor(Elite)
college = data.frame(college, Elite) # A data frame is a tighly coupled collection of variables which share same properties

summary(Elite) # See how many elite universities there are
plot(x = college$Outstate, y = Elite)

# Produce histograms of quantitative variables
op = par(mfrow = c(2,2)) # Divide print window into 4 regions
hist(college$Outstate)
hist(college$Top10perc)
hist(college$Apps)
hist(college$Top25perc)



