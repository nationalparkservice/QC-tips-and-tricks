

# 5_unique_columns_in_lookup_tables

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

# 5_3_multivariable_uniqueness