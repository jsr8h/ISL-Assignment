#a
college <- read.csv("https://www.statlearning.com/s/College.csv")
#b
rownames(college) <- college[, 1]
View(college)

college <- college[, -1]
head(college)
#c
#(i)
summary(college)
#(ii)
college$Private <- as.factor(college$Private)
pairs(college[,1:10])
#(iii)
plot(college$Private, college$Outstate,
     xlab = "Private University", ylab = "Tuition in $")
#iv
Elite <- rep("No", nrow(college))
Elite[college$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(college, Elite)
summary(Elite)
plot(college$Elite, college$Outstate, 
     xlab = "Elite University", ylab = "Tuition in $")
#v
par(mfrow = c(2, 2))
hist(college$S.F.Ratio, xlab = "Student-Faculty Ratio", main = "Histogram for all colleges")
hist(college$S.F.Ratio[college$Private == "Yes"], xlab = "Student-Faculty Ratio", main = "Histogram for private schools")
hist(college$S.F.Ratio[college$Private == "No"], xlab = "Student-Faculty Ratio", main = "Histogram for public schools")
hist(college$S.F.Ratio[college$Elite == "Yes"], xlab = "Student-Faculty Ratio", main = "Histogram for elite schools")
#vi
par(mfrow = c(2, 2))
plot(college$PhD, college$Grad.Rate, xlab = "Number of faculty with PhDs", ylab = "Graduation Rate")
plot(college$Terminal, college$Grad.Rate, xlab = "Number of faculty with terminal degrees", ylab = "Graduation Rate")
plot(college$S.F.Ratio, college$Grad.Rate, xlab = "Student-faculty ratio", ylab = "Graduation Rate")
plot(college$Expend, college$Grad.Rate, xlab = "Instructional expenditure per student (dollars)", ylab = "Graduation Rate")
row.names(college)[which.max(college$Top10perc)]  
