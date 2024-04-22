
# 3_select_distinct_inner_join

Combining select and distinct is a quick way to tame non-numeric fields. Any categorical errors or typos in text variables will usually show up in a unique list of values. Sometimes, distinct can be used to detect irregularities in integer values as well, especially if they codes, symbols or dates rather than continuous numeric values. 

# 3_1_typos_and_categorical_errors

QC'ing categorical errors usually requires creating a unique list. We will select a group of related variables and look for categorical errors. Again, we are using day 1 just to keep the csv file small.
    
    library(tidyverse)

    flights1 <- read_csv("./flights_day1.csv")
    
    flights1 |>
      select(carrier, origin, dest, tailnum)

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

      
Next, we will introduce a single typo 'UAA' leading to an extra character in one of the carrier code identifers. 

    
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
    
    
Because the typo led to an additional letter, 'UAA' on record 12, it was easy to spot. But what if carrier code had been two characters or if we didn't know the correct codes for each variable. We could have a subject expert verify them for us or if a look-up table is available, we could test to see if each value in our unique list shows up correctly in the look-up table. In the following code, we test the unique flights list against the airlines look-up table. The inner join flags the typo with an 'NA'. 

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
    


      
