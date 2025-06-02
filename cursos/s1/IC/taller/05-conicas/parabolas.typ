#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

= Parábolas

#enum[
  Hallar la ecuación de la parabola con vértice en $(1,-2)$ que abre hacia arriba y pasa por el punto $(2,1)$.

  Ecuación Cónica de la parabola $(x-h)^2 = 4p(y-k)$

  Remplazando vértice $(1,-2)$ y el punto $(2,1)$ en la cónica
  $
    (2-1)^2 & =4p(1-(-2)) \
          1 & =4p+8p      \
     1 / 12 & = p         \
  $
  Remplazamos $p$ y el vértice $(1,-2)$ en la cónica
  $
                  (x-1)^2 & = 4(1 / 12)(y -(-2)) \
                  (x-1)^2 & = 1 / 3(y +2)        \
                x^2 -2x+1 & = 1 / 3y +2 / 3      \
    x^2-2x-1 / 3y + 1 / 3 & = 0                  \
         3x^2 -6x -1y + 1 & = 0                  \
  $
  #finish
][
  Dada la ecuación $y=2(x-3)^2+5$, hallar el vértice, el foco y la directriz de la parábola.

  Expresarla de forma cónica
  $
             y & =2(x-3)^2+5 \
           y-5 & =2(x-3)^2   \
    1 / 2(y-5) & =(x-3)^2    \
       (x-3)^2 & =1 / 2(y-5) \
  $
  Hallamos $p$
  $
    4p & = 1 / 2; quad
         p             & = 1 / 8
  $

  Vértice: $(3,5)$ \
  Foco: $(3,5+1 / 8); quad (3,41 / 8)$ \
  Directriz: $y=5-1 / 8; quad y=39 / 8$
  #finish
][
  Encuentra el vértice, el foco y la directriz de la parábola $y^2+8x+4y+5=0$.

  Expresamos de forma cónica la parabola
  $
            y^2 +8x +4y +5 & = 0                     \
    y^2 +4y + underline(4) & = -8x -5 + underline(4) \
                   (y+2)^2 & = -8x -1                \
                   (y+2)^2 & = -8(x+1 / 8)           \
  $
  Hallamos $p$
  $
    4p = -8; quad p = -2
  $
  Vértice: $(-1 / 8, -2)$ \
  Foco: $(-1 / 8-2,-2); quad (-17 / 8,-2)$ \
  Directriz: $y=-1 / 8+2; quad y=15 / 8$
  #finish
][
  Halla los puntos de intersección entre la parábola $y=x^2-4$ y la recta $y=2x$.

  Igualamos las expresiones
  $
       x^2-4 & =2x \
    x^2-2x-4 & =0  \
  $
  Resolvemos la cuadrática
  $
    x=(2 plus.minus sqrt(4-4(-4))) / 2 \
    x=(2 plus.minus sqrt(20)) / 2 \
    x=(2 plus.minus 2sqrt(5)) / 2 \
    x=1 plus.minus sqrt(5) quad
    cases(
      x_1=1 plus sqrt(5) \
      x_2=1 minus sqrt(5)
    )
  $
  Remplazamos $x_1$ en la recta
  $
    y=2(1+sqrt(5))\
    y=2+2sqrt(5)
  $
  Obtenemos el primer punto de intersección en $(1+sqrt(5), 2+2sqrt(5))$

  Remplazamos $x_2$ en la recta
  $
    y=2(1-sqrt(5))\
    y=2-2sqrt(5)
  $
  Obtenemos el segundo punto de intersección en $(1-sqrt(5), 2-2sqrt(5))$
  #finish
][
  Halle la ecuación de la parabola que contiene los puntos $(-2,-3)$, $(1,2)$ y $(5,7)$, con directriz paralela al eje $y$.

  #set math.equation(numbering: "(1)", number-align: bottom)
  #set ref(supplement: "Ecuación")

  Ecuación cónica de parabola horizontal $(y-k)^2=4p(x-h)$

  Remplazamos $(-2,-3)$ en la cónica $x=-2 quad y=-2$
  $
             (-3-k)^2 & =4p(-2-h) \
             9+6k+k^2 & =-8p-4p h \
    k^2 +6k +4p h +8p & = -9      \
  $<e1>
  Remplazamos $(1,2)$ en la cónica $x=1 quad y=2$
  $
              (2-k)^2 & = 4p(1-h) \
             4-4k+k^2 & = 4p-4p h \
    k^2 -4k +4p h -4p & = -4      \
  $<e2>
  Remplazamos $(5,7)$ en la cónica $x=5 quad y=7$
  $
                (7-k)^2 & = 4p(5-h)   \
             49-14k+k^2 & = 20p -4p h \
    k^2 -14k +4p h -20p & = -49       \
  $<e3>

  @e1 $+ -1 dot$ @e2
  $
    & k^2 +6k +4p h +8p = -9 \
    & -k^2 +4k -4p h +4p = 4 \
    & #line(length: 30%)     \
    & 10k +12p = -5          \
  $<e4>

  $-1 dot$ @e2 $+$ @e3
  $
    & -k^2 +4k -4p h +4p = 4    \
    & k^2 -14k +4p h -20p = -49 \
    & #line(length: 30%)        \
    & -10k -16p = -45           \
  $<e5>

  #set math.equation(numbering: none)
  @e4 $+$ @e5
  $
    & 10k +12p = -5      \
    & -10k -16p = -45    \
    & #line(length: 30%) \
    & -4p=-50            \
    & p=50 / 4 = 25 / 2  \
  $

  Remplazo $p=25 / 2$ en @e4
  $
           10k +12p & = -5                  \
    10k +12(25 / 2) & = -5                  \
          10k + 150 & = -5                  \
                10k & = -155                \
                  k & = -155 / 10 = -31 / 2 \
  $

  Remplazo $p=25 / 2$ y $k=-31 / 2$ en @e2
  $
                                   k^2 -4k +4p h -4p & = -4   \
    (-31 / 2)^2 -4(-31 / 2) + 4(25 / 2)h - 4(25 / 2) & = -4   \
    (-31 / 2)^2 -4(-31 / 2) + 4(25 / 2)h - 4(25 / 2) & = -4   \
                             961 / 4 + 62 + 50h - 50 & = -4   \
                                        961 / 4 + 16 & = -50h \
                                            1025 / 4 & = -50h \
                                             -41 / 8 & = h    \
  $

  Remplazo $p=25 / 2$, $k=-31 / 2$ y $h=-41 / 8$ en la cónica
  $
    (y-k)^2 = 4p(x-h) \
    (y-(-31 / 2))^2 = 4(25 / 2)(x-(-41 / 8)) \
    (y+31 / 2)^2 = 50(x+41 / 8) \
  $

  Vértice: $display((-41 / 8 , -31 / 2))$

  Foco: $display((59 / 8, -31 / 2) quad quad quad quad -41 / 8+25 / 2=(-41+100) / 8=59 / 8)$

  Directriz: $display(x=-141 / 8 quad quad quad -41 / 8-25 / 2=(-41-100) / 8=141 / 8)$
]
