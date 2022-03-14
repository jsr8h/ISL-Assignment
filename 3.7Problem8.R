#a
auto.lin.fit = lm(mpg ~ horsepower, data = Auto)
summary(auto.lin.fit)
predict(auto.lin.fit, data.frame(horsepower = 98), interval = "confidence")
predict(auto.lin.fit, data.frame(horsepower = 98), interval = "prediction")
#b
plot(Auto$horsepower, Auto$mpg, xlab = "Horsepower", ylab = "Miles per gallon")
abline(auto.lin.fit, lwd = 3, col = "blue")
#c
par(mfrow = c(2, 2))
plot(auto.lin.fit)
