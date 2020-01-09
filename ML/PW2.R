# *** Step 1 : Split the dataset *** 
# Load the dataset, when we load an .RData using load()
# function we do not attribute it to a name like we did
# when we used read.table() or when we use read.csv()

load("/Users/mahamatismailhour/Downloads/EU.RData")

# First, install the MASS package using the command: install.packages("MASS")

# load MASS package
library(MASS)

# Check the dimensions of the Boston dataset
dim(Boston)
#ans> [1] 506  14


# *** Step 2 : Split the dataset *** 

# Split the data by using the first 400 observations as the training
# data and the remaining as the testing data
train = 1:400
test = -train

# Speficy that we are going to use only two variables (lstat and medv)
training_data = Boston[train,]
testing_data = Boston[test,]

# Check the dimensions of the new dataset
dim(training_data)
#ans> [1] 400  14

# *** Step 3 : Check for Linearity ***

cor(training_data$medv, training_data$age)

# *** Step 4 :Fit a model of housing prices in function of age and plot the observations and the regression line ***

model4 = lm(medv ~ age, data = training_data)
model4

# Scatterplot of age vs. medv
plot(training_data$age, training_data$medv)

# *** Step 5 : What is the obtained model using both lstat and age as predictors of median house value?  ***

model5 = lm(medv ~ age + log(lstat), data = training_data)
model5

# Scatterplot of lstat + age vs. medv
plot(training_data$ age, training_data$medv)

# *** Step 6 : Print the summary of the obtained regression model ***

# model for Step 4
summary(model4)

# model for Step 5
summary(model5)

# *** Step 7 : Are the predictors significant ? ***

# p-value of the 2 predictors < 2.2e-16 
# p-value indicate that x1 and x2 are related to y 

# *** Step 8 : Is the model as a whole significant? Answer on this question must be detailed ***

# *** For model 4 ***

# R2 = 0.077 is a good value / F-statistic: 33.8 >> 0 on 1 and 398 DF
# p-value : < 1.53e-08 << for alpha = 0.001 / 0.01 / 0.05

# ==> Then we can conclude that this model as a whole is significant

# *** For model 5 ***

# R2 = 0.6684 is a good value / F-statistic: 400.1 >> 0 on 2 and 397 DF
# p-value : < 2.2e-16 << for alpha = 0.001 / 0.01 / 0.05

# ==> We can conclude that this model as a whole is significant

# *** Step 9 : Train a new model using all the variables of the dataset. (We can use . as a short cut instead of writing down all the variables names) ***

model9 =  lm(medv ~ ., data = training_data)
model9

summary(model9)


# ***  Step 10 : When using all the variables as predictors, we didn???t transform lstat. Re train the model using log(lstat) instead of lstat. ***

model10 =  lm(medv ~ .-lstat + log(lstat), data = training_data)
model10

summary(model10)

# ***  Step 11 : Did  R2 improve ? ***

# yes because R2(model10) > R2(model9)  , 0.785 > 0.7339

# *** Step 12 : To see if there is correlated variables print the correlation matrix using the cor() function (round the correlations with 2 digits)

cor(training_data$age, training_data$medv)

# *** Step 13 :   *** 
install.packages("corrplot")
library(corrplot)
corrplot.mixed(cor(training_data, training_data))

# *** Step 14 :    *** 
#the correlation between tax and rad is 0.87

# *** Step 15 :     *** 
model15 = lm(medv ~ . - lstat + log(lstat) - tax  , data = training_data)
model15

summary(model15)

# *** Step 16 :Calculate the mean squared error (MSE) for the last model *** 

#  Testing median values for houses in y
y = testing_data$medv

# Predicted value for y_hat
y_hat = predict(model5,data.frame(testing_data))

# Find the mean square error
error = y-y_hat
error_squared = error^2
MSE = mean(error_squared)
MSE

# *** Anova  *** 

# *** Step 17 : How many of the suburbs in this data set bound the Charles river ?  *** 

str(Boston)



sum(Boston$chas)

# *** Step 18 : Do we observe some difference between the median value of houses with respect to the neighborhood to Charles River? *** 














