# 1) C

# 2) If the predictor variable X is found to be highly significant, then when can determine
#    that the variable "position" should be included in our multiple regression model.

# 3) D

library(QuantPsyc)

hitters <-  read.csv('Hitters.csv')

# dropping na values
hitters <- na.omit(hitters)
head(hitters)

# creating logSalary
hitters$logSalary <- log(hitters$Salary)

# creating League_0_1
hitters$League_0_1 <- ifelse(hitters$League == 'A', 1, 0)
head(hitters)

# building a linear regression model
result <- lm(logSalary ~ AtBat + Hits + HmRun + League_0_1, data = hitters)
summary(result) # Y = 5.159 - 0.002x1 + 0.014x2 + 0.018x3 - 0.157x4


## The most important variable in terms of estimated coefficient is League_0_1. The least 
## important variable in terms of estimated coefficient is AtBat. 

# calculating standardized regression coefficients
### This is calculated by doing bj*Sj / Sy
lm.beta(result)

## We can determine that the most important variable in terms of standardized regression
## coefficient is Hits. The least important variable in terms of standardized regression coefficient
## is League_0_1

# calculating variable importance based on r^2
### this is done by taking sum sq and dividing by total sum of squares, or 100*bj*Sj*ryj / Sy
r2anova <- anova(result)
100*(r2anova$`Sum Sq` / sum(r2anova$`Sum Sq`))

## We can determine that the most important variable in terms of contribution to R^2 is AtBat.
## The least important variable in terms of contribution to R^2 is League_0_1.









