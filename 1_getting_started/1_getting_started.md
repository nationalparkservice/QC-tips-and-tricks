
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
	
	glimpse(df)
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
	


	
	
	
	

	
	
		



Typically, we want to see more than just the heads and tails of the dataframe, and we want to expose all of the columns


	



    


    
# 1_2_designs_and_intentions

This section almost always requires consultation with the subject expert. Run glimpse() on your dataframe. There will be obvious issues. For example, dates and times might be imported as character data, while integer data will default to double. From the outset, its important to understand the goals of your experts and scientists. They will help you understand what you are dealing with. Also, you will almost always need help with issues of precision, for example, with the number of significant figures to be maintained for physical measurements or with the precision of temporal and geo-spatial data. Bringing in the subject expert early in the process can prevent a lot of confusion later on.

In the following code, let's look at the datatypes associated with the flights dataset

    library(tidyverse)
    library(nycflights13)
    
    glimpse(flights)

In the next code, we are loading a csv file containing the first day of the flights data. We are using day 1 just to keep the csv file small. Notice the default datatypes resulting from loading csv files...
    
    setwd("./QC-tips-and-tricks/1_glimpse_and_view")
    flights1 <- read_csv("./flights_day1.csv")
    
    glimpse(flights1)

From the flight1 file, you can see that R defaults to dbl for numeric data and chr for character data. Comparing that with the original flights dataframe, we can see the import defaults clearly don't match the original flights dataset.

# 1_3_stray_commas

When you load csv files, you are using commas to parse the columns of your data. Any other commas, for example, those embedded in a comments column, will break the parsing process. Extra commas will typically create extra columns. This can be tracked using the problems() function. In the following example, I have introduced three stray commas into the dataset. Lets see if we can find them.

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

Its possible for extra columns to be generated by other processes in addition to embedded commas. You may accidentally generate extra columns while exporting data from a database. Any extraneous column names or mismatch between column names and data may cause this. Similarly, additional columns may be generated while editing and modifying csv files in Excel. If the problems() function flags anything following the read_csv() step, extra columns and misaligned column names are often the cause. Its good to look over all your data once its migrated to csv format. 













