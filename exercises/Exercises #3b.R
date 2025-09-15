
# ggplot

library(tidyverse)

mpg
?mpg

# mpg %>% ggplot() equivalent to ggplot(data = mpg)

ggplot(data = mpg, aes(x = displ, y = hwy))

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# MAPPING color to a variable (legend appears)
mpg %>% ggplot(aes(x=displ, y=hwy, color = drv)) + geom_point()


# SETTING a constant color (no legend)
mpg %>% ggplot(aes(x=displ, y=hwy)) + geom_point(color = "steelblue")

mpg %>% ggplot(aes(x=displ, y=hwy)) + geom_point() + facet_grid(~drv)

library(ggthemes)

mpg %>% ggplot(aes(x=displ, y=hwy)) + geom_point() +
  labs(title="Quant variables by cat variable",
       x="Display", y="Highway") +
  theme_wsj()
  


ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  facet_wrap(~ class)

# Add a fitted line with standard errors (stat_smooth)
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +  # stat_smooth under the hood
  facet_wrap(~ class)

# Zoom into a region without recomputing the stat
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  facet_wrap(~ class) +
  coord_cartesian(xlim = c(1, 6), ylim = c(10, 45))

ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  facet_wrap(~ class) +
  coord_polar()

# Another example:
# coord_flip() for horizontal geoms; coord_polar() for pie/polar charts



ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point(size = 2, alpha = 0.8) +
  geom_smooth(method = "lm", se = TRUE) +
  facet_wrap(~ class) +
  coord_cartesian(xlim = c(1, 6), ylim = c(10, 45)) +
  labs(
    title = "Grammar of Graphics, Layer by Layer",
    subtitle = "Engine size vs highway MPG, faceted by vehicle class",
    x = "Engine displacement (liters)",
    y = "Highway MPG",
    color = "Drivetrain"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold")
  )





# TO BE CONTINUED...


# ------ Exercises

# 1. Using the student data, 

library(tidyverse)
dat_students <- read_csv("data/students1.csv")

dat_students

dat_students %>% ggplot(aes(x=grade)) + geom_histogram() + facet_grid(~favorite_color)
dat_students %>% ggplot(aes(x=grade, fill=favorite_color)) + geom_density(alpha=.4)


