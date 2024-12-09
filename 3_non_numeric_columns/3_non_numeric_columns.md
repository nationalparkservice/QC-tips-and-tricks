

    3_non_numeric_columns
	3_1_identifying_non_numerics
    3_2_typos_and_other_character_errors
    3_3_using_lookup_tables
    3_4_date_time_errors



# 3_non_numeric_columns

What do we mean by non_numeric_columns? Here, I'm defining them as everything that's not an integer, float or complex number. I am deliberately leaving out composite data types such as lists, matrices and dictionaries. So, this section will deal with character, logical (Boolean), categorical and date times. This last group, date and times, does allow for arithmetic operations, but we will only treat the date-time type as character data with special formatting needs.

# 3_1_identifying_non_numerics

How do we identify non-numeric columns in the dataset? Unfortunately, the management of data types is very language dependent. However, as we saw in Section 1_2, there are some basic operations shared by R and Python. The methods to display and convert data types are similar, and both languages have float, integer and complex-number numeric data types. Complex numbers very rarely show up in datasets, so we only need to focus on columns that are *not* integer or float numerics. 

For R coding, move to the new directory using 

	setwd("../3_non_numeric_columns")
	getwd()

For Python, change your IPython shell to the new directory to "../3_non_numeric_columns".

In R tidyverse, as we saw in Section 1_2 earlier, you can quickly determine the data types using glimpse(),

	df <- read_csv("Electric_Vehicle_Population.csv")  
	glimpse(df)
	
and in Python, you would use

	df = pd.read_csv("Electric_Vehicle_Population.csv")
	df.dtypes
	
# 3_2_typos_and_other_character_errors

Typographical errors, upper and lower case irregularies, incorrect date-time formats and other text problems can often be located by creating unique lists. Case-sensitive errors and typos in text columns often jump out at you in a unique list. If there are a lot of unique values, for example species codes in a large lists of scientific names, you may also have the option of testing your data against look-up tables. In the following example, we will use the unique function to look at types and case-sensitive errors in two columns of the electric car dataset.

For R, 

	df <- read_csv("Electric_Vehicle_Population_typos.csv")  

	df |> distinct(Electric_Vehicle_Type)
	
and for Python
	
	df = pd.read_csv("Electric_Vehicle_Population_typos.csv")
	
	df["Electric_Vehicle_Type"].unique()


Here we can see that the Electric_Vehicle_Type value, "Battery Electric Vehicle (BEV)" also shows up as "Battery electric Vehicle (BEV)". Typically, this would be viewed as a case-sensitive error. The next operation reveals a typo in a column value.

For R,  

	df |> distinct(Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility)
	
and for Python
	
	df["Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility"].unique()
	
Here we see the "Eligibility unknown as battery range..." value shows up again with "Eligibility unknown as battry range..." where the misspelled word for "battery" is "battry". Its interesting that you can pick up a single letter misspelling from thousands of records in this manner.

# 3_3_using_lookup_tables

Sometimes, there are just too many categorical values to sort through by hand with a unique function. Lookup tables, when available, can be used to validate large numbers of categories. In this section, we will deal with the most simple case which is where one column of data is verified against a single primary key column in a look-up table. I will present more complex methods that can be used to validate combinations of values across multiple columns, which are really just an extension of the single column example I'll explain here. could be detected using a join function.

Suppose we have a known good look-up table which includes all models of cars in the electric car dataset. We can use an R tidyverse *anti-join* operation from that look-up table to the overall dataset using the Model column which is unique in the look-up table. Any mismatch between the Model column on the look-up table and the data table will be detected. 

In R, the anti-join operation works as follows,

    df <- read_csv("Electric_Vehicle_Population_badmodel.csv") 
	EV_LUT <- read_csv("EV_LUT.csv") 
 
	anti_join(df, EV_LUT, by = "Model")

The output detects a single record where the Tesla model is "Model 0".

In Python, there is no direct equivalent to the anti-join function. Instead, we can simply filter out the mismatched value using the Boolean condition method "is_in()" on the "Model" index. The overall concept is the same. We are filtering out records in the data that don't show up in the look-up table. 

Note - I have set the display option to include max_columns to make it easier to read the Model value in the IPython shell. The outcome is the same, the Tesla "Model 0".

	pd.set_option('display.max_columns', None)

	df = pd.read_csv("Electric_Vehicle_Population_badmodel.csv") 
	EV_LUT = pd.read_csv("EV_LUT.csv")
	
	df[~df['Model'].isin(EV_LUT['Model'])]



