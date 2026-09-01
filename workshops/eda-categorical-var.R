# Title: Initial EDA: Categorical data
# Date: 9/2/2026
# Author: Maria Cuellar


# Load packages.
library(tidyverse)

# Load data.
dat <- read_csv(file = "pretrial_detention_teaching_data.csv") 

# For categorical variables.


# Count observations in each category
dat %>%
  count(gender)


# Count and calculate proportions
dat %>%
  count(gender) %>%
  mutate(proportion = n / sum(n))


# Bar plot
dat %>%
  ggplot(aes(x = gender)) +
  geom_bar()


# If you want the bars ordered from most to least common:
dat %>%
  count(gender) %>%
  ggplot(aes(x = reorder(gender, -n), y = n)) +
  geom_col()


# Give the original plot titles, both for the plot and the axes
dat %>%
  ggplot(aes(x = gender)) +
  geom_bar() +
  labs(
    title = "Gender Distribution of Individuals in the Dataset",
    x = "Gender",
    y = "Number of Individuals"
  )





# Counts for two categorical variables
dat %>%
  count(gender, detained)


# Add proportion arrested within each group
dat %>%
  count(gender, detained) %>%
  group_by(gender) %>%
  mutate(proportion = n / sum(n))


# Visualizing two categorical variables
dat %>%
  ggplot(aes(x = gender, fill = detained)) +
  geom_bar(position = "dodge")


# Give it some titles
dat %>%
  count(gender, detained) %>%
  ggplot(aes(x = gender, y = n, fill = detained)) +
  geom_col(position = "dodge") +
  labs(
    title = "Pretrial Detention by Gender",
    x = "Gender",
    y = "Number of Individuals",
    fill = "Detained"
  )

