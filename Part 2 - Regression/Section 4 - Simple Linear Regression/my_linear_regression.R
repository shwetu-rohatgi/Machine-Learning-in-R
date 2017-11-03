#Set working directory 
setwd('C:/Users/Shwetanshu Rohatgi/Desktop/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression')
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[,2:3]

#splitting training and testing datasets.
library(caTools)
set.seed(123)
split = sample.split(dataset$YearsExperience, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling 
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#fitting over model for simple linear regression.
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)