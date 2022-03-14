library(MASS)
head(Boston)

dim(Boston)

str(Boston)

Boston$chas <- as.numeric(Boston$chas)
Boston$rad <- as.numeric(Boston$rad)
pairs(Boston)

#bestpredictor(Boston$crim)
summary(Boston$crim)
summary(Boston$ptratio)
install.packages("tidyverse")
library(ggplot2)
qplot(Boston$crim, binwidth=5 , xlab = "Crime rate", ylab="Number of Suburbs" )
qplot(Boston$tax, binwidth=50 , xlab = "Full-value property-tax rate per $10,000", ylab="Number of Suburbs")
qplot(Boston$ptratio, binwidth=5, xlab ="Pupil-teacher ratio by town", ylab="Number of Suburbs")
selection <- subset( Boston, crim > 10)
nrow(selection)/ nrow(Boston)
selection <- subset( Boston, crim > 50)
nrow(selection)/ nrow(Boston)
selection <- subset( Boston, tax< 600)
nrow(selection)/ nrow(Boston)
selection <- subset( Boston, tax> 600) 
nrow(selection)/ nrow(Boston)

nrow(subset(Boston, chas ==1)) 

summary(Boston$ptratio)

selection <- Boston[order(Boston$medv),]
selection[1,]

rm_over_7 <- subset(Boston, rm>7)
nrow(rm_over_7)  

rm("rm_over_7")
rm_over_8 <- subset(Boston, rm>8)
nrow(rm_over_8)  
summary(rm_over_8)