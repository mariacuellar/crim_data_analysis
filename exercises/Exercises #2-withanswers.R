
# Exercises #2

library(tidyverse)
# 1. Load the data called students.csv
dat <- read_csv("/Users/mariacuellar/Downloads/students.csv")


# 2. What are the variables in the dataset?
names(dat)


# 3. How many observations are there in the dataset?
nrow(dat)


# 4. What type of R variable is "YearInCollege"?
class(dat$YearInCollege)

# 4a. Make it into a factor 
dat$YearInCollege<-as.factor(dat$YearInCollege)

class(dat$YearInCollege)

# 5. Make a table to summarize Year in college using base R
table(dat$YearInCollege)

# 5a. Make a table to summarize Year in college using tidyverse

dat %>% 
  count(YearInCollege)

dat %>%
  count(YearInCollege) %>%
  mutate(prop = n / sum(n))


# 6. Make a barplot using base R

plot(dat$YearInCollege)

plot(dat$YearInCollege, 
     main = "Students per Year",
     xlab = "Year in College", 
     ylab = "Count")

# 6a. Make a barplot using ggplot

dat %>% ggplot(aes(x = factor(YearInCollege))) + geom_bar() +
  labs(title = "Students per Year",
       x = "Year in College",
       y = "Count")



