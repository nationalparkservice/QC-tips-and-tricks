

    3_non_numeric_columns
	3_1_identifying_non_numerics
    3_2_typos
    3_3_categorical_errors
    3_4_date_errors




# 3_non_numeric_columns

What do we mean by non_numeric_columns? Here I'm defining them as everything that's not an integer, float or complex number numeric. I am deliberately leaving out composite data types such as lists, matrices and dictionaries. So, this section will deal with character, logical (Boolean), categorical and date times. This last group, date and times, does allow arithmetic operations, but we will only treat it as character data with special formatting needs.

# 3_1_typos_and_other_character_errors

How do we identify non-numeric columns in the dataset? Unfortunately, the management of data types is very language dependent. However, there are some basic operations shared by R and Python. The methods to display and convert data types are similar, and both languages have float, integer and complex-number numeric data types. Complex numbers very rarely come up in datasets, so we only need to focus on columns that are *not* integer or float numerics. 

For R coding, move to the new directory using 

	setwd("../3_non_numeric_columns")
	getwd()

For Python, change your IPython shell to the new directory to "../3_non_numeric_columns".

In R tidyverse, you can quickly determine the data types using glimpse(),

	df <- read_csv("Electric_Vehicle_Population.csv")  
	glimpse(df)
	
In Python, you would use

	df = pd.read_csv("Electric_Vehicle_Population.csv")
	df.dtypes
	

Combining select and distinct is a quick way to tame non-numeric columns. Case-sensitive errors and typos in text columns often jump out at you in a unique list. If there are a lot of unique values, for example species codes in a large lists of scientific names, you may also have the option of testing your data against look-up tables. Typographical errors, upper and lower case irregularies, incorrect date-time formats and other text problems can often be located by creating unique lists. For this example,We'll see  how to validate data with a look-up table using left_join() below. I will address that in the next section. 




Typographical errors, upper and lower case irregularies, incorrect date-time formats and other text problems can often be located by creating unique lists. For this example, 





QC'ing categorical errors usually requires creating a unique list. The airlinea
carrier codes are displayed as a unique list in code below.

    
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

      
Next, I have introduced a single typo 'UAA' in the dataset. Try to locate the error.

    
    #setwd("./3_select_distinct_left_join")
    
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
    
Because the typo above included an additional letter, the error 'UAA' on record 12, was easy to spot. But what if the carrier code had been two characters like all the rest or if we didn't know the correct codes for carriers? We could have a subject expert verify them for us or, if a look-up table is available, we could test to see if all the values in our list match up correctly with the codes in the look-up table. In the following code, I'm testing the unique carrier list against the airlines look-up table. Note that the left join flags the typo with an 'NA'. 

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
    

If the method above is unclear to you, try breaking the process down into individual steps. Create the left and right tables. Then run then left_join() function from the left table on the right table using the carrier column. Since its a left join, we will use *all* the left values and only the right values that match. Since 'UAA' occurs in the left table, it is displayed in the left column, but it doesn't have a corresponding value in the right table, hence the 'NA'. I'll show the steps here.

    left_table <- flights_bad |>
      distinct(carrier) 
  
    right_table <- airlines
    
    left_table |>
      left_join(right_table, by = 'carrier')



# 3_3_distinct_and_dates

Large numbers of dates and times can usually be validated using ggplot histograms (see section 7). But sometimes its also possible to catch date/time errors using distinct().

    flights |> 
      distinct(year)
    
    flights |>
      distinct(month)
    
    flights |>
      distinct(day) |>
      print(n = 31)

Distinct won't tell you much about the distribution of values, but irregular values can often pop up this way, so its always good to check.


  
