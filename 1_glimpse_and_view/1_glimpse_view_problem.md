# 1_glimpse_view_problem

Getting started... for all these examples, I'll assume you are using tidyverse and RStudio. The view() utility in RStudio can be replaced with the print() function combined with arrange() if you are not using RStudio.

# 1_1_lay_of_the_land

Its good to get started just by looking at the data. The view() function lets you look at the data. The glimpse() function lets you look at the first few records plus the datatypes (modes in R parlance). Its critical to check the datatypes before going any further. Below is the flights data without any modifications.

    library(tidyverse)
    library(nycflights13)
    
    view(flights)
    
The glimpse() function lets you look at the first few records plus the datatypes (modes in R parlance). Its critical to check the datatypes before going any further. Below is the flights data without any modifications.   
    
    
    glimpse(flights)
    
