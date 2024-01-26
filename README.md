# QC-tips-and-tricks
 
QCing data is tedious, but it shouldn't be difficult.

This is a small collection of *very* simple techniques for QC'ing data using the dplyr and ggplot packages from R tidyverse. These are based on common methods used to tame big datasets in SQL and relational databases. Most "tidy" datasets are, in fact, true sets in the sense of relational data theory. The requirement for a true set is that every record is unique. Set operations are the basis of SQL and relational databases. With the development of dplyr grammar, you can use several of these set operations to quickly tame virtually any dataframe.

The main operations for QC'ing data have equivalents in SQL and R tidyverse. The following tidyverse and SQL functions are essentially the same: select(), distinct(), count(), group_by(), arrange() (ORDER BY in SQL), left_join() (LEFT OUTER JOIN in SQL). These operations and getting in the habit of looking at the design of your data using glimpse() and the actual values using view(), will give you what you need to sort out the roughest datasets.

Finally, R brings data visualizations to the table [sic], something SQL cannot do. For continuous data, I like to use ggplot histograms as well as arrange() ascending and descending order to look at the tails of the data. As a statistician, you would obviously use min() and max(), but for the data manager, that's a slippery slope into the world of statistics, probability and stochastic lifestyles, something to be avoided at all costs. 

# Working example - nycflights13 package

The rationale of this project is to take a familiar dataset, flights, from the nycflights13 package and introduce all kinds of horrible inconsistencies and errors into the dataset. That defines the problem domain. Then, the solutions will be to hunt down and locate those problems as easily as possible. I am only going to QC the problem, that is, to flag the problem. How you go about fixing it might be through code or simply using a text editor, that's kind of up to you. Go with what works best for you. But then re-use the QC code to validate your fixes. Again, the goal is to make QC'ing tedious, rather than chaotic of procedurally difficult.






