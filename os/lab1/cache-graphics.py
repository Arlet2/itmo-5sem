import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("cache-data-3.csv")

data["prefetch-l3"] = data["prefetch-l3"]/1024

plt.plot(data["prefetch-l3"],data["l1-icache-loads"], "bo")

plt.xlabel("prefetch-l3, KB")
plt.ylabel("l1-icache-loads")
plt.grid(True)

plt.show()

plt.plot(data["prefetch-l3"],data["l1-misses"], "bo")

plt.xlabel("prefetch-l3, KB")
plt.ylabel("l1-misses")
plt.grid(True)

plt.show()

plt.plot(data["prefetch-l3"],data["l3-request"], "bo")

plt.xlabel("prefetch-l3, KB")
plt.ylabel("l3-request")
plt.grid(True)

plt.show()

plt.plot(data["prefetch-l3"],data["l3-misses"], "bo")

plt.xlabel("prefetch-l3, KB")
plt.ylabel("l3-misses")
plt.grid(True)

plt.show()