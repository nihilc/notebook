#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 9, day: 01).display()

== Sumatorias y Productorios

Tanto en las sumatorias como productorios podemos utilizar elementos de un conjuntos y tambien definir condiciones
Algunos tipos de sumatorias y productorios

#example[
  Sea $I={2,3,5,7,11,13}$
  $ sum_(x in I \ x|12) x = 2 + 3 = 5 $
]

#example[
  Sea $K={7,9,11}$
  $ product_(i,j in K \ i<j) i^j = 7^9 dot 7^11 dot 9^11 $

  $
    product_(i,j in K \ i<=j) i^j = 7^7 dot 7^9 dot 7^11 dot 9^9 dot 9^11 dot 11^11
  $
]


== Suma Telescópica

#definition[Suma Telescópica][
  Una suma de la forma $display(sum_(i=m+1)^n (a_i - a_(i-1)) = a_n-a_m)$ con $n>m+1$. Se llama suma telescópica
]<def:sum_tel>

#proof[la #link(<def:sum_tel>)[Suma Telescópica] por inducción][
  - _CB:_ $n=m+1$
    $
      sum_(i=m+1)^(m+2) (a_i-a_(i-1))
      = cancel(a_(m+1)) - a_m + a_(m+2) - cancel(a_(m+1))
      = a_(m+2) - a_m
    $
  - _PI:_ Supongamos que $sum_(i=m+1)^n (a_i-a_(i-1)) = a_n - a_m$
    $
        & sum_(i=m+1)^(n+1) (a_i - a_(i-1))                 \
      = & sum_(i=m+1)^(n) (a_i - a_(i-1)) + (a_(n+1) - a_n) \
      = & ( cancel(a_n) - a_m) + (a_(n+1) - cancel(a_n))    \
      = & a_(n+1) - a_m                                     \
    $
]
