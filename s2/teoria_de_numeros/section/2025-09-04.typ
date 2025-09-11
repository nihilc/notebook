#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 9, day: 04).display()

== Monotonía de una sucesión

#definition[
  Una sucesión ${a_n}={a_1,a_2,dots,a_n,a_(n+1),dots}$ es:
  + Monótona creciente si: $a_1 <= a_2 <= dots <= a_n <=a_(n+1) <= dots$

  + Monótona decreciente si: $a_1 >= a_2 >= dots >= a_n >=a_(n+1) >= dots$
]

== Acotamiento de una sucesión

#definition[
  Una sucesión es acotada si $|a_n|<=M, M in RR^+$
  #note[
    Una sucesión es acotada inferiormente si $a_n>=k, k in RR$
  ]
  #note[
    Una sucesión es acotada superiormente si $a_n<=k, k in RR$
  ]
]
