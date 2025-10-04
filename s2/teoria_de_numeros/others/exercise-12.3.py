import math
import fractions

x_n = 3

for i in range(1, 10):
    print(f"x_{i} = {x_n} \t= {float(x_n)}")
    x_n = 2 - fractions.Fraction(1, x_n)
