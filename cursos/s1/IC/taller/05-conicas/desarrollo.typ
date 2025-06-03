// #set page(height: auto)
#set enum(spacing: 8pt)
#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

= Taller

== Rectas

#enum[
  Halle la ecuación de la recta que pasa por los puntos $A(2,3)$ y $B(4,7)$.
][
  Data la ecuación de la recta $3x-4y+12=0$, determina la pendiente y la ordenada al origen.
][
  Halle los puntos de intersección de la recta $y=2x+1$ con los ejes $x$ e $y$ con la recta $3x+y-5=0$.
][
  Hallar las ecuaciones de las rectas que pasan por los vertices del triangulo $A(-2,3)$, $B(4,-3)$ y $C(8,1)$. Que tipo de triangulo es? Justifique su respuesta.
][
  Halle las ecuaciones de las alturas, de las medianas y de las mediatrices del triangulo del punto 4.
]

== Parábolas

#enum[
  Hallar la ecuación de la parabola con vértice en $(1,-2)$ que abre hacia arriba y pasa por el punto $(2,1)$.
][
  Dada la ecuación $y=2(x-3)^2+5$, hallar el vértice, el foco y la directriz de la parábola.
][
  Encuentra el vértice, el foco y la directriz de la parábola $y^2+8x+4y+5=0$.
][
  Halla los puntos de intersección entre la parábola $y=x^2-4$ y la recta $y=2x$.
][
  Halle la ecuación de la parabola que contiene los puntos $(-2,-3)$, $(1,2)$ y $(5,7)$, con directriz paralela al eje $y$.
]

== Elipses

#enum[
  Halle la ecuación de la elipse con centro en $(-1,4)$, semiejes de longitud $4$ y $3$.
][
  Dada la elipse $display((x+5)^2 / 16 + (y-7)^2 / 9 = 1)$, determine las coordenadas de los extremos de los ejes y los focos.
][
  Halle los puntos de intersección entre la elipse $4x^2+y^2=16$ y la recta $x+y=4$.
][
  Escribe la ecuación de la elipse $display((x-2)^2 / 25 + (y+1)^2 / 16 = 1)$ en su forma general. Dibuje la cónica.
]

== Hipérbolas

#enum[
  Halle la ecuación de la hipérbola con centro en $(0,0)$, asíntotas $y= plus.minus 3 / 4x$.
][
  Dada la hipérbola $display((x-4)^2 / 25 - (y+6)^2 / 16 = 1)$, determina las coordenadas de los focos, los vertices y las ecuaciones de las asíntotas.
][
  Halla los puntos de intersección entre la hipérbola $x^2-y^2=1$ y la recta $y=x-1$.
][
  Escribe la ecuación de la hipérbola $display((x-1)^2 / 9 - (y+2)^2 / 4 = 1)$ en su forma estándar.
]

#pagebreak()

= Desarrollo

#include "rectas.typ"

#pagebreak()

#include "parabolas.typ"

#pagebreak()

#include "elipses.typ"

#pagebreak()

#include "hiperbolas.typ"
