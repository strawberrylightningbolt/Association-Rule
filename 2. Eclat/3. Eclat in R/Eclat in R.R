# Eclat

#Data Preprocessing
library(arules)
dataset <- read.csv('Market_Basket_Optimisation.csv', 
                    header = F)
dataset <- read.transactions('Market_Basket_Optimisation.csv',
                             sep = ',', 
                             rm.duplicates = T)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

#Training Eclat Model on Dataset
rules <- eclat(dataset, 
                 parameter = list(support = 0.003, minlen = 2))


#Visualizing The Results
inspect(sort(rules, by = 'support')[1:10])
