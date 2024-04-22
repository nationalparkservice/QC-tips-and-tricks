
# 3_select_distinct_inner_join

Combining select and distinct is a quick way to tame non-numeric fields. Any categorical errors or typos in text variables usually shows up in a unique list of values. You need to be familiar with your data to do this. If you aren't, a subject expert can often validate the list for you. If there are a lot of values, for example species codes in a large lists of scientific names, you may also have the option of testing your data against look-up tables. I describe how to do this with distinct and left_join.



# 3_1_typos_and_categorical_errors

QC'ing categorical errors usually requires creating a unique list. In the example below, I'm looking for errors in the airline carrier codes in the flights dataset. I am using just the first day of data to keep the csv files small. The methods will work just the same on very large datasets. 
    
    library(tidyverse)
    library(nycflights13)

    flights1 <- read_csv("./flights_day1.csv")

    flights1 |>
      distinct(carrier)
    #># A tibble: 14 × 1
    #> carrier
    #>  <chr>  
    #>  1 UA     
    #>  2 AA     
    #>  3 B6     
    #>  4 DL     
    #>  5 EV     
    #>  6 MQ     
    #>  7 US     
    #>  8 WN     
    #>  9 VX     
    #> 10 FL     
    #> 11 AS     
    #> 12 9E     
    #> 13 F9     
    #> 14 HA     

      
Next, I have introduced a single typo 'UAA' in the dataset. See if you can see it.

    
    #setwd("./QC-tips-and-tricks/3_select_and_distinct")
    
    flights_bad <- read_csv("./flights_bad_carrier.csv")
    
    flights_bad |>
      distinct(carrier)   
    #> # A tibble: 15 × 1
    #>    carrier
    #>    <chr>  
    #>  1 UA     
    #>  2 AA     
    #>  3 B6     
    #>  4 DL     
    #>  5 EV     
    #>  6 MQ     
    #>  7 US     
    #>  8 WN     
    #>  9 VX     
    #> 10 FL     
    #> 11 AS     
    #> 12 UAA    
    #> 13 9E     
    #> 14 F9     
    #> 15 HA     

# 3_2_Using_left_joins    
    
Because the typo included an additional letter, the error,'UAA' on record 12, was easy to spot. But what if carrier code had been two characters like all the rest or if we didn't know the correct codes for carriers? We could have a subject expert verify them for us or if a look-up table is available, we could test to see if all the values in our list show up correctly in the look-up table. In the following code, I'm testing the unique carrier list against the airlines look-up table. Note that the inner join flags the typo with an 'NA'. 

    flights_bad |>
      distinct(carrier) |>
      left_join(airlines)
    #> Joining with `by = join_by(carrier)`
    #> # A tibble: 15 × 2
    #>    carrier name                       
    #>    <chr>   <chr>                      
    #>  1 UA      United Air Lines Inc.      
    #>  2 AA      American Airlines Inc.     
    #>  3 B6      JetBlue Airways            
    #>  4 DL      Delta Air Lines Inc.       
    #>  5 EV      ExpressJet Airlines Inc.   
    #>  6 MQ      Envoy Air                  
    #>  7 US      US Airways Inc.            
    #>  8 WN      Southwest Airlines Co.     
    #>  9 VX      Virgin America             
    #> 10 FL      AirTran Airways Corporation
    #> 11 AS      Alaska Airlines Inc.       
    #> 12 UAA     NA                         
    #> 13 9E      Endeavor Air Inc.          
    #> 14 F9      Frontier Airlines Inc.     
    #> 15 HA      Hawaiian Airlines Inc.   
    

If the method for using left_joins is unclear to you, try breaking the process down into discrete steps. Create the left and right tables. Then run then left_join() function from the left table to the right table using the carrier column. Since its a left join, we will use *all* of the left values and only the right values that match. Since 'UAA' occurs in the left table, it is displayed in the join, but it has not values in the right table to match it, hence the 'NA'. I'll show the steps here.

    left_table <- flights_bad |>
      distinct(carrier) 
  
    right_table <- airlines
    
    left_table |>
      left_join(right_table, carrier)



# 3_3_distinct_and_dates

Large numbers of dates and times should be validated using ggplot histograms. But sometimes its also possible to catch date/time errors using distinct().

    flights |> 
      distinct(year)
    
    flights |>
      distinct(month)
    
    flights |>
      distinct(day) |>
      print(n = 31)

Distinct won't tell you much about the distribution of values in each date variable, but major typos can often pop up this way, so its always good to check.


  