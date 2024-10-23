

import os
import pandas as pd
import matplotlib.pyplot as plt

os.chdir("c:\\Users\\growell\\QC-tips-and-tricks\\1_getting_started")
print(os.getcwd())
	
df = pd.read_csv("Electric_Vehicle_Population.csv")
df	
	
df.head()
df.tail()
	
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)
	
print(df)

df.head(100)
df.tail(100)

print(df.dtypes)

df['Electric_Range'] = df['Electric_Range'].astype(float)

df = pd.read_csv("Electric_Vehicle_Population_commas.csv")

df = pd.read_csv("Electric_Vehicle_Population_extra_column.csv")



