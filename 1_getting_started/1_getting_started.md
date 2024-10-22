
    1_getting_started
    1_1_lay_of_the_land
    1_2_designs_and_intentions
    1_3_stray_commas
    1_4_additional_columns
	
	
# 1_getting_started

QC'ing data can seem overwhelming at first. So, its important to be systematic in your approach from the outset. Assuming you have no familiarity what-so-ever with the dataset, the place to start is simply by exploring the columns and rows of data.  I will be using the terms "columns", "rows" and "dataframes" for all dataset descriptions. 

In the QC-phase of data publication, we won't typically interpret that data or its success in meeting project objectives. Those tasks should be accomplished by the data analyst and project leads earlier in the workflow. Instead, we are focusing on the correctness of the data in the same sense that a proof-reader would focus on misspelling, format layout and appearence in the final evaluation of an article prior to its release for publication. Again, the content review is the role of data analysts, project leads and their staff, and it needs be completed in advance of the QC process. In those instances where subject expertise is required, I will indicate that you need to consult with a subject-area expert. In most instances, we are only looking for common anomalies caused by data handling, data loggers, database export functions and simple errors introduced during data editing.

In the examples that follow, you will need to load certain libraries for all your scripts. For R, you will need dplyr and ggplot or you can simply load the tidyverse platform which is what I will do here, and for Python, you will need pandas, matplotlib and the IPython platform. There are excellent instructions for setting up your development environment for R in the online book, https://r4ds.hadley.nz/ and for Python, https://wesmckinney.com/book/. If you plan on making a career out of data management, please consider supporting the authors by buying their books. 

As you write your scripts, be sure to include the following header code. For R, its

	library(tidyverse)

and for Python, 

	import os
	import pandas as pd
	import matplotlib.pyplot as plt


# 1_1_lay_of_the_land

Its good to get started just by looking at the data. Both R and Python provide methods for quickly viewing the dataset. 

For R, use 

	setwd("C:/Users/Growell/QC-tips-and-tricks/1_getting_started")
	getwd()
	
	df <- read_csv("Electric_Vehicle_Population.csv")
	df
	
	head(df)
	tail(df)
	
	view(df)
	
	

For Python, use
	
	os.chdir("c:\\Users\\growell\\QC-tips-and-tricks\\1_getting_started")
	print(os.getcwd())
		
	df = pd.read_csv("Electric_Vehicle_Population.csv")
	df	
		
	df.head()
	df.tail()
		
	pd.set_option('display.max_rows', None)
	pd.set_option('display.max_columns', None)
		
	print(df)
		

When working with large dataframes in the IPython console, it may be impractical to display all rows, in which case you can simply display the first and last 100 or so rows as follows

	df.head(100)
	df.tail(100)
	

    
# 1_2_designs_and_intentions

Following your initial inspection of the data, you will need to verify, and in some instances coerce data types so they correctly represent the data. For example, the R interpreter will load any numeric field as double by default, while the Python interpreter will load all numerical data as integer unless it sees a decimal point in the number. In these cases, you can manually coerce the data columns to the correct data type. 

In R, we can display the data types and coerce the double columns to integer as follows

	glimpse(df)

	df <- df |>
	  mutate(Vehicle_ID = as.integer(Vehicle_ID))


In Python, you can use the dtypes method and coerce integer columns to float as follows

	print(df.dtypes)
	
	df['Electric_Range'] = df['Electric_Range'].astype(float)
	


# 1_3_stray_commas

When you load csv files, you are using commas to parse the columns of your data. Any stray commas, for example, those embedded in a comments column, will break the parsing process. Extra commas will typically create extra columns. This can be tracked using the problems() function. In the following example, I have introduced three stray commas into the dataset. Lets see if we can find them.

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





# 1_4_additional_columns

More generally, Its possible for extra columns to be generated by other processes in addition to embedded commas. You may accidentally generate extra columns while exporting data from a database. Any extraneous column names or mismatch between column names and data may cause this. Similarly, additional columns may be generated while editing and modifying csv files in Excel. If the problems() function flags anything following the read_csv() step, extra columns and misaligned column names are often the cause. Its good to look over all your data once its migrated to csv format. 













