# QC-tips-and-tricks
 
QCing data might be tedious, but it shouldn't be difficult.

This is a small collection of code examples for QC'ing data using the dplyr and ggplot packages from R tidyverse. These are based on common methods used to QC data in SQL and relational databases. Most "tidy" datasets are, in fact, true sets in the sense of relational database theory. The requirement for a true set is that every record is unique. With the development of dplyr grammar, you can use several of these set operations to tame the most unruly of dataframes.

The main operations for QC'ing data have equivalents in SQL and R tidyverse. The following tidyverse and SQL functions are essentially the same: select(), distinct(), count(), group_by(), arrange() (ORDER BY in SQL), left_join() (LEFT OUTER JOIN in SQL). R also brings data visualizations to the table [sic], something SQL cannot do. For continuous data, for example, I really like to use ggplot histograms as well as the arrange() function to look at the tails of the data. 

# Example data - nycflights13 package

The rationale of this project is to take a familiar dataset, flights, from the nycflights13 package and introduce all kinds of horrible inconsistencies and errors into the data. That defines the problem domain. Then, the solutions will be to hunt down and locate those problems as quickly as possible. Again, the goal is to make QC'ing tedious, rather than chaotic, frustrating or difficult.

Note - this is currently a work-in-progress so please feel free to send questions, comments or code fixes to me as repo issues. Thanks for reading, Gareth (gareth_rowell@nps.gov)


    Outline of scripts

    1_glimpse_view_problem
    1_1_lay_of_the_land
    1_2_designs_and_intentions
    1_3_stray_commas
    1_4_wrong_datatypes
    1_5_additional_columns
    
    2_select
    2_1_one_big_set_many_small_sets
    2_2_natural_sets
    2_3_weird_variables 
    
    3_select_distinct
    3_1_categorical_errors
    3_2_typos
    3_3_more_weird_variables 
    
    4_select_arrange
    4_1_min_max_values
    4_2_testing_for_na's
    4_3_testing_for_NULLS
    4_4_continuous_tails
    
    5_group_by_count
    5_1_finding_duplicates 
    5_2_testing_uniqueness
    5_3_multivariable_uniqueness
    
    6_left_join_arrange
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


      





