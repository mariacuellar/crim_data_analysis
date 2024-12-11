# Exercises #4
library(tidyverse)

# 1. Load the data called kentucky derby
dat <- read_csv("/Users/mariacuellar/Documents/Penn/Classes/Statistics for the Social Sciences - Crim 1200/Fall 2024/Exercises/kentucky-derby-2018.csv")


# 2. Draw a histogram of Time in sec
hist(dat$Time.in.Sec, xlim=c(0,200), ylim=c(0,100))
hist(dat$Time.in.Sec)

plot(density(dat$Time.in.Sec))



install.packages("ggthemes")
library(ggthemes)

dat %>% 
  ggplot(aes(x=Time.in.Sec)) + 
  geom_histogram(bins=60) +
  xlim(0,200) +
  theme_minimal()

dat %>% 
  ggplot(aes(x=Time.in.Sec)) + 
  geom_density(color="darkblue", fill="lightblue")



# 3. What does the distribution look like?
Bimodal!


# 4. Describe this distribution quantitatively.



# 5. Filter out the values smaller than 140:
dim(dat)
  
# this filters out values smaller than time=140
filtered_dat <- dat %>% filter(Time.in.Sec<140) 
dim(filtered_dat)

# thisplots a histogram for those filtered values
dat %>%
  filter(Time.in.Sec<140) %>%
  ggplot(aes(x=Time.in.Sec)) + 
  geom_histogram()

# this gives the measure of centrality and spread for the filtered data
dat %>%
  filter(Time.in.Sec<140) %>%
  filter(!is.na(Time.in.Sec)) %>% 
  summarize(median = median(Time.in.Sec), 
            IQR = IQR(Time.in.Sec),
            n = length(Time.in.Sec))

# check for outliers:
dat %>%
  filter(Time.in.Sec < 140 & Time.in.Sec > 133)

range(dat$Year, na.rm = TRUE)




# Distance:

