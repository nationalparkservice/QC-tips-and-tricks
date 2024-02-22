# 1_glimpse_view_problem

# 1_getting_started

In all these code examples, I will assume you are using the R tidyverse package and RStudio. The view() utility in RStudio can be replaced with the print() function combined with arrange() if you are not using RStudio. 

I will be using the terms "columns" and "rows" for all data description. In QC'ing data, we can often get by without knowing about variables, observations, or the correctness of the data from an analytic perspective. Data analysis, in the strict sense, is *the interpretation of the meaning of data values*. This requires subject expertise in the study domain of the data. In those instances where subject expertise is required, I will indicate that you need to consult a subject expert. In many instances, we only need to look for common anomalies caused by data handling, data loggers, database export functions and simple errors introduced during data editing.

# 1_2_lay_of_the_land

Its good to get started just by looking at the data from a high level. The view() function lets you look at all the data. The view() function is especially nice because you can click on each column name and it will alternately sort ascending or descending. This is a quick way to look at the tails of each column. Below is the flights dataset without any modifications.

    library(tidyverse) 
    library(nycflights13)
    
    view(flights)
    
The glimpse() function lets you look at the design of the dataset. It provides the first few records of each column plus the datatypes (variable modes in R parlance). So, just with view() and glimpse(), you can see all your data and get a notion of the design of the dataset. 
    
    glimpse(flights)
    

    
# 1_3_designs_and_intentions

This section almost always requires consultation with the subject expert. Run glimpse() on your dataframe. There will be obvious issues. For example, dates and times might be imported as character data, while integer data will default to double. From the outset, its important to understand the goals of your experts and scientists. They will help you understand what you are dealing with. Also, you will almost always need help with issues of precision, for example, with the number of significant figures to be maintained for physical measurements or with temporal and geo-spatial data. Bringing in the subject expert early in the process can prevent a lot of heartache later.

In the following code, let's look at the datatypes associated with the flights dataset

    library(tidyverse)
    library(nycflights13)
    
    glimpse(flights)

In the next code, we are loading a csv file containing the first day of the flights data. We are using day 1 just to keep the csv file small. Notice the default datatypes resulting from loading csv files...
    
    setwd("./QC-tips-and-tricks/1_glimpse_and_view")
    flights1 <- read_csv("./flights_day1.csv")
    
    glimpse(flights1)

From the flight1 file, you can see that R defaults to dbl for numeric data and chr for character data. Comparing that with the original flights dataframe, we can see the import defaults clearly don't match the original flights dataset.

# 1_4_stray_commas

When you load csv files, you are using commas to parse the columns of your data. Any other commas, for example, those embedded in a comments column, will break the parsing process. Extra commas will typically create extra columns. This can be tracked using the problems() function. In the following example, I have introduced three stray commas into the dataset. Lets see if we can find them.

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
  
There is an extra column in each row indicated by problems(). The fastest way to resolve stray commas is to load the csv file into a spreadsheet such as Excel and go directly to the row number(s) indicated by the problems() function. You will be able to identify which columns are affected by the stray commas.
