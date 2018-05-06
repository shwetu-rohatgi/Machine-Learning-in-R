#hierarical clustering

dataset = read.csv("Mall_Customers.csv")
subset = dataset[4:5]

#Making Dendrograms to find the optimal number of cluster
dendrogram = hclust(dist(subset,method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distance')

#ploting vector of predictions for hierarical clustering 
hc = hclust(dist(subset,method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

#Visualizing the Hierarical cluster results
library(cluster)
clusplot(subset,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("CLusters of Clients"),
         xlab = "Annual Income",
         ylab = "Spending score")