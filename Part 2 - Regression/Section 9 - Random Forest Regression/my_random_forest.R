# Random forest regression

#reading dataset
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

#creating random forest regressor
install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],  #this is how you create a dataframe or matrix of predictions
                         y = dataset$Salary,
                         ntree = 100) #This is a way to make vector of predictions

#making predictions for level 6.5
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizations for smooth or non continous graphs
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.001)
ggplot()+
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue')+
  ggtitle('Truth or Bluff (Random Forest Tree)')+
  xlab('Levels')+
  ylab('Salary')