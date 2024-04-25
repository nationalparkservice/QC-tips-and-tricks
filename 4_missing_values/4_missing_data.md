

# 4_missing_values


One of the most common problems in QC'ing data is dealing with missing values. 
Unlike SQL, missing values are not sorted to the top of the column using 
arrange(). They are interpreted as NA and are always sorted last whether using
arrange() ascending or descending. This can be confusing at first for SQL users. 

# 4_1_detecting_missing_values

In R tidyverse, the quickest way of dealing with missing values in data is
to simply filter them with the is.na() function. 
    
    library(tidyverse)
    library(nycflights13)

    df <- read_csv("./flights_missingvals.csv")

    glimpse(df)

    df |>
     filter(is.na(year))

    df |>
      filter(is.na(month))

The most common scenario is you want to find missing values across all columns
in your dataframe. Again, this can be confusing for SQL users, as there is no * 
wildcard for multiple columns. Instead, you use dedicated functions for "if any" 
and "everything"as follows:

    df |>
      filter(if_any(everything(), is.na))
      

# 4_2_what's_next

You are QC'ing your data and you find missing values. What's next? You need to 
consult the subject expert to determine how to proceed. Typically, you can just
flag missing values with NA in the actual data. But there may be other requirements.
For numeric values, the use of negative numbers like -9999 is quite common
and missing text values may need to be indicated by NULL values. Try to 
determine what are existing standard operating procedures, if any, by 
consulting with your subject expert. 
    
    
    