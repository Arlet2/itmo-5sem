import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("pipe-data.csv")

plt.plot(data["i"],data["%system"], "bo")

plt.xlabel("i, workers")
plt.ylabel("system usage, %")
plt.grid(True)

plt.show()