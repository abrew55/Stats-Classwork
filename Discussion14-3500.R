#Discussion 14

#This question goes through model selection using the anova function
#1)
hos = read.csv("C:/Users/david/Downloads/hospital.csv")
hos = hos[,-1]   #Removing an unnecessary row 
mod1 = lm(InfctRsk ~., data=hos)
summary(mod1)

mod2 = lm(InfctRsk ~ Stay+Culture+Xray+Facilities, data=hos)
summary(mod2)

mod3 = lm(InfctRsk ~ Stay+Culture+Xray, data=hos)
summary(mod3)

anova(mod2, mod1)
anova(mod3, mod2)

#This question performs model selection using stepwise procedures in the olsrr package.
#2)
install.packages("olsrr")
library(olsrr)

ols_step_forward_p(mod1, pent=.05, details=TRUE)
ols_step_forward_p(mod1, prem=.05, details=TRUE)
#Medschool is the only difference between the two models and it is included in the second procedure
#Pent means values with a p-val below its limit are entered, and prem means a p-val greater than the limit will be removed. 
#The interactions in the two processes allowed for the two final models to differ.
ols_step_best_subset(mod1, details=TRUE)
#Best subset finds the best combination of predictors at each potential number of them.