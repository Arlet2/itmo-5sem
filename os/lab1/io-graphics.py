import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("io-data-10.csv")

plt.plot(data["ioprio"],data["w/s"], "bo")

plt.xlabel("ioprio, workers")
plt.ylabel("w/s")
plt.grid(True)

plt.show()

plt.plot(data["ioprio"],data["f/s"], "bo")

plt.xlabel("ioprio")
plt.ylabel("f/s")
plt.grid(True)

plt.show()