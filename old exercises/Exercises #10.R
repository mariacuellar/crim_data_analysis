
library(tidyverse)
library(ggplot2)

# 1. Data

# a. Load the data and preview it
dat <- read_csv("/Users/mariacuellar/Documents/Penn/Classes/Statistics for the Social Sciences - Crim 1200/Fall 2023/Exercises/dat.nsduh.small.1.csv")

# b. What are the variables in the data? read the codebook


# c. How many individuals' responses were included?
nrow(dat)

# 2. EDA single variable: Do EDA, visual and quantitative, and write down in words what are some surprising features of each variable.


tab1 <- melt(table(dat$mjage)) %>% rename(mjage=Var1)

ggplot(data = tab1, aes(x=mjage, y=value)) + 
  
  geom_bar(stat = "identity")

sexatract 
speakeng
irsex




# a. age2
barplot(table(dat$age2, dat$sexatract), beside=TRUE)

summary(dat$mjage)
hist(dat$mjage, breaks=30)
dat %>% ggplot(aes(x=mjage))+geom_histogram()

tab1 <- melt(table(dat$mjage)) %>% rename(mjage=Var1)
ggplot(data = tab1, aes(x=mjage, y=value)) + 
  geom_bar(stat = "identity")
names(dat)
dat %>% ggplot(aes(x=factor(irsex), y=mjage)) + geom_boxplot()

penguins %>% filter(species == "Adelie") %>% summarise(
  flipperlength_mean = mean(flipper_length_mm),
  flipperlength_median = median(flipper_length_mm),
  flipperlength_sd = sd(flipper_length_mm),
  flipperlength_var = var(flipper_length_mm),
  flipperlength_iqr = IQR(flipper_length_mm)
)

?pnorm

SAT
qnorm(.25, mean=1500, sd=300, lower.tail = FALSE)
pnorm(1700, mean=1500, sd=300, lower.tail = FALSE)

qnorm(.01, mean=1200, sd=300, lower.tail=FALSE)


# b. sexatract
barplot(table(dat$sexatract))
dat$sexatract1 <- ifelse(dat$sexatract==99, NA, dat$sexatract)
barplot(table(dat$sexatract1))

# c. speakengl
# d. irsex

# 3. EDA two variables: Describe the relationship between the two variables visually and quantitatively.

# a. mjage and cigage
# b. sexatract and speakengl
# c. iralcage and irsex

# 4. EDA two variables for subgroups: How does the relationship between sexatract and spekengl change for women vs men?

# 5. Regressions: Fit linear models for the following relationships.

# a. Are men more likely to use marijuana earlier than women? Is this relationship statistically significant? What does that mean?
# b. Are the age of first use of alcohol and the age of first use of marijuana related? Is this relationship statistically significant?
# c. For both of these, what are the confidence intervals for the relevant parameter? What is the proper way to interpret these?




