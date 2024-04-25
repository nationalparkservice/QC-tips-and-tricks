

library(tidyverse)
library(nycflights13)

df <- read_csv("./flights_missingvals.csv")

glimpse(df)

df |>
  filter(is.na(year))

df |>
  filter(is.na(month))




df |>
  filter(if_any(everything(), is.na))



