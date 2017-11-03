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

#predicting future test results
y_pred = predict(regressor,newdata = test_set)

#graphical visualization of training test
#install.packages(ggplot2)
library(ggplot2)

ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour = 'red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)),
            colour = 'blue')+
  ggtitle('Salary vs Years of Experience(Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')

#graphical visualization of test set
#install.packages(ggplot2)
library(ggplot2)

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour = 'red')+
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)),
            colour = 'blue')+
  ggtitle('Salary vs Years of Experience(Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')