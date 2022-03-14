library("ISLR")
pairs(Auto)

cor(Auto[, names(Auto) !="name"])

model = lm(mpg ~. -name, data = Auto)
summary(model)

par(mfrow = c(2,2))
plot(model)

model = lm(mpg ~.-name+displacement:weight, data = Auto)
summary(model)

model = lm(mpg ~.-name+displacement:cylinders+displacement:weight+acceleration:horsepower, data=Auto)
summary(model)

model = lm(mpg ~.-name+displacement:cylinders+displacement:weight+year:origin+acceleration:horsepower, data=Auto)
summary(model)

model = lm(mpg ~.-name-cylinders-acceleration+year:origin+displacement:weight + displacement:weight+acceleration:horsepower+acceleration:weight, data=Auto)
summary(model)
