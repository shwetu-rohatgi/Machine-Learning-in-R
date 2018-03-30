#loading working directory

#loading the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[,3:5]

#Split dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#scaling the dataset
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set)[,1:2]

#Logistic regression Model building
classifier = glm(formula = Purchased ~.,
                 family = binomial,
                 data = training_set)

summary(classifier) 

#predictions for the test set
prob_pred = predict(classifier, type = 'response', newdata = test_set)
#prob_pred
y_pred = ifelse(prob_pred>.5, 1, 0)
#y_pred

#Confusion Matrix
cm = table(test_set[, 3], y_pred) #helps to make a matrix
cm #this gives the overview of no of correct and incorrect predictions made by our model.
#We made 57+26=83 correct predictions and 17 were incorrect predictions.

#visualizing the classification results. 
