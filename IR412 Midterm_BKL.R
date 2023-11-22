##########Header###################
# IR412 Midterm Fall 2022
# Beatrice Lin 
# November 4, 2022
# Creating a scatterplot w/ProductivePacifists_Data.RDATA
###################################

#Clear my environment in R
rm(list=ls())

# set my working directory
setwd("/Users/Bebe/Downloads/Training Data Summer 2022")

# loading in packages
library(ggplot2)
library(tidyverse)
library(dplyr)

# loading in data
dat <- load("ProductivePacifists_Data.RDATA")

# creating a new variable with data organized by the 4 years chosen
orgDat <- filter(dat, year %in% c("1925", "1950", "1975", "2000"))
# creating the plot
# creating a subset out of the organized data with the 4 countries chosen
mid <- ggplot(subset(orgDat, gwno %in% c("2", "20", "40", "41")),
              # choosing which variables to use in the plot
              aes(x = WorldBank_gdppc_2010_con_estimate, 
                  y = land_oriented_medium_continuous_trim, 
                  # making each year a different color and each country a different shape
                  color = factor(year),shape = factor(gwno))) +
  # making this plot a scatterplot
  geom_point()+
  # making the background completely white
  theme_minimal() +
  # labelling the graph
  labs(title = "GDP Per Capita and Land Orientation (1925, 1950, 1975, 2000)",
           subtitle = "Productive Pacifists Data",
           x = "GDP Per Capita",
           y = "Land Orientation")+
  # Titling the legend for colors (years) and picking the colors
  scale_color_manual(name = "Year", values = c("orange",
                                               "cyan",
                                               "blue",
                                               "pink"))
mid

ggsave("IR412_MidtermPlot_BKL.pdf")
