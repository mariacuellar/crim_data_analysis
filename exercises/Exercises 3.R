

# Change appearance colors in RStudio:

# navigate to Tools > Global Options > Appearance (or RStudio > Preferences > Appearance on macOS) and select a desired theme from the dropdown menu. 



# ------ LOAD DATA -------

# Load data (make sure you name it as an object with a useful name)
library(tidyverse)
dat_kentucky <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/kentucky-derby-2018.csv")
dat_students <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/students.csv")

dat_kentucky
dat_students



# ------ DATA SELECTION -------

# How to select an observation: 

year1986 <- dat_kentucky %>% filter(Year==1986)

year1986


# Note: understand the pipe operator (%>% or |>): The main function of the pipe operator is to take the output of the expression or function on its left-hand side (LHS) and pass it as the first argument to the function on its right-hand side (RHS). This allows you to chain multiple operations together in a clear, sequential manner.


# How to select a variable:

thewinner <- dat_kentucky %>% select(Winner)

thewinner


# How to select both (observation and variable):

thewinnerin1986 <- dat_kentucky %>% 
  filter(Year==1986) %>% 
  select(Winner)

thewinnerin1986




# ------ FIRST LOOK AT DATA -------

# Variables in dataset? can look at Data pane, or use names()
names(dat_kentucky)

# Type of R variable: can look at the Data pane, or use class()
class(dat_kentucky$Secs)

# Look at dimensions of data: can look at the Data pane, or use dim()
dim(dat_kentucky)

# NOTE: the commands let me see what you did.




# ------ SUMMARIZE CATEGORICAL VARIABLE -------


# How to make a table to summarize a categorical variable:
table(dat_students$YearInCollege) # Base R

dat_students %>% count(YearInCollege) # tidyverse

# How to make add proportions/:
dat_students %>% 
  count(YearInCollege) %>% 
  mutate(prop = n / sum(n))


# How to make a table to summarize Two categorical variables:
table(dat_students$FavoriteColor, dat_students$YearInCollege) # It's trickier in tidyverse, but check out the janitor package






# ------ VISUALIZE QUANTITATIVE VARIABLE -------

# How to draw a histogram

dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram()

# You can save it as an object 
p <- dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram()


# How to change the aesthetics and labels

dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram(bins = 30, fill = "steelblue", color = "white")

  
# How to change the aesthetics and labels
dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram() +
    labs(
    x = "Time in seconds",   # new label for x-axis
    y = "Count",         # new label for y-axis
    title = "Histogram of Time in Seconds"
  )

# This is equivalent to
p +
  labs(
    x = "Time in seconds",   # new label for x-axis
    y = "Count",         # new label for y-axis
    title = "Histogram of Time in Seconds"
  )


# You can change the theme too
library(ggthemes)

p + theme_economist()
p + theme_stata()
p + theme_fivethirtyeight()
p + theme_minimal()





# ------ VISUALIZE CATEGORICAL VARIABLE -------

# How to draw a barplot for YearInCollege

# using base R, it's just barplot()
barplot(table(dat_students$YearInCollege))


# In tidyverse, first, make sure you make the variable a factor
dat_students <- dat_students %>% mutate(YearInCollege = as_factor(YearInCollege))

# Check to see that it's a factor in your tibble (aka dataframe).
dat_students

# Now use ggplot
dat_students %>% ggplot(aes(x = YearInCollege)) + geom_bar() 







# ------ EXERCISES -------

# 1. Draw a histogram for speed in the kentucky derby data

# 2. Draw a barplot for favorite color for in the students data







