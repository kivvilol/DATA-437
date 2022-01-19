# reading csv file
goalie_stats <-  read.csv(file = 'game_goalie_stats.csv')
head(goalie_stats)

# loading tidyverse
library(plyr)

# computing number of games per goalie
goalie_games = ddply(goalie_stats, .(player_id), summarise, numb_games = length(unique(game_id)))
head(goalie_games)

# reporting IQR of number of games of each goalie
summary(goalie_games$numb_games)
IQR = 144 - 5
IQR
