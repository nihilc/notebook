import math

x_n = math.sqrt(5)

for i in range(1, 10):
    print(f"x_{i} = {x_n}")
    x_n = math.sqrt(math.sqrt(5) + x_n)
