import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("mem-data-int128rd.csv")

plt.plot(data["mcontend"],data["memfd"], "bo")

plt.xlabel("mcontend, workers")
plt.ylabel("memfd")
plt.grid(True)

plt.show()

plt.plot(data["mcontend"],data["kbmemused"], "bo")

plt.xlabel("mcontend, workers")
plt.ylabel("kbmemused")
plt.grid(True)

plt.show()