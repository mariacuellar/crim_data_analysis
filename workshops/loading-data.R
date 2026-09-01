# Title: Loading data
# Date: 9/2/2026
# Author: Maria Cuellar


# Load packages we'll use. Always run this first!

library(tidyverse)



# Load the data:

# Set working directory as a string variable for use in other code chunks.
# This will depend on your local environment.
setwd("/Users/mariacuellar/Github/crim_data_analysis/data/")

# Load the data, which is a csv file. R loads it as a tibble
dat <- read_csv(file = "pretrial_detention_teaching_data.csv") 



# Look at the data:
dat

# This shows: 
# dimensions of tibble, 
# variable names, 
# variable (R) types, 
# first 10 rows of tibble, and 
# how many rows are missing. 
# Note that some variables have quotes `` around them. Why do you think that is?
# Also, note that R's storage variable type does not necessarily tell you the statistical variable type.

# Number of rows and columns
dat %>% dim()

# What does (%>%) percent-greater than-percent mean? This is a pipe: automatically passes the left-side result into the first argument of the right-side function. Can also use |>. Pipes create "pipe chains".


# Want to see more rows?
dat %>% print (n=30)

# Note that sometimes it's easier to read pipe chains if they're in different lines. 
# can also write the previous line as:
dat %>% 
  print (n=30)

# What variables are there in dat? Give me a vector of characters.
dat %>% colnames()


# Note: to run code in R you can: have cursor stand on any part of the pipe chain. Then you can point and click on the "Run" button or you can use your keyboard (command+return for mac, or control+enter for windows).




# Look at one variable: gender
dat %>% select(gender) %>% print(n=30)

  
# What type of variable is it?
dat %>% 
  pull(gender) %>% 
  class()

# What values does it take?
dat %>% 
  distinct(gender)

# How many unique values?
dat %>% 
  summarize(n_values = n_distinct(gender))

# How many observations are in each category?
dat %>% 
  count(gender)
  

