
# 2_select

After you've successfully loaded your csv file and all the columns line up correctly, its time to start looking at the individual values within each column. Typically, you'll be dealing with many columns of data and the QC process can seem quite overwhelming.  Flattened csv flat files may often include 20 - 30 columns of data and its sometimes unclear where to start. In our flights dataset, there are 19 columns of data. Again, the approach needs to be systematic.

# 2_1_one_big_set_many_small_sets

As a general rule in computer programming, big complex problems can be reduced to many small problems. Data QCing is no exception. The common tool for data reduction is the select() function. You can begin by breaking down the dataset into natural groups using select(). Begin by looking at the dataset summary using glimpse() and select_all() which is the equivalent of the SQL SELECT(*) command.


    library(tidyverse) 
    library(nycflights13)
    glimpse(flights)
    
    select_all(flights)

# 2_2_natural_groups

One way to break a big dataset down into smaller datasets is to form natural groups with the data. In the flights data, we can see three natural groups that include (1) all the date/time measures, 2) the flight information, which we can view as arrivals, departures, or as flight events data and 3) additional information like tailnum and distance between destination and origin.

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
      
      
Flights as events data

    flights |>
      select(year, month, day, hour, minute, time_hour,
            flight, carrier, tailnum, origin, dep_time, dest, 
            arr_time, distance)
      
Additional flight information - individual planes

    flights |> 
      select(carrier, tailnum)

Additional flight information - flight distance

    flights |>
      select(origin, dest, distance)
      
      


# 2_3_weird_variables 





   
   



