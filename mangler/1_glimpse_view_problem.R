
# 1_2_design_and_intentions

library(tidyverse)
library(nycflights13)
setwd("./mangler")

flights1 <- flights |>
  filter(month == 1 & day == 1)

flights1

write_csv(flights1, "flights_day1.csv")

