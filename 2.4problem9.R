library(ISLR)
data("Auto")
auto <- na.omit(Auto)
attach(auto)

lapply(auto, class)

origin <- as.factor(origin)

cols.qlt = names(auto) %in% c("name", "origin")
lapply(auto[, !cols.qlt], range)

lapply(auto[, !cols.qlt], function(x){ c('mean'=mean(x), 'sd'=sd(x))})

lapply(auto[-(10:85), !cols.qlt], function(x){ c('mean'=mean(x), 'sd'=sd(x))})

pairs(auto[, !cols.qlt])

par(mfrow=c(2,2))

plot(displacement, acceleration)
plot(weight, horsepower)
plot(cylinders, mpg)
plot(weight, mpg)


others.variables = !(names(auto) %in% "mpg" | cols.qlt)
par(mfrow=c(3,2))
for(i in names(auto[, others.variables])){
  plot(mpg, get(i), ylab=i)
}