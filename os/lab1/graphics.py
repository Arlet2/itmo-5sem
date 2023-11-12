import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("cpu-data-int128float.csv")

data = data.drop(columns=["bogops"])

data.plot()

plt.xlabel("cpu instances")
plt.ylabel("%cpu usage")
plt.show()