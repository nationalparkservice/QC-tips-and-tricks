

	2_exploring_the_dataset
	2_1_one_big_set_many_small_sets



# 2_exploring_the_dataset

After you've successfully loaded your csv file and all the columns line up correctly, its time to start looking at the values under each column. Typically, you'll be dealing with a very large number columns and again, the QC process can seem overwhelming.  Published datasets are almost always flattened csv flat files that might run up to 20 columns or more and it can sometimes be hard to figure out where to begin. Note, you will need to move your R or Python session to the new folder.

For R coding, move to the new directory using 

	setwd("../2_exploring_the_dataset")
	getwd()

For Python, change your IPython shell to the new directory to "../2_exploring_the_dataset".


# 2_1_one_big_set_many_small_sets

A universal tactic for any kind of problem solving is to reduce "one big problem" into many small problems. In data management, the common tool for data reduction is the select() command. Select() allows you to pull together meaningful columns of data. Begin by looking at all the columns and then pick individual columns that form a meaningful group. For example, we can look at all the columns of electric car data, then choose those columns which describe the make, model and year of the vehicle. This meaningful group can then be displayed along side less obvious columns.

In R, use the following code,

	df <- read_csv("Electric_Vehicle_Population.csv")  
	df |> select_all()

	df |> select(Make, Model, Model_Year)
	

	
 and for Python, run the following code

	df = pd.read_csv("Electric_Vehicle_Population.csv")
	df.columns
	
	df[["Make", "Model", "Model_Year"]]



# 2_2_meaningful_groups

In the electric cars data, we can use the make, model and year to explore everything else. Here are some examples.

Location information:

In R,

	df |> 
      select(Make, Model, Model_Year, County, City, State, Postal_Code)
	  
In Python,

	df[["Make", "Model", "Model_Year", 
	    "County", "City", "State", "Postal_Code"]]


Additional vehicle information:

In R,

	df |> 
      select(Make, Model, Model_Year, Electric_Vehicle_Type,
        Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility, 
	    Electric_Range, Base_MSRP)
		
In Python,

    df[["Make", "Model", "Model_Year", "Electric_Vehicle_Type",
        "Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility", 
	    "Electric_Range", "Base_MSRP"]]
		
    
Geopolitical and infrastructure:

In R,

	df |> 
      select(Make, Model, Model_Year, Legislative_District, Electric_Utility)

In Python,

    df[["Make", "Model", "Model_Year", "Legislative_District", "Electric_Utility"]]



# 2_3_weird_variables 

Qc'ing data is facilitated by reviewing the columns of data and their relationships with each other. But sometimes you run into columns that are just plain weird. They might be internal logger indexes, device or user internal identifiers, columns that contain the repeated values on every row, and columns that contain information that is redundant with other columns of data. 

The question is whether or not to omit these columns. All the columns in the Electric Vehicle dataset are pretty self-explanatory. The only column we haven't looked at is Vehicle_ID.  Its quite likely that a column with "ID" in the name is an index or key column. Later on, we will test to see whether Vehicle_ID is a unique "no-null" column, in which it could be used to join to other tables. 



   
   



