
# 2_select

After you've successfully loaded your csv file and all the columns line up correctly, its time to start looking at the values under each column. Typically, you'll be dealing with a very large number columns and the QC process can seem overwhelming.  Flattened csv flat files might run up to 20 to 30 or more columns and its be hard to figure out where to start. In our flights dataset, there are 19 columns. Again, the approach needs to be systematic.

# 2_1_one_big_set_many_small_sets

In Qc'ing data, one big problem can be usually be reduced to many small problems. The common tool for data reduction is the select() function. Select allows you to pull together meaningful groups of data, that I've called "natural groups". Begin by looking at all of the columns. 


    library(tidyverse) 
    library(nycflights13)
    glimpse(flights)
    
    select_all(flights)

# 2_2_natural_groups

In the flights data, we can see three natural groups in the dataset: (1) the date/time columns, 2) the flight information and 3) additional information like tailnum and distance. Flight information can be further organized by arrivals, departures or as complete events data for each flight.

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
      
      
Flight information as a tidy dataset

    flights |>
      select(year, month, day, hour, minute, flight, 
             carrier, tailnum, origin, dep_time, dep_delay, 
             dest, arr_time, arr_delay, distance)

      
Additional flight information - individual planes

    flights |> 
      select(carrier, tailnum)

Additional flight information - flight distance

    flights |>
      select(origin, dest, distance)
      


# 2_3_weird_variables 





   
   



