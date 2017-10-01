college = read.csv(file = "College.csv")
fix(college) # first column is just the name of each university, might be useful later
rownames(college) = college[,1] # take first col of each row and assign it to rownames(college)
fix(college)
college =  college[,-1] # eliminate first column
fix(college)
# Now, our sheet's first column is the name of each university, data not to be processed,
# and all other columns are data.
summary(college); #display numerical summary of variables in college
