#set working directory
setwd("C:/Users/Shwetanshu Rohatgi/Desktop/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)")

#reading the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#svm regressor for our model
install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~.,
                data = dataset,
                type = 'eps-regression')

summary(regressor)

#predictions for the level of 6.5 
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing our results with ggplot2 library
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue')+
  ggtitle('SVM Regressor to tell Truth or Bluff')+
  xlab('Levels')+
  ylab('Salary')