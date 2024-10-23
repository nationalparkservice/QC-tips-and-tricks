

library(tidyverse)

setwd("C:/Users/Growell/QC-tips-and-tricks/1_getting_started")
getwd()
	
df <- read_csv("Electric_Vehicle_Population.csv")
df
	
head(df)
tail(df)
	
view(df)
	
glimpse(df)

df <- df |>
    mutate(Vehicle_ID = as.integer(Vehicle_ID))

df <- read_csv("Electric_Vehicle_Population_commas.csv")
problems(df)
	
df <- read_csv("Electric_Vehicle_Population_extra_column.csv")
	
	