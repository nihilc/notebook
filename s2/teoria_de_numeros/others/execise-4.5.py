import math

x_n = 1

for i in range(1, 10):
    print(f"x_{i} = {x_n}")
    x_n = math.sqrt(2 + x_n)
