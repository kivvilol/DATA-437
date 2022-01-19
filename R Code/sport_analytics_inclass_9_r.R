# reading csv files
durant <- read.csv('Durant_2011_2012.csv')
james <- read.csv('James_2011_2012.csv')

# reporting average number of assists for each player
mean(durant$AST) # 3.5
mean(james$AST) # 6.24

## James has a higher number of assists


# reporting margin of error estimation
2*sd(durant$AST) / sqrt(dim(durant)[1])
2*sd(james$AST) / sqrt(dim(james)[1])

## The margin of error is higher for James.