#Multiple Linear regression
#setting up directory
setwd('C:/Users/Shwetanshu Rohatgi/Desktop/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 5 - Multiple Linear Regression')

#reading CSV file
dataset = read.csv('50_Startups.csv')

#handling categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

#splitting dataset into training and testing sets
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 4/5) #dependent variable is first argument
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)