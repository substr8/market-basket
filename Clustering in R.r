#Provides the infrastructure for representing, manipulating and analyzing transaction data and patterns (frequent itemsets and association rules)
library(arules)

#Extends package 'arules' with various visualization techniques for association rules and itemsets
library(arulesViz)

#set the bottom, left, top and right margins
par(mar=c(2,2,2,2))


cars=read.csv("cars.csv")
rownames(cars) = cars[,1]
cars = cars[,c(2:12)]

#group in clusters with similar attribute or characteristics
fit = kmeans(cars, 5)
fit

#Splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
#by - a list of grouping elements, each as long as the variables in the data frame x. The elements are coerced to factors before use.
#FUN - a function to compute the summary statistics which can be applied to all data subsets.
aggregate(cars,by=list(fit$cluster),FUN=mean)

#The function data.frame() creates data frames, tightly coupled collections of variables which share many of the properties of matrices and of lists, used as the fundamental data structure by most of R's modeling software.
carswithclusters = data.frame(cars,  fit$cluster)

#display the cluster of each car
carswithclusters

library(cluster)

#display the clusters
clusplot(cars, fit$cluster, color=TRUE,  shade=TRUE, labels=2, lines=0)
cars=read.csv("cars.csv")
rownames(cars) = cars[,1]
cars = cars[,c(2:12)]

#dist function computes and returns the distance matrix computed by using the specified distance measure to compute the distances between the rows of a data matrix.
#the distance measure to be used. This must be one of "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski". Any unambiguous substring can be given.
d = dist(cars, method = "euclidean")
fit = hclust(d, method="ward.D")
plot(fit, main="hierarchical clustering  for mtcars dataset")

#Cuts a tree, e.g., as resulting from hclust, into several groups either by specifying the desired number(s) of groups or the cut height(s)
groups = cutree(fit, k=5)

#Draws rectangles around the branches of a dendrogram highlighting the corresponding clusters.
rect.hclust(fit, k=5, border="red")


