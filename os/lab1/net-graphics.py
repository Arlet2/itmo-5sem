import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("net-data.csv")

plt.plot(data["i"],data["bogo ops"], "bo")

plt.xlabel("i, workers")
plt.ylabel("bogo ops")
plt.grid(True)

plt.show()