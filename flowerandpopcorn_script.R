library(ggplot2)
library(dplyr)
library(tidyr)
library(readxl)
library(RColorBrewer)
library(plyr)

data <- read_xlsx("popvsflower.xlsx", sheet = 1)
data$flower <- data$flower * 100
data$popcorn <- data$popcorn * 100

data_weighted <- read_xlsx("popvsflower_weighted.xlsx", sheet = 1)
data_weighted$flower <- data_weighted$flower * 100
data_weighted$popcorn <- data_weighted$popcorn * 100

#before weights

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

#after weights

ggw <- ggplot(data_weighted, aes(x=flower, y=popcorn)) + 
  geom_point(aes(col=strain), size=3) + 
  geom_smooth(method="lm", col="black", size=1) +
  theme_minimal() + 
  labs(title="Weighted Potency Ratio of Flower and Popcorn", subtitle="By Strain", 
       y="popcorn THC %", x="flower THC %")


hhw <- ggplot(data_weighted, aes(x=flower, y=popcorn)) + 
  geom_point(aes(col=harvest), size=3) + 
  geom_smooth(method="lm", col="black", size=1) +
  theme_minimal() + 
  labs(title="Weighted Potency Ratio of Flower and Popcorn", subtitle="By Harvest", 
       y="popcorn THC %", x="flower THC %")
