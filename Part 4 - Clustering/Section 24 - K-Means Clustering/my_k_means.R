#loading dataset
dataset = read.csv("Mall_Customers.csv")
x = dataset[4:5]

#using the elbow method to find optimum results of clusters
set.seed(6)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(x,i)$withinss)
plot(1:10, wcss, type = "b", main = "Cluster using kMeans", xlab = "No of Clusters", ylab = "wcss")

#fitting k-means to the dataset
set.seed(29)
kmeans <- kmeans(x,centers = 5, iter.max = 300, nstart = 10)

#visualizing the clusters
library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("CLusters of Clients"),
         xlab = "Annual Income",
         ylab = "Spending score")