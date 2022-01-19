# 1a) For two teams in the same league, for one unit of increase in payroll (one million), on average, wins increases by 0.101. 

#  b) For the American league, the intercept of our regression equation would be 71.81 (71.87 - 0.060). 

#  c) The predicted number of wins for a National league team with a payroll of $98 million is 81.77.

nba = read.csv('NBA_2006_2007.csv')
head(nba)

result <- lm(W ~ EFG_pct + TOV_pct + OREB_pct + FTA_rate, data = nba)
summary(result) ## Model is -129.85 + 4.03x1 - 6.32x2 + 2.43x3 - 4.05x4

# To estimate wins, we can just plug in our numbers
newdata <- data.frame('EFG_pct' = 51, 'TOV_pct' = 16, 'OREB_pct' = 32, 'FTA_rate' = .35)

predict(result, newdata, type = 'response')
# Our number of predicted wins is 51.15

## We can determine that all of our coefficients are significant, except for our FTA_rate. 