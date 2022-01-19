mlb = read.csv('Dataset_2_4.csv')
head(mlb)

# creating a scatterplot of hits and runs
plot(mlb$H, mlb$R, xlab = 'Hits', ylab = 'Runs', pch = 16, col = 'blue')

# computing correlation between hits and runs
cor(mlb$H, mlb$R)

# computing margin of error
r = 0.643
n = dim(mlb)[1]
ME = 2*sqrt((1-r^2) / n)
ME

## We can determine our correlation is significant because the absolute value of r is greater than the margin of error.