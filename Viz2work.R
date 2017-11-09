# bus240viz2
#  working script for assignment #2
library(tidyverse)
library(ggplot2)
library(stringr)
library(lubridate)

### read the WDI data from disk
wi <- read_csv("C:/Users/Rob/Box Sync/My R Work/BUS240/Data files/World Indicators.csv")
wi2 <- select(wi, c("Birth Rate", "Life Expectancy", "Infant Mortality Rate", "Region", "Year"))
wi2 <- filter(wi2, Year > "12/1/2003" & Year < "12/1/2011")
glimpse(wi2)
#### 
#  Need to strip out '%' from 2 of the columns

wi2$birth <- str_sub(wi2$`Birth Rate`, 1, str_length(wi2$`Birth Rate`)-1)
wi2$birth <- as.numeric(wi2$birth)
wi2$im <- str_sub(wi2$`Infant Mortality Rate`, 1, str_length(wi2$`Infant Mortality Rate`)-1)
wi2$im <- as.numeric(wi2$im)
wi2$life <- as.numeric(wi2$`Life Expectancy`)
#### Convert Year to numeric year
wi2$Yr <- year(as.Date.character(wi2$Year, "%m/%d/%Y"))
wi2$Region <- as.factor(wi2$Region)
###############  Now summarize average rates by region
wi3 <- wi2 %>%
     group_by(Region, Yr) %>%
     summarize(birthrate = mean(birth, na.rm = T),
          life_exp = mean(life, na.rm = T), 
          infant = mean(im, na.rm = T))

###########  NOW make your plots
