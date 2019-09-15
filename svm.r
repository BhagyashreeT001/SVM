dataset = read.csv("C:/Users/LENOVO/Downloads/xyz/banknotes.csv") 
dataset = dataset[1:5]
str(dataset)
# Encoding the target feature as factor 
dataset$Class = factor(dataset$Class, levels = c(0, 1))
# Splitting the dataset into the Training set and Test set 
#install.packages('caTools') 
library(caTools) 
str(dataset)
set.seed(123) 
split = sample.split(dataset$Class, SplitRatio = 0.75) 
split
training_set = subset(dataset, split == TRUE) 
test_set = subset(dataset, split == FALSE) 

# Feature Scaling 
training_set[-5] = scale(training_set[-5]) 
test_set[-5] = scale(test_set[-5])
# Fitting SVM to the Training set 
#install.packages('e1071') 
library(e1071) 

classifier = svm(formula = Class ~ ., 
                 data = training_set, 
                 type = 'C-classification', 
                 kernel = 'sigmoid') 
# Predicting the Test set results 
y_pred = predict(classifier, newdata = test_set[-5]) 
# Making the Confusion Matrix 
cm = table(test_set[, 5], y_pred) 
cm
