# R-script for EC2203 lecture 6
# Author: Jesper Bagger
# Date: 02/11/2020

library(AER) # include Applied Econometrics with R library
library(parameters) # include parameters library
data(CASchools) # Load CASchools data
# Generate a couple of useful variables
CASchools$STR <- CASchools$students/CASchools$teachers  # Student-teacher ratio
CASchools$Score <- (CASchools$read + CASchools$math)/2  # Student test score

# Regression of Score on STR using CASchools dataframe
lm1 <- lm(Score ~ STR, data = CASchools) # Fitted model in lm1

# Regression output with heteroskedastic robust SEs
parameters(lm1, robust = TRUE, vcov_type = "HC1")
