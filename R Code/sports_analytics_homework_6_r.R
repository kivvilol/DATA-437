library(plyr)

# importing data
pitching <- read.csv('Pitching.csv')
head(pitching)

# aggregating data at the player level 
career_pitching <- ddply(pitching, .(playerID), summarise, tot_SO = sum(SO, na.rm = T), tot_W = sum(W, na.rm = T), tot_IPouts = sum(IPouts, na.RM = T), mid_year_career = median(yearID, na.RM = T))

# merging data frames
new_pitching <- merge(pitching, career_pitching, by = 'playerID')

# subsetting data with at least 10,000 career IPouts
new_pitching <- subset(new_pitching, tot_IPouts >= 10000)

# computing ratio of total strikeouts and total walks
new_pitching$SO_W_rate = new_pitching$tot_SO / new_pitching$tot_W
head(new_pitching)

# creating scatterplot between mid_year_career and SO_W_rate
plot(new_pitching$mid_year_career, new_pitching$SO_W_rate)
## We appear to positive relationship with an upwards curve, where our SO_W_rate increases slightly as the mid year career increases

# building quadratic model
quad_md = lm(SO_W_rate ~ mid_year_career + I(mid_year_career^2) + I(mid_year_career^3) + I(mid_year_career^4), data = new_pitching)

# extracting model results
summary(quad_md) ## all of our terms are significant with p values = 0

# creating newdata
newdata <- data.frame('mid_year_career' = 2000)

# predicting on newdata
predict(quad_md, newdata, type = 'response')

## Our ratio of total strikeouts and total walks is estimated to be 11.29 for a player with a mid-year career equal in 2000. 
