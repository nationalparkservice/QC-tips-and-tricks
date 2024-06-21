

# 5_group_by_and_uniqueness

There are many situations where you may need to test for uniqueness. For example, species code will need to be unique in order to match one-for-one with scientific names, cover class codes will need to be unique to match with cover classes parameters and descriptions, and locality codes must be unique to represent addresses or geographic coordinates of specific locations. In database parlance, these columns are referred to as #primary keys#. Their purpose is to ensure that lookup tables can be joined one-to-many with data tables. In the next section, we'll see what error codes are thrown when the one-to-many join fails and how to test for uniqueness to prevent this.




look-up tables need to have a unique column or a unique composite of multiple columns in order to be related to other data tables.  

# 5_group_by_count
    
# 5_1_finding_duplicates 
    
# 5_2_testing_uniqueness

# 5_3_multivariable_uniqueness