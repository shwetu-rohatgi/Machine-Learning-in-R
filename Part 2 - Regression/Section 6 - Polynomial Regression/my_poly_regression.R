#Polynomial Linear regression
#setting up directory
setwd('C:/Users/Shwetanshu Rohatgi/Desktop/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 6 - Polynomial Regression')

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3] #we are interested in COlumn 2,3 and in R index start from 0 and include last index.

# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 4/5)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)
# 
# #Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Linear regression on daat to compare with polynomial
lin_regressor = lm(formula = Salary ~. ,
                   data = dataset)
summary(lin_regressor)

#polinomial regression on dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_regressor = lm(formula = Salary ~.,
                    data = dataset)
summary(poly_regressor)

#visualizing our Linear regressor
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
                colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(lin_regressor,newdata = dataset)),
            colour = 'blue')+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Linear Regression Model')

#visualizing our Poly regressor
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_regressor,newdata = dataset)),
            colour = 'blue')+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Polynomial Regression Model')

#Predicting salaries using Linear Reg model
y_pred = predict(lin_regressor, newdata = data.frame(Level = 6.5))

#Predicting salaries using Linear Reg model
y_pred = predict(poly_regressor, newdata = data.frame(Level = 6.5,
                                                      Level2 = 6.5^2,
                                                      Level3 = 6.5^3,
                                                      Level4 = 6.5^4))

#visualizing our Poly regressor (in higher resolutions)
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1) #add this for all levels in case of polynomial reg.
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x_grid,y=predict(poly_regressor,newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  xlab('Levels')+
  ylab('Salary')+
  ggtitle('Polynomial Regression Model')