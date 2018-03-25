#reading the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#regressor model for decision tree
install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~.,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

summary(regressor)

#prediction for 6.5 level
y_pred = predict(regressor,data.frame(Level = 6.5))

#visualization of data for higher resolution / smooth curves in graph using x_grid. 
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  ggtitle('Truth or Bluff (Decision Tree)')+
  xlab('Levels')+
  ylab('Salary')