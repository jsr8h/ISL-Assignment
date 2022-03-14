require(ISLR); require(tidyverse); require(broom)
require(ggthemes); require(knitr)
theme_set(theme_tufte(base_size = 14))
data("Carseats")

carseats_model <- lm(Sales ~ Price + Urban + US, data = Carseats)

kable(tidy(carseats_model),digits = 2)

coefs <- round(coef(carseats_model), digits = 2)

kable(tidy(carseats_model) %>% filter(p.value <= 0.5),digits = 3)

carseats_trimmed_model <- lm(Sales ~ Price + US, data = Carseats)

lm.fit2 = lm(Sales ~ Price+US, data= Carseats)
summary(lm.fit2)


kable(glance(carseats_model) %>% full_join(glance(carseats_trimmed_model)) %>% mutate(Model = c('Full', 'Trimmed')) %>%
        select(Model, r.squared, statistic, p.value),digits = 3)

kable(tidy(anova(carseats_trimmed_model, carseats_model)) %>%
        mutate(Model = c('Trimmed', 'Full')) %>%
        select(Model, rss, statistic, p.value),
      digits = 3)

res_diff <- sum(residuals(carseats_model)^2) - sum(residuals(carseats_trimmed_model)^2)

kable(confint(carseats_trimmed_model),digits = 3)

par(mfrow = c(2,2))
plot(carseats_trimmed_model)

par(mfrow = c(1,1))
par(mfrow=c(2,2))
par(mfrow=c(2,2))
plot(lm.fit2)