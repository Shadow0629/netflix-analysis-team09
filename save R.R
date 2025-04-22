library(readr)
netflix_titles <- read_csv("netflix_titles.csv")
View(netflix_titles)
 
data(netflix_titles)

library(ggplot2)
library(tidyverse)
library(lubridate)


#  Count NA values per column using sapply()
sapply(netflix_titles, function(x) sum(is.na(x)))

#  Add column: title_length
netflix_titles <- netflix_titles %>%
  mutate(title_length = nchar(title))

# Longest title
netflix_titles %>%
  filter(title_length == max(title_length, na.rm = TRUE)) %>%
  select(title, title_length)

# Average title length by type
netflix_titles %>%
  group_by(type) %>%
  summarise(avg_title_length = mean(title_length, na.rm = TRUE))


