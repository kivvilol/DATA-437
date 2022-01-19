library(tidyverse)

teams <- read.csv('Teams.csv')
head(teams)

# subsetting data frame
my_teams <- teams %>% select(yearID, teamID, W, L, G, R, RA) %>% filter(yearID >= 1801) %>% filter(yearID <= 1900)
head(my_teams)

# computing k and estimating win percentage
my_teams$log_W_L = log(my_teams$W / my_teams$L)
my_teams$log_R_RA = log(my_teams$R / my_teams$RA)

lm_pyt <- lm(log_W_L ~ 0 + log_R_RA, data = my_teams)

# calculating Pythagorean expected wins and residuals
my_teams <- my_teams %>% mutate(Wpct = R^1.83 / (R^1.83 + RA^1.83), expected_wins = round(Wpct*(W + L)), diff = W - expected_wins)
head(my_teams)

# determining coefficients of best fit
result <- lm(my_teams$W ~ my_teams$expected_wins, data = my_teams)
summary(result)

max(my_teams$diff) # the maximum difference between wins and expected wins is 10
min(my_teams$diff) # the minimum difference between wins and expected wins is 11
