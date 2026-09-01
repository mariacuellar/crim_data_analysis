# Title: Loading data
# Date: 9/2/2026
# Author: MCuellar


# Load packages we'll use. Always run this first!

library(tidyverse)


--
# Load the data:

# Set working directory as a string variable for use in other code chunks.
# This will depend on your local environment.
setwd("/Users/mariacuellar/Github/crim_data_analysis/data/")

# Load the data, which is a csv file. R loads it as a tibble
dat <- read_csv(file = "domestic_violence.csv") 


--
# Look at the data:

# Look at the data. 
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

# Want to see more rows?
dat %>% print (n=30)

# What variables are there in dat? Give me a vector of characters.
dat %>% colnames()


--
# Look at one variable:

# What type of variable is it?
dat %>% 
  pull(Education) %>% 
  class()

# What values does it take?
dat %>% 
  distinct(Education)

# How many unique values?
dat %>% 
  summarize(n_values = n_distinct(Education))

# How many observations are in each category?
dat %>% 
  count(Education)
  

