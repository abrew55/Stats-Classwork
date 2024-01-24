#HW13

#This question goes over binomial glms and how to make a prediction with them.
#1)
lake = read.csv("C:/Users/david/Downloads/Lakeland.csv")
mod1 = glm(Return ~ GPA+Program, family = "binomial", data=lake)
summary(mod1)
predict(mod1, newdata=data.frame(GPA=2, Program=0), type="response")
exp(coef(mod1))

#This question goes over the potential impact of transforming your predictors.
#2)
x=c(22,24,26,30,35,40)
y=c(13,21,33,36,41,35)
df1=data.frame(x,y)
mod2 = lm(y~x,data=df1)
summary(mod2)
#Only x is significant at 0.1

mod3 = lm(y~x+I(x^2), data=df1)
summary(mod3)
#The transformation now leaves every predictor (including the intercept) significant at 0.05.