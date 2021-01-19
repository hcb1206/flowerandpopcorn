library(ggplot2)
library(dplyr)
library(tidyr)
library(readxl)
library(RColorBrewer)


data <- read_xlsx("popvsflower.xlsx", sheet = 1)
data$flower <- data$flower * 100

gg <- ggplot(data, aes(x=flower, y=popcorn)) + 
  geom_point(aes(col=strain), size=3) + 
  geom_smooth(method="lm", col="black", size=1) +
  theme_minimal() + 
  labs(title="Potency Ratio of Flower and Popcorn", subtitle="By Strain", 
       y="popcorn THC %", x="flower THC %")


hh <- ggplot(data, aes(x=flower, y=popcorn)) + 
  geom_point(aes(col=harvest), size=3) + 
  geom_smooth(method="lm", col="black", size=1) +
  theme_minimal() + 
  labs(title="Potency Ratio of Flower and Popcorn", subtitle="By Harvest", 
       y="popcorn THC %", x="flower THC %")