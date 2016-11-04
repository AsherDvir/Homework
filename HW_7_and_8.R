setwd("C:/Users/Asher/OneDrive/Roma Paper/Data/World Bank Long 2013")
# input Stata file
library(readstata13)
dat <- read.dta13("Data_For_R.dta")


#_______________________________________________________________________
#Load your csv file - I have convereted my data from stata into R, because when using a CSV the data always converts improperly
# 1) Choose several columns which you would like to use in a linear model. This could be multivariate or several univariate models.
# I am going to create a model to predict the earned income of those not employed, if they were employed (i.e. an expected earnings equation)
# To understand how good this model is at predicting the expected earnings of those not working (an unknown),
# I will see how well the model works in predicting the earnings of those who are employed (something I do know)

fit <- lm(Mean_Net_Wages ~ Roma + child_under_6 + child_under_6_int + child_6_to_17 + child_6_to_17_int + highest_education + highest_education_int + age_factor + age_factor_int, data=dat)
summary(fit) # show results
                #This works, but, however, this regression needs to weighted!!!!!
# 2) Split your dataset into a 'training' and 'testing' dataset. That is, you will fit your models only on the training set and try to predict the other. This is usually 90:10 testing:training.
# Create groups
training.sub <- subset(dat, dat$Mean_Net_Wages>0 & dat$hours_worked_last_week>0)
# 3) Estimate your linear model over only the training dataset.
fit2 <- lm(Mean_Net_Wages ~ Roma + child_under_6 + child_under_6_int + child_6_to_17 + child_6_to_17_int + highest_education + highest_education_int + age_factor + age_factor_int, data=training.sub)
summary(fit2) # show results
# 4) Using the results from your estimation, try to predict the outcomes in the testing dataset.
testing.sub <- subset(dat, dat$Mean_Net_Wages<1 & dat$hours_worked_last_week<1)
predict(fit2, testing.sub)
# 5) Calculate the mean squared error of your estimate. Plot the residuals. Do any other error analysis you might see as interesting.


