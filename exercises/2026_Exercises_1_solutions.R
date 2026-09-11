# CRIM 1200
# Distributions: R Exercises
# Name:
# Date:

# ------------------------------------------------------------
# INSTRUCTIONS
# ------------------------------------------------------------

# Complete each exercise in this R script. 
#
# Each question is worth 2 points.
#
# For questions that ask you to WRITE an answer, type your answer as a comment.
# In R, a comment begins with # and R will not try to run it as code.
#
# Example:
# Question: What type of variable is price?
# Answer: Quantitative, continuous.
#
# For questions that ask you to WRITE R CODE, type the code directly below
# the question.
#
# Before submitting:
# 1. Run your entire script from top to bottom.
# 2. Make sure the code runs without errors.
# 3. Save the file with your new edits.
# 4. Submit the .R file on Canvas.



# ------------------------------------------------------------
# 1. LOAD PACKAGES
# ------------------------------------------------------------

library(tidyverse)



# ------------------------------------------------------------
# 2. WORKING WITH MORE THAN ONE DATASET
# ------------------------------------------------------------

# You can have more than one dataset loaded in R at the same time.
# Each dataset needs its own OBJECT NAME.

# IMPORTANT:
# If you do this:
#
# dat <- read_csv("dataset1.csv")
# dat <- read_csv("dataset2.csv")
#
# the second line REPLACES the first object called dat.
# After the second line runs, dat refers only to dataset2.
#
# So when you are working with multiple datasets, give them meaningful,
# different names.


# ------------------------------------------------------------
# 3. LOAD THE DATA
# ------------------------------------------------------------

# Load the pretrial detention dataset (call it pretrial).
# Change the working directory first if necessary.

setwd("/Users/mariacuellar/Github/crim_data_analysis/data/")
pretrial <- read_csv("pretrial_detention_teaching_data.csv")


# Load the court cases dataset (call it court_cases).
# We give it a different object name so that BOTH datasets remain available.

court_cases <- read_csv("court_cases_teaching_data.csv")


# Print the first dataset, pretrial.

# YOUR CODE:
pretrial



# Print the second dataset, court_cases.

# YOUR CODE:
court_cases



# How many rows and columns are in pretrial?

# YOUR CODE:
dim(pretrial)

# Answer: 30 rows, 7 columns



# How many rows and columns are in court_cases?

# YOUR CODE:
dim(court_cases)

# Answer: 300 rows, 6 columns



# ------------------------------------------------------------
# 4. REVIEW: CATEGORICAL VARIABLES
# ------------------------------------------------------------


# Using pretrial, count the number of observations in each gender category.

# YOUR CODE: 
pretrial %>% 
  count(gender)



# Using pretrial, calculate the proportion of observations in each
# gender category.

# YOUR CODE:
pretrial %>% 
  count(gender) %>% 
  mutate(proportion = n / sum(n))



# Using pretrial, make a bar plot of gender.

# YOUR CODE:
pretrial %>% 
  ggplot(aes(x = gender)) + 
  geom_bar()



# In words, describe the distribution of gender.

# Answer: There are more male than female observations, and a few Other.



# ------------------------------------------------------------
# 5. QUANTITATIVE VARIABLES: HISTOGRAMS
# ------------------------------------------------------------

# We will use court_cases for the next exercises.


# Look at the variable wait_time_minutes.
# What statistical type of variable is it?

# YOUR CODE:
court_cases$wait_time_minutes

# Answer:
# It is a quantitative continuous variable.



# Make a histogram of wait_time_minutes using ggplot().
# Start with the default bins.

# YOUR CODE:
court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) + 
  geom_histogram()



# Make the histogram again, but set bins = 10.

# YOUR CODE:
court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) + 
  geom_histogram(bins = 10)

p_10bins <- court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) + 
  geom_histogram(bins = 10)



# Make the histogram again, but set bins = 50.

# YOUR CODE:
court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) + 
  geom_histogram(bins = 50)

p_50bins <- court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) + 
  geom_histogram(bins = 50)


# Display the two histograms side by side.

#install.packages("patchwork")
library(patchwork)

p_10bins + p_50bins



# How does changing the number of bins change the appearance of the histogram?
# Does the underlying dataset change?

# Answer: The histogram shows the same data, but it looks a little different
# with more or fewer bins. We can see how the higher values are distributed
# across just a few different numbers, and there are many gaps there. We can
# also see that there's a bit of a gap left of the mode in the 50-bin
# histogram that we don't see in the 10-bin histogram. The underlying dataset
# does not change.



# ------------------------------------------------------------
# 6. DENSITY PLOTS
# ------------------------------------------------------------


# Make a density plot of wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  ggplot(aes(x = wait_time_minutes)) +
  geom_density()



# What does a density plot show?
# What does the total area under the density curve equal?

# Answer: A density plot shows the shape of the distribution of a quantitative
# variable. Higher density means observations are more concentrated around
# those values. The total area under the curve equals 1.



# ------------------------------------------------------------
# 7. DESCRIBING THE SHAPE
# ------------------------------------------------------------

# Look at your histogram or density plot of wait_time_minutes.
# Describe its shape.
#
# Consider:
# - Is it unimodal, bimodal, multimodal, or roughly uniform?
# - Is it symmetric, right-skewed, or left-skewed?
# - Are there any unusual observations?

# Answer: It looks unimodal, right-skewed, and doesn't seem to have any unusual
# observations. Because it's a wait time, there can be no negative numbers,
# so we'd expect the distribution to be skewed.



# ------------------------------------------------------------
# 8. CENTER
# ------------------------------------------------------------

# Calculate the median of wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  summarize(median = median(wait_time_minutes))



# Calculate the mean of wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  summarize(mean = mean(wait_time_minutes))



# Compare the mean and median.
# Based on the shape of the distribution, does the difference make sense?
# Explain briefly.

# Answer: The median is lower than the mean. This is because the distribution
# is right-skewed. The difference does make sense. It is not extremely skewed,
# meaning that there are not a large number of observations in the right tail.



# ------------------------------------------------------------
# 9. SPREAD
# ------------------------------------------------------------


# Calculate the minimum and maximum wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  summarize(
    min = min(wait_time_minutes), 
    max = max(wait_time_minutes)
  )



# Calculate the range of wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  summarize(range = max(wait_time_minutes) - min(wait_time_minutes))



# Calculate Q1, the median, and Q3 for wait_time_minutes.

# YOUR CODE:
summary(court_cases$wait_time_minutes)



# Calculate the interquartile range (IQR) of wait_time_minutes.

# YOUR CODE:
court_cases %>% 
  summarize(IQR = IQR(wait_time_minutes))

# Answer: The interquartile range is 17.3 minutes.



# Calculate the standard deviation of wait_time_minutes.

# YOUR CODE: 
court_cases %>% 
  summarize(sd = sd(wait_time_minutes))

# Answer: The standard deviation is 12.9 minutes. It is lower than the IQR,
# as expected.



# ------------------------------------------------------------
# 10. CHOOSING SUMMARY STATISTICS
# ------------------------------------------------------------

# Based on the shape of the wait_time_minutes distribution, which pair is more
# appropriate for describing center and spread?
#
# A. Mean and standard deviation
# B. Median and IQR
#
# Answer: B.
#
# Explain why: The distribution is asymmetric, and the mean is sensitive to
# the long right tail, so the median and IQR better describe the center and
# spread of this distribution.