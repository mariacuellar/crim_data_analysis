# Exercises 1: Solutions
# Crim 1200 - Fall 2025


# DVB Chp 1: Problem 41
# Kentucky Derby 2018 on the computer Load the Kentucky Derby 2018 data into your preferred statistics package and answer the following questions;
# a) What was the name of the winning horse in 1880?
# b) When did the length of the race change?
# c) What was the winning time in 1974?
# d) Only one horse has run the Derby in less than 2 minutes. Which horse and in what year?

# load tidyverse package
install.packages("tidyverse") # only run this once!
library(tidyverse)

# load the data (note that it's a "comma-separated value" file so you read it in with csv)
dat <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/kentucky-derby-2018.csv")

# see the first few rows of the data
dat

# see all the data
View(dat)

# check the dimensions of the data
dim(dat)

# a) find the name of the winning horse in 1880

# filter to only keep the observation from 1880
dat %>% filter(Year == 1880)

# The name of the winning horse in 1880 is Fonso.

# b) When did the length of the race change?

# view full dataset to see in what year did Distance (mi) change.
View(dat)

# Distance changed in 1986.

# c) What was the winning time in 1974?

# filter to only keep the observation from 1974
dat %>% filter(Year == 1974)

# Winning time was 2 min 4 sec.

# d) Only one horse has run the Derby in less than 2 minutes. Which horse and in what year?

# filter to only keep the observations that have fewer than 2 minutes.
dat %>% filter(Mins < 2)
# 1973

