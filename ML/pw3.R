

#1) Import Dataset
dataset <- read.csv("Social_Network_Ads.csv", header=TRUE)
#2) info
summary(dataset)
str(dataset)
plot(dataset)
names(dataset)

#3) Split set
library(caTools) # install it first in the console
set.seed(123)
# we use the function set.seed() with the same seed number
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
# here we chose the SplitRatio to 75% of the dataset,
# and 25% for the test set.
training_set = subset(dataset, split == TRUE)
# we use subset to split the dataset
test_set = subset(dataset, split == FALSE)

#4) Scaling
help(scale)
training_set[c(3,4)] = scale(training_set[c(3,4)])
test_set[c(3,4)] = scale(test_set[c(3,4)])

#model1
model1=glm(Purchased~Age, family="binomial", data= training_set)
model1
summary(model1)
#We use Binomial because we want as an output 0 or 1

#7)Write the model
#coef1=exp(coef(model1))---> ODDS RATIO
#Purchased= e^(-0.9299+ 1.9913*Age) / (1 + e^(-0.9299+ 1.9913*Age)

#8) Yes Age is significant because it has a p-value <0.05  (2e-16)

#9) AIC=256.11 last line of the summary
AIC(model1, k=2)

#10)plotting
plot(Purchased~Age, data= training_set)
curve(predict(model1, data.frame(Age=x), type= "response"), add=TRUE)

#11) New model with both age and salary
model2= glm(Purchased~Age + EstimatedSalary, family = "binomial", data= training_set)
model2
summary(model2)

#12) p-value is much lower than 0.05 then the coefficients are significant

#13) AIC= 205.78 it is lower than the former model, this model is better than the previous one


#14) Prediction
prediction=predict(model2, data.frame(Age= test_set$Age, EstimatedSalary= test_set$EstimatedSalary), type="response")


#15)
probability = ifelse(prediction> 0.5, 1,0)
print(probability)


#16)
cm=table(test_set[5])
cm

#17)
accuracy= prediction[1]- test_set[]
accuracy

#18)
library(ROCR)
score <- prediction(prediction,test_set[,5])
performance(score,"auc")



plot(performance(score,"tpr","fpr"),col="red")
abline(0,1,lty=8)