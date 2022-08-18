#Provides the infrastructure for representing, manipulating and analyzing transaction data and patterns (frequent itemsets and association rules)
library(arules)

#Extends package 'arules' with various visualization techniques for association rules and itemsets
library(arulesViz)

#set the bottom, left, top and right margins
par(mar=c(2,2,2,2))

#Reads a transaction data file from disk
Groceries=read.transactions("groceries.csv",format="basket",sep=",")

#plot the dataset
itemFrequencyPlot(Groceries,topN=20,type="absolute")

#to mine frequent itemsets, association rules or association hyperedges using the Apriori algorithm. The Apriori algorithm employs level-wise search for frequent itemsets. 
#to mine rules with minimum support of 0.1, minimum confidence of 0.8, maximum of 10 items (maxlen), and a maximal time for subset checking of 5 seconds (maxtime)
rules = apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

#up to  significant digits
options(digits=2)

#display associations and transactions plus additional information formatted for online inspection
inspect(rules[1:20])

#sort the rules by highest confidence
rules=sort(rules, by="confidence",decreasing=TRUE)

#display the rules
inspect(rules[1:20])

#plot the rules
plot(rules[1:20],method="graph",interactive=TRUE, shading ="confidence" )




