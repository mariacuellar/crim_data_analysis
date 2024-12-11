library(tidyr)
library(dplyr)

# load data
birthwt <- as_tibble(MASS::birthwt)

# recode data
birthwt <- birthwt %>%
  rename(birthwt.below.2500 = low, 
         mother.age = age,
         mother.weight = lwt,
         mother.smokes = smoke,
         previous.prem.labor = ptl,
         hypertension = ht,
         uterine.irr = ui,
         physician.visits = ftv,
         birthwt.grams = bwt)

birthwt <- birthwt %>%
  mutate(race = recode_factor(race, `1` = "white", `2` = "Black", `3` = "other")) %>%
  mutate_at(c("mother.smokes", "hypertension", "uterine.irr", "birthwt.below.2500"),
            ~ recode_factor(.x, `0` = "no", `1` = "yes"))

# summary table for different categories of race
birthwt %>%
  group_by(race) %>%
  summarize(mean.bwt = round(mean(birthwt.grams), 0),
            sd.bwt = sd(birthwt.grams),
            se.bwt = round(sd(birthwt.grams) / sqrt(n()), 0))

# splitting data up into groups
birthwt.white <- birthwt[ which(birthwt$race=='white'), ]
birthwt.Black <- birthwt[ which(birthwt$race=='Black'), ]
birthwt.other <- birthwt[ which(birthwt$race=='other'), ]


# diagnostic plots for ANOVA
# checking for normality in each group
qqnorm(birthwt.white$birthwt.grams, main="Normal Q-Q plot for white")
qqline(birthwt.white$birthwt.grams)

qqnorm(birthwt.Black$birthwt.grams, main="Normal Q-Q plot for Black")
qqline(birthwt.Black$birthwt.grams)

qqnorm(birthwt.other$birthwt.grams, main="Normal Q-Q plot for other")
qqline(birthwt.other$birthwt.grams)


# version 1: running ANOVA test as a lm - not correct
reg.output <- lm(birthwt.grams ~ race, data = birthwt)
summary(reg.output)

# version 2: running ANOVA test directly - correct
reg.output <- lm(birthwt.grams ~ race, data = birthwt)
anova.output <- aov(reg.output)
summary(anova.output)

# version 2: running ANOVA test directly - correct
anova.output1 <- aov(birthwt.grams ~ race, data = birthwt)
summary(anova.output1)

# multiple comparison test
tukey.test <- TukeyHSD(x=anova.output, 'race')
plot(tukey.test , las=1)



