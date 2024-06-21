

# 5_group_by_and_uniqueness

There are many situations where you may need to test for uniqueness. For example, species codes need to be unique in order to match one-for-one with scientific names, vegetation cover class codes will need to be unique to link cover class parameters to be displayed with field data, and locality codes must be unique to represent addresses or geographic coordinates of specific locations. In database parlance, these unique columns in the look-up tables are referred to as *primary keys*. Their purpose is to ensure that lookup tables can be joined one-to-many with data tables. In the next section, we'll see warning codes that are thrown when the one-to-many join fails due to duplicate values in the primary key column.

# 5_1_uniqueness_errors

When a value shows up more than once in the primary key column, R attempts to interpret the relationship as many-to-many. This is an error condition because almost always you need a one-to-many relationship between a lookup table and the data associated in your observations table.

What does the error condition look like? In the code below, I am attempting to join the airports lookup table to flight data from the nycflights13 package. This version of airports has been modified to contain two sets of duplicate faa keys. First, lets see the error message.

        
    library(tidyverse)
    library(nycflights13)
        
    dup_airports <- read_csv("./dup_airports.csv")
    
    good_join <- airports |>
      inner_join(flights, by = c("faa" = "dest"))
      
    bad_join <- dup_airports |>
      inner_join(flights, by = c("faa" = "dest"))
    #>Warning message:
    #>In inner_join(dup_airports, flights, by = c(faa = "dest")) :
    #> Detected an unexpected many-to-many relationship between `x` and `y`.
    #> ℹ Row 88 of `x` matches multiple rows in `y`.
    #> ℹ Row 499 of `y` matches multiple rows in `x`.
    #> ℹ If a many-to-many relationship is expected, set `relationship =
    #>  "many-to-many"` to silence this warning.
    
    
# 5_1_finding_duplicates 

In the 'bad_join' example above, the warning message indicates that there is an unexpected many-to-many relationship between 'x' and 'y'. We can quickly test for the duplicate values in the primary key column as follows:

    dup_airports |> 
      group_by(faa) |>
      count() |>
      arrange(desc(n))
  
    #># A tibble: 1,456 × 2
    #> # Groups:   faa [1,456]
    #> faa         n
    #> <chr>    <int>
    #> 1 MCI       2
    #> 2 ORD       2
    #> 3 04G       1
    #> 4 06A       1
    #> 5 06C       1
    #> 6 06N       1
    #> 7 09J       1
    #> 8 0A9       1
    #> 9 0G6       1
    #>10 0G7       1
    #># ℹ 1,446 more rows
    #># ℹ Use `print(n = ...)` to see more rows

The duplicates are pushed to the top of the list by sorting the faa counts using the arrange descending function. 
    
# 5_2_testing_uniqueness

Primary key columns can be tested for uniqueness using the same code as above. The result should always indicate counts of 1. Any values greater than 1 indicate additional occurrences of a value in the column. Here is the correct primary key in the original 'airport' table. 

    airports |> 
      group_by(faa) |>
      count() |>
      arrange(desc(n))
    #># A tibble: 1,458 × 2
    #># Groups:   faa [1,458]
    #>   faa       n
    #>   <chr> <int>
    #> 1 04G       1
    #> 2 06A       1
    #> 3 06C       1
    #> 4 06N       1
    #> 5 09J       1
    #> 6 0A9       1
    #> 7 0G6       1
    #> 8 0G7       1
    #> 9 0P2       1
    #>10 0S9       1
    #># ℹ 1,448 more rows
    #># ℹ Use `print(n = ...)` to see more rows

# 5_3_multivariable_uniqueness

When you work with lots of data, you will run into tables that need to be related to one another and there are no tidy keys to use for your join functions. Almost always, you will need to combine data columns together to create your own keys. In order to do this, you will need to use *composite primary keys*. Composite keys are simply keys that include two or more columns which form a unique combined value. We'll work through this process in Section 6 to see how the weather data can be related to flights so that a data analyst could look at weather effects on flights. The first step is to create a composite primary key in the weather table. Looking at the weather data, we can see a natural grouping of year, month, day and hour. The weather data is reported hourly so the composite key containing year, month, day and hour will be serve nicely as a unique composite key for weather. Once those columns are combined, we can pull weather data for any hour of any day in the table. Interestingly, these columns have been aggregated for us in the column time-hour. 


glimpse(flights)
glimpse(weather)