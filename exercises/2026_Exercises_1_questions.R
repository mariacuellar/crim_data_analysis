# CRIM 1200
# Distributions: R Exercises
# Name:
# Date:

# ------------------------------------------------------------
# INSTRUCTIONS
# ------------------------------------------------------------

# Complete each exercise in this R script.
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
# 3. Save the file as: lastname_firstname_distributions.R
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

# For example:
#
# pretrial <- read_csv("pretrial_detention_teaching_data.csv")
# another_dataset <- read_csv("another_dataset.csv")
#
# Here, "pretrial" and "another_dataset" are two different R objects.
#
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

# Load the pretrial detention dataset.
# Change the working directory first if necessary.

pretrial <- read_csv("pretrial_detention_teaching_data.csv")

# Load a second dataset.
# We give it a different object name so that BOTH datasets remain available.

court_cases <- read_csv("court_cases_teaching_data.csv")


# Exercise 1
# Print the first dataset.

# YOUR CODE:


# Exercise 2
# Print the second dataset.

# YOUR CODE:


# Exercise 3
# How many rows and columns are in pretrial?

# YOUR CODE:

# Answer:


# Exercise 4
# How many rows and columns are in court_cases?

# YOUR CODE:

# Answer:


# Exercise 5
# In one sentence, explain why we called the datasets "pretrial" and
# "court_cases" instead of calling both of them "dat".

# Answer:


# ------------------------------------------------------------
# 4. REVIEW: CATEGORICAL VARIABLES
# ------------------------------------------------------------

# Exercise 6
# Using pretrial, count the number of observations in each gender category.

# YOUR CODE:


# Exercise 7
# Using pretrial, calculate the proportion of observations in each
# gender category.

# YOUR CODE:


# Exercise 8
# Make a bar plot of gender.

# YOUR CODE:


# Exercise 9
# In words, describe the distribution of gender.

# Answer:


# ------------------------------------------------------------
# 5. QUANTITATIVE VARIABLES: HISTOGRAMS
# ------------------------------------------------------------

# We will use court_cases for the next exercises.

# Exercise 10
# Look at the variable wait_time_minutes.
# What statistical type of variable is carat?


# Answer:


# Exercise 11
# Make a histogram of wait_time_minutes using ggplot().
# Start with the default bins.

# YOUR CODE:


# Exercise 12
# Make the histogram again, but set bins = 10.

# YOUR CODE:


# Exercise 13
# Make the histogram again, but set bins = 50.

# YOUR CODE:


# Exercise 14
# How does changing the number of bins change the appearance of the histogram?
# Does the underlying dataset change?

# Answer:


# ------------------------------------------------------------
# 6. DENSITY PLOTS
# ------------------------------------------------------------

# Exercise 15
# Make a density plot of wait_time_minutes.
#
# Hint:
# ggplot(aes(x = wait_time_minutes)) +
#   geom_density()

# YOUR CODE:


# Exercise 16
# What does a density plot show?
# What does the total area under the density curve equal?

# Answer:


# ------------------------------------------------------------
# 7. DESCRIBING THE SHAPE
# ------------------------------------------------------------

# Exercise 17
# Look at your histogram or density plot of wait_time_minutes.
# Describe its shape.
#
# Consider:
# - Is it unimodal, bimodal, multimodal, or roughly uniform?
# - Is it symmetric, right-skewed, or left-skewed?
# - Are there any unusual observations?

# Answer:


# ------------------------------------------------------------
# 8. CENTER
# ------------------------------------------------------------

# Exercise 18
# Calculate the median of wait_time_minutes.

# YOUR CODE:


# Exercise 19
# Calculate the mean of wait_time_minutes.

# YOUR CODE:


# Exercise 20
# Compare the mean and median.
# Based on the shape of the distribution, does the difference make sense?
# Explain briefly.

# Answer:


# ------------------------------------------------------------
# 9. SPREAD
# ------------------------------------------------------------

# Exercise 21
# Calculate the minimum and maximum carat.

# YOUR CODE:


# Exercise 22
# Calculate the range of wait_time_minutes.
#
# Remember:
# range = maximum - minimum

# YOUR CODE:


# Exercise 23
# Calculate Q1, the median, and Q3 for carat.
#
# Hint:
# quantile(variable, probs = c(.25, .50, .75))

# YOUR CODE:


# Exercise 24
# Calculate the interquartile range (IQR) of wait_time_minutes.

# YOUR CODE:


# Exercise 25
# Calculate the standard deviation of wait_time_minutes.

# YOUR CODE:


# ------------------------------------------------------------
# 10. CHOOSING SUMMARY STATISTICS
# ------------------------------------------------------------

# Exercise 26
# Based on the shape of the wait_time_minutes distribution, which pair is more
# appropriate for describing center and spread?
#
# A. Mean and standard deviation
# B. Median and IQR
#
# Answer:
#
# Explain why:


# ------------------------------------------------------------
# 11. PUTTING IT ALL TOGETHER
# ------------------------------------------------------------

# Exercise 27
# Now examine the variable case_duration_days in court_cases.
# Make an appropriate visualization of its distribution.

# YOUR CODE:


# Exercise 28
# Describe the distribution of case_duration_days in terms of:
# shape, center, spread, and unusual observations.
#
# You should calculate the numerical summaries you need below.

# YOUR CODE:


# Answer:


# ------------------------------------------------------------
# 12. FINAL QUESTION
# ------------------------------------------------------------

# Exercise 29
# Why should we look at a graph of a quantitative variable before deciding
# whether to summarize it with the mean and standard deviation or with the
# median and IQR?

# Answer:
