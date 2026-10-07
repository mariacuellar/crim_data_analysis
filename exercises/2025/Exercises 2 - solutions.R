# Exercises 2: Solutions
# Crim 1200 - Fall 2025



library(tidyverse)
# 1. Load the data called students.csv
dat <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/students.csv")


# 2. What are the variables in the dataset?
names(dat)


# 3. How many observations are there in the dataset?
nrow(dat)


# 4. What type of R variable is "year_in_college"?
class(dat$year_in_college)

# 4a. Make it into a factor 
dat$year_in_college<-as.factor(dat$year_in_college)

class(dat$year_in_college)

# 5. Make a table to summarize Year in college using base R
table(dat$year_in_college)

# 5a. Make a table to summarize Year in college using tidyverse

dat %>% 
  count(year_in_college)

dat %>%
  count(year_in_college) %>%
  mutate(prop = n / sum(n))


# 6. Make a barplot using base R

plot(dat$year_in_college) # no titles 

plot(dat$year_in_college, # with title and labels
     main = "Students per Year",
     xlab = "Year in College", 
     ylab = "Count")

# 6a. Make a barplot using ggplot

dat %>% ggplot(aes(x = factor(year_in_college))) + geom_bar() +
  labs(title = "Students per Year",
       x = "Year in College",
       y = "Count")



