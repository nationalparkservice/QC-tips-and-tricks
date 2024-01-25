# QC-tips-and-tricks
 
QCing data is tedious, but it shouldn't be difficult.

This is a small collection of *very* simple techniques for QC'ing data using R tidyverse. These are based on common methods used to tame big datasets in SQL and relational databases. Most "tidy" datasets are, in fact, true sets in the mathematical sense. The requirement for a true set is that every record is unique. Set operations are the basis of SQL and relational databases. With the development of tidyverse grammar, you can use these set operations to quickly tame virtually any dataframe.

The main operations for QC'ing data have equivalents in SQL and R tidyverse. The following tidyverse and SQL functions are essentially the same: select(), distinct(), count(), group_by(), arrange() (ORDER BY in SQL), left_join() (LEFT OUTER JOIN in SQL). These operations and getting in the habit of looking at the design of your data using glimpse() and the actual values using view(), will give you most of what you need to slay even the datasets from hell.

Finally, R brings data visualizations to the table [sic], something SQL cannot do. For continuous data, I always use ggplot histograms as well as arrange() ascending and descending order to look at the tails of the data. As a statistician, you would obviously use min() and max(), but for the data manager, that is a slippery slope into the world of statistics, probability and stochastic life styles, something to be avoided at all costs. 

# Working example - nycflights13 package



