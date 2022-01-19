# reading csv file
goalie_stats = read.csv('game_goalie_stats.csv')
head(goalie_stats)

# reporting number of games of each goalie
library(tidyverse)

saves <- goalie_stats %>% count(player_id)

# creating a histogram of the goalies number of games
ggplot(saves, aes(x = player_id)) +
  geom_histogram(color = 'white', fill = 'black') 

