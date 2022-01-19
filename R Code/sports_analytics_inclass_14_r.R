# 1) When X is 1, our Y increases by 2.1. When X is 2, our Y increases by 8.4.

# 2) 91% of our variability in y can be explained by a quadratic model 3.2 + 1.87x + 2.1x^2

# 3) 3.2 + 1.87(3.2) + 2.1((3.2)^2)
#    = 30.69

library(plyr)

batting = read.csv('batting.csv')
head(batting)

# aggregating data at a player level
batting_agg <- ddply(batting, .(playerID), summarise, tot_AB = sum(AB, na.rm = T), tot_HR = sum(HR, na.rm = T), tot_SO = sum(SO, na.RM = T))
head(batting_agg)

# subsetting data with at least 5000 at bats
batting_agg = subset(batting_agg, tot_AB >= 5000)

# creating HR and SO rates
batting_agg$HR_rate = batting_agg$tot_HR / batting_agg$tot_AB
batting_agg$SO_rate = batting_agg$tot_SO / batting_agg$tot_AB

# building quadratic model
quad_md = lm(SO_rate ~ HR_rate + I(HR_rate^2), data = batting_agg)

# extracting model results
summary(quad_md)

## We can determine our model is significant because our p value is equal to 0. Our slope is also more than 2*standard error, which tells us
## that is is significant
