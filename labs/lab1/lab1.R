# Lab1 Intro to R

# read .csv
college = read.csv("College.csv")

# get college names
rownames(college) = college[,1]
fix(college)

# eliminate the first column
college = college[,-1]
fix(college)

# produce a numerical summary of the variables in the data set
summary(college)

# A scatterplot matrix of the first ten columns or variables of the data
# A scatterplot graph gives correlation between data!
pairs(college[,1:10])

# side-by-side boxplots of Outstate versus Private
boxplot(college$Outstate~college$Private)

# create a qualitative variable!
Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college,Elite)

# how many elite univer-sities there are.
summary(college$Elite)
boxplot(college$Outstate~college$Elite)

# some histograms
par(mfrow = c(2,2))
hist(college$Room.Board)
hist(college$Books)
hist(college$Personal)
hist(college$Outstate)
