
# 2_exploring_the_dataset

After you've successfully loaded your csv file and all the columns line up correctly, its time to start looking at the values under each column. Typically, you'll be dealing with a very large number columns and the QC process can seem overwhelming.  Flattened csv flat files might run up to 20 columns or more and it can sometimes be hard to figure out where to begin. In our flights dataset, there are 19 columns, so its a good example to work with.

# 2_1_one_big_set_many_small_sets

In QC'ing data, one big problem can be usually be reduced to many small problems. The common tool for data reduction is the select() function. Select allows you to pull together meaningful groups of data, which I call "natural groups". You can begin to find natural groups using select_all(). 


    library(tidyverse) 
    library(nycflights13)
    glimpse(flights)
    
    select_all(flights)

# 2_2_natural_groups

In the flights data, we can see three natural groups in the dataset: (1) the date/time columns, 2) the flight information and 3) additional information like tailnum and distance. Flight information can be further organized by arrivals, departures or as events data where each row represents a flight event. 

Let's start by selecting these groups.

Date/time information:

    flights |>
      select(year, month, day, hour, minute, time_hour)


Flight information - arrivals (Note that dep_time and arr_time columns are in units of HMM or HHMM.)

    flights |>
      select(flight, carrier, origin, arr_time, arr_delay)


Flight information - departures

    flights |>
      select(flight, carrier, dest, dep_time, dep_delay)
      
      
Flight information as events data

    flights |>
      select(year, month, day, hour, minute, flight, 
             carrier, tailnum, origin, dep_time, sched_dep_time, dep_delay, 
             dest, arr_time, sched_arr_time, arr_delay, air_time, distance) |>
      view()

      
Additional flight information - individual planes

    flights |> 
      select(carrier, tailnum)

      
The events data represents a "tidy" dataset. Its called tidy because each row is an observation and each column is a unique variable. In database parlance, this would also be considered a "fact" table because each row represents a unique independent 'fact' or observation. The select() variable list in this instance is almost as large as select_all(), but the columns are organized so related variables are adjacent to each other. 

# 2_3_weird_variables 

Qc'ing data is facilitated by reviewing the columns of data and their relationships to each other. But sometimes you run into columns that are just plain weird. They might be internal logger indexes, device or user internal identifiers, columns that contain the same values on every row, and columns that contain information that is redundant with other columns of data. The question is whether or not to omit these columns. The time_hour column in the flights dataset appears to be redundant with the other date time columns and might be a candidate for omission. Since the decision to omit data requires subject area expertise, its absolutely critical to consult with subject experts on decisions whether or not to include certain columns. In the flights data, time_hour looks like its redundant with the columns year, month, day, hour, all of which are in a tidier format and are ready for analysis. 




   
   



