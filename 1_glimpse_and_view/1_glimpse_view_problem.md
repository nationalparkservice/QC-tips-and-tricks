# 1_glimpse_view_problem

Getting started... in all these examples, I'll assume you are using tidyverse and RStudio. I will be using the terms "columns" and "rows" for all data description. In QC'ing data, we won't be interested in variables, observations, or the correctness of the data from an analysis perspective. Data analysis, in the strict sense, is interpretation of the meaning of the data values. This requires subject expertise in the study domain of the data. It is not necessary to have this expertise while QC'ing data. We will, instead, be looking for common anomalies typically caused by problems in data management.

The view() utility in RStudio can be replaced with the print() function combined with arrange() if you are not using RStudio. 

# 1_1_lay_of_the_land

Its good to get started just by looking at the data. The view() function lets you look at the data. The view() function is especially nice because you can click on each column name and it will alternately sort ascending or descending. This is a quick way to look at the tails of each column. Below is the flights data without any modifications.

    library(tidyverse) 
    library(nycflights13)
    
    view(flights)
    
The glimpse() function lets you look at the first few records of each column plus the datatypes (modes in R parlance). Its critical to check the datatypes before going any further. Below is the flights data without any modifications.   
    
    glimpse(flights)
    

    
