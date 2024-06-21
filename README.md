# QC-tips-and-tricks

This is a small collection of code examples for QC'ing data using the dplyr and ggplot packages from R tidyverse. These are based on common methods used to QC data in SQL and relational databases. Most "tidy" datasets are, in fact, true sets in the sense of relational database theory. The requirement for a true set is that every record is unique. With the development of dplyr grammar, you can use several of these set operations to tame the most unruly dataframes.

The main operations for QC'ing data have equivalents in SQL and R tidyverse. The following tidyverse and SQL functions are essentially the same: select(), distinct(), count(), group_by(), arrange() (ORDER BY in SQL), left_join() (LEFT OUTER JOIN in SQL). R also brings data visualizations to the table [sic], something SQL cannot do. For continuous data, for example, ggplot histograms work well with the arrange() function to look at the tails of the data. 

# Example data - nycflights13 package

The rationale of this project is to take a familiar dataset, flights, from the nycflights13 package and introduce all kinds of horrible inconsistencies and errors into the data. That defines the problem domain. The solutions will be to hunt down and locate those problems as quickly and efficiently as possible. The goal is to make QC'ing systematic and tedious, rather than chaotic, frustrating or difficult.

# How to use these scripts

If you are familiar with Git and GitHub, you can simply clone this repository. If you are new to GitHub, go to the Code button at the top of this page and select download ZIP. The ZIP file will contain everything. 
 
Note - this is currently a work-in-progress so please feel free to send questions, comments or code fixes to me as repo issues. Thanks for reading, Gareth (gareth_rowell@nps.gov).


    Outline of scripts

    1_getting_started
    1_1_lay_of_the_land
    1_2_designs_and_intentions
    1_3_stray_commas
    1_4_additional_columns
  
    2_2_exploring_the_dataset
    2_1_one_big_set_many_small_sets
    2_2_natural_sets
    2_3_weird_variables 
    
    3_non_numeric_columns
    3_1_typos_and_categorical_errors
    3_2_Using_left_joins 
    3_3_distinct_and_dates
    
    4_missing_values
    4_1_detecting_missing_values
    4_2_whats_next
    
    5_lookups_and_uniqueness
    5_1_finding_duplicates 
    5_2_testing_uniqueness
    5_3_multivariable_uniqueness
    
    6_many_to_many
    6_1_good_lookups
    6_2_primary_key_tests
    6_3_foreign_key_tests
    6_4_left_vs_inner_joins
    6_5_many_to_many_errors
    
    7_histograms_arrange
    7_1_continuous_variables
    7_2_examine_tails
    7_3_arrange_and_tails
    7_4_associated_variables


      





