# 1_glimpse_view_problem

Getting started: In all these examples, I will assume you are using tidyverse and RStudio. The view() utility in RStudio can be replaced with the print() function combined with arrange() if you are not using RStudio. 

I will be using the terms "columns" and "rows" for all data description. In QC'ing data, we can sometimes get by without knowing about variables, observations, or the correctness of the data from an analytic perspective. Data analysis, in the strict sense, is interpretation of the meaning of the data values. This requires subject expertise in the study domain of the data. In those instances where subject expertise is required, I will indicate that you need to consult a subject expert. This frequently happens during the QC process. In other instances, we will only be looking for common anomalies caused by problems in data handling, data loggers, database export functions and simple errors introduced by data editing.

# 1_1_lay_of_the_land

Its good to get started just by looking at the data. The view() function lets you look at all the data. The view() function is especially nice because you can click on each column name and it will alternately sort ascending or descending. This is a quick way to look at the tails of each column. Below is the flights dataset without any modifications.

    library(tidyverse) 
    library(nycflights13)
    
    view(flights)
    
The glimpse() function lets you look at the design of the dataset plus the first few records of each column plus the datatypes (modes in R parlance). Its critical to check the datatypes before going any further in the QC process. Below is the design of flights data without any modifications.   
    
    glimpse(flights)
    
# 1_2_designs_and_intentions

This section almost always requires consultation with the subject expert. Run glimpse() on your dataframe. Almost always, there are obvious things that will need your attention. Dates and times will often get imported as character data, while integer data will default to double. So its really important to understand the expectations of your experts and scientists. You will also need help with issues of precision, for example, with physical measurements or with temporal and spatial data. 

In the following code, let's look at the datatypes associated with the flights dataset

    library(tidyverse)
    library(nycflights13)
    
    glimpse(flights)

In the next code, we are loading a csv file containing the first 1 day of the flights data. We are using day 1 just to keep the csv file small. Notice the default datatypes resulting from loading csv files...
    
    setwd("~")
    setwd("../.")
    setwd("./QC-tips-and-tricks/1_glimpse_and_view")
    flights1 <- read_csv("./flights_day1.csv")
    
    glimpse(flights1)

From the flight1 file, you can see that R defaults to dbl for numeric data and chr for character data. Comparing that with the original flights dataframe, we can see the import defaults in flight1 clearly do not meet the intentions of the analyst. 

# 1_3_stray_commas

When you load csv files, you are using commas to parse the columns of your data. Any other commas, for example, those embedded in a comments column, will break the parsing process. Extra columns will create extra columns. This can typically be tracked using the problems() function. In the following example, I have introduced three stray commas into the dataset. Lets see if we can find them.


    flights2 <- read_csv("./flights_day1_stray_commas.csv")
    problems(flights2)

The output from this gives...

    # A tibble: 3 × 5
        row   col expected   actual     file                                
      <int> <int> <chr>      <chr>      <chr>                               
    1   100    20 19 columns 20 columns C:/Users/GRowell/QC-tips-and-tricks…
    2   200    20 19 columns 20 columns C:/Users/GRowell/QC-tips-and-tricks…
    3   300    20 19 columns 20 columns C:/Users/GRowell/QC-tips-and-tricks…
    > 
  
 We can see an additional comma in each of the identified rows. The fastest way to resolve stray commans is to load the csv file into a spreadsheet such as Excel, and go directly to the row number(s) indicated by the problems() function. Excel will help you identify which columns affected by the stray commas.
