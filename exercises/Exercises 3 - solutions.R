# Exercises 3: Solutions
# Crim 1200 - Fall 2025


library(tidyverse)
library(ggthemes)


# Load the data called kentucky derby
dat_kentucky <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/kentucky-derby-2018.csv")

# Draw a histogram of Time in sec from the kentucky data
dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram()

# can change the number of bins
dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram(bins=60)

# can change the axes
dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_histogram(bins=60) + xlim(0,200)

# can plot this as a density (not as clear what is going on in the data)
dat_kentucky %>% ggplot(aes(x=Time.in.Sec)) + geom_density()






# What does the distribution look like? 

# Describe this distribution quantitatively.
# need to work on this because it's bimodal. split it up into two sets of data, <140 and >=140.


# Filter out the values smaller than 140:
dat_kentucky %>% filter(Time.in.Sec<140) 


# thi splots a histogram for those filtered values
dat_kentucky %>% 
  filter(Time.in.Sec<140) %>%
  ggplot(aes(x=Time.in.Sec)) + 
  geom_histogram()

# this gives the measure of centrality and spread for the filtered data
dat_kentucky %>%
  filter(Time.in.Sec<140) %>%
  summarize(median = median(Time.in.Sec), 
            IQR = IQR(Time.in.Sec),
            n = length(Time.in.Sec))



# what about the rest of the data? let's explore why there's such a big separation
dat_kentucky %>% filter(Time.in.Sec>=140) 

# are these the newer races?
# let's sort by time in seconds (so the fastest races come first). look at the time in seconds. does there seem to be a jump that we see in the histogram? when does it happen?
dat_kentucky %>% arrange(Time.in.Sec) %>% print(n=Inf)


# make it blue if it's one of the newer years (split it up in different ways, with more and more years included)
dat_kentucky %>% 
  mutate(isnewyear = if_else(Year>1889, 1, 0)) %>%
  ggplot(aes(x=Time.in.Sec, fill=as.factor(isnewyear))) + geom_histogram()

# facets:
dat_kentucky %>% 
  mutate(isnewyear = if_else(Year>1889, 1, 0)) %>%
  ggplot(aes(x=Time.in.Sec, fill=as.factor(isnewyear))) + geom_histogram() + facet_wrap(~isnewyear)

# densities:
dat_kentucky %>% 
  mutate(isnewyear = if_else(Year>1889, 1, 0)) %>%
  ggplot(aes(x=Time.in.Sec, fill=as.factor(isnewyear))) + geom_density(alpha=.6)




# Exercises

# Use the dataset called: students1.csv
dat_students1 <- read_csv("/Users/mariacuellar/Github/crim_data_analysis/data/students1.csv")

# 1. Make a histogram of age in the students data.
dat_students1 %>% ggplot(aes(x=age)) + geom_histogram()
  
# 2. Make a histogram of grade in the students data.
dat_students1 %>% ggplot(aes(x=grade)) + geom_histogram()

# 2a. Describe the histogram in terms of shape (modes, symmetry, how peaked it is, outliers?).

# 3. Add to the plot the year in college (remember it has to be a factor).
dat_students1 %>% ggplot(aes(x=grade, fill=as.factor(year_in_college))) + geom_histogram()

# 4. Make a barplot of favorite color. which one has the most votes?
dat_students1 %>% ggplot(aes(x=as.factor(favorite_color))) + geom_bar()

# 5. Make a table that expresses the same info as the barplot.
dat_students1 %>% count(favorite_color) %>% mutate(prop = n / sum(n))

# 5. Make a density plot for grade, that has gender as fill (use alpha=.5)
dat_students1 %>% ggplot(aes(x=grade, fill=gender)) + geom_density(alpha=.5)


