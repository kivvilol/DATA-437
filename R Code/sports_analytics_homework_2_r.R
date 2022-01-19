# 1) You would use mean instead of median as a measure of central tendency when the data is not 
#    skewed and has minimal outliers. On the flip side, we would want to use the median if the data is skewed 
#    with many outliers. An example of when to use median instead of mean is for company
#    average salary, because the top end of the data is going to be very skewed. 

# 2) values_sorted = 25, 50, 75, 76, 80, 88, 98
#    RANGE = 98 - 25 = 73 
#    IQR = 88 - 50 = 38

# 3) Manchester City = -((26/35)*ln(26/35) + (9/35)*ln(9/35)) = 0.570
#    0.570 / ln(2) = 0.822

#    Liverpool = -((32/35)*ln(32/35) + (3/35)*ln(3/35)) = 0.293
#    0.293 / ln(2) = 0.423

#    Because the standardized entropy for Manchester City is higher than Liverpool, we can determine that
#    there is more variability in Manchester City's game outcome.


## CODING PROBLEMS

# creating 2 vectors
byrd <- c(0.283, 0.293, 0.276, 0.210, 0.291, 0.264, 0.247)
fuld <- c(0.299, 0.143, 0.240, 0.255, 0.199, 0.239, 0.197)

# calculating batting average of each player
byrd_avg <- sum(byrd)/length(byrd)
fuld_avg <- sum(fuld)/length(fuld)
print('The player with the higher batting average is Byrd')

# calculating standard deviation of each player
byrd_sd <- sd(byrd)
fuld_sd <- sd(fuld)
print('The player with the higher variability is Fuld')

# calculating the coefficient of variation of each player
byrd_cv <- sd(byrd) / mean(byrd)
fuld_cv <- sd(fuld) / mean(fuld)
print('The player with the higher variability according to their CV is Fuld')

# calculating the IQR of the batting average of each player
byrd_iqr <- IQR(byrd)
fuld_iqr <- IQR(fuld)
print('The player with the higher variability according to their IQR is Fuld')










