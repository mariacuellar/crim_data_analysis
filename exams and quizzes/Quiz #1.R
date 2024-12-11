# Quiz #1


# 1. Load the data called domestic_violence.csv



# 2. What are the variables in the dataset?



# 3. How many observations are there in the dataset?



# 4. What type of R variable is "Age" (Note: in R, using lower case or upper case letters makes a difference)?



# 5. What type of Stat variable is "Age"?



# 6. Is there an identifier variable in this dataset?



# 7. What type of Stat variable is "Martial status"?



# 8. The summarize function gives the user the option to get summary statistics about a variables. What are the mean and variance of Age?
dat %>%
  summarize(mean = mean(Age), standard.deviation = sd(Age), variance = var(Age), n = n())



