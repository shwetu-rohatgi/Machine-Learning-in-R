#Set working directory 
setwd('C:/Users/Shwetanshu Rohatgi/Desktop/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing')
dataset = read.csv('Data.csv')
#dataset = dataset[,2:3]

#splitting training and testing datasets.
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling 
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])
