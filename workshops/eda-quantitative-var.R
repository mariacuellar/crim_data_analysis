# Title: Initial EDA: Quantitative data
# Date: 9/10/2026
# Author: Maria Cuellar


# Load packages.
library(tidyverse)

# Load data.
dat <- read_csv(file = "court_cases_teaching_data.csv")


# For quantitative variables.


# Look at one quantitative variable
dat %>%
  select(wait_time_minutes)


# Histogram
dat %>%
  ggplot(aes(x = wait_time_minutes)) +
  geom_histogram()


# Choose the number of bins
dat %>%
  ggplot(aes(x = wait_time_minutes)) +
  geom_histogram(bins = 20)


# Give the plot titles
dat %>%
  ggplot(aes(x = wait_time_minutes)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of Wait Times",
    x = "Wait Time (minutes)",
    y = "Count"
  )


# Density plot
dat %>%
  ggplot(aes(x = wait_time_minutes)) +
  geom_density()


# Describe the shape of the distribution:
# Is it unimodal, bimodal, multimodal, or uniform?
# Is it symmetric, right-skewed, or left-skewed?
# Are there any unusual observations?


# Summary of the variable
summary(dat$wait_time_minutes)


# Mean
dat %>%
  summarize(mean = mean(wait_time_minutes))


# Median
dat %>%
  summarize(median = median(wait_time_minutes))


# Interquartile range (IQR)
dat %>%
  summarize(IQR = IQR(wait_time_minutes))


# Standard deviation
dat %>%
  summarize(sd = sd(wait_time_minutes))


# Calculate several summaries at once
dat %>%
  summarize(
    mean = mean(wait_time_minutes),
    median = median(wait_time_minutes),
    IQR = IQR(wait_time_minutes),
    sd = sd(wait_time_minutes)
  )


# Which measures should we report?
# For a skewed distribution: median and IQR
# For a symmetric distribution: mean and standard deviation