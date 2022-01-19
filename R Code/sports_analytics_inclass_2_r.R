goalie_stats = read.csv('game_goalie_stats.csv') # reading csv file

head(goalie_stats, 4) # printing first 4 observations
tail(goalie_stats, 4) # printing last 4 observations

length(unique(goalie_stats$team_id)) # counting number of unique team ids

highsaves <- subset(goalie_stats, savePercentage > 95 & decision == 'W')
dim(highsaves)
