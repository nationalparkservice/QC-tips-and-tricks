# QC-tips-and-tricks
 
QCing data is tedious, but it shouldn't be difficult.

This is a small collection of *very* simple techniques for QC'ing data using the dplyr and ggplot packages from R tidyverse. These are based on common methods used to tame big datasets in SQL and relational databases. Most "tidy" datasets are, in fact, true sets in the sense of relational data theory. The requirement for a true set is that every record is unique. Set operations are the basis of SQL and relational databases. With the development of dplyr grammar, you can use several of these set operations to quickly tame virtually any dataframe.

The main operations for QC'ing data have equivalents in SQL and R tidyverse. The following tidyverse and SQL functions are essentially the same: select(), distinct(), count(), group_by(), arrange() (ORDER BY in SQL), left_join() (LEFT OUTER JOIN in SQL). These operations and getting in the habit of looking at the design of your data using glimpse() and the actual values using view(), will give you what you need to sort out the roughest datasets.

Finally, R brings data visualizations to the table [sic], something SQL cannot do. For continuous data, I like to use ggplot histograms as well as arrange() ascending and descending order to look at the tails of the data. As a statistician, you would obviously use min() and max(), but for the data manager, that's a slippery slope into the world of statistics, probability and stochastic lifestyles, something to be avoided at all costs. 

# Working example - nycflights13 package

The rationale of this project is to take a familiar dataset, flights, from the nycflights13 package and introduce all kinds of horrible inconsistencies and errors into the dataset. That defines the problem domain. Then, the solutions will be to hunt down and locate those problems as easily as possible. I am only going to QC the problem, that is, to flag the problem. How you go about fixing it might be through code or simply using a text editor, that's kind of up to you. Go with what works best for you. But then re-use the QC code to validate your fixes. Again, the goal is to make QC'ing tedious, rather than chaotic or procedurally difficult.

# Code examples


      1_glimpse_view_problem
      1_1_lay_of_the_land
      1_2_design_intentions
      1_3_stray_commas
      1_4_wrong_datatypes
      1_5_additional_columns
      
      2_select
      2_1_one_big_many_small_sets
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
      
      7_ histograms_arrange
      7_1_continuous_variables
      7_2_examine_tails
      7_3_arrange_and_tails
      7_4_associated_variables
      





