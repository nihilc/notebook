// #set page(width: 20cm, height: auto)
= Taller

#enum[
  Hallar las coordenadas del vértice y el foco y la ecuación de la directriz, de las parabolas
  + $x^2 -2x + 5y + 16 = 0$
  + $18y^2 - 24y + 36x - 1 = 0$
  + $12x^2 +3y - 10y -1 = 0$
][
  Hallar la ecuación general de la elipse
  $ (x+2)^2 / 4 + (y-2)^2 / 9 = 1 $
][
  Hallar coordenadas de centro, focos y extremos de eje mayor y menor de las elipses
  + $3x^2 + 2y^2 + 12x - 8y - 18 = 0$
  + $144x^2 + 36y^2 - 96x + 12y - 127 = 0$
  + $9x^2 + 4y^2 - 18x + 8y + 9 = 0$
]

#pagebreak()
= Desarrollo

#enum[
  #set math.equation(numbering: "(1)", number-align: bottom)
  Halle la ecuación de la parabola que pasa por los puntos $(-7 / 3,2 ), (1,-2), (-10 / 3, 3)$
  - La directriz es horizontal

  Ecuación cónica de la parabola $(x-h)^2= 4p(y-k)$

  Si pasa por $(-7 / 3,2)$
  $
                       (-7 / 3 - h)^2 & = 4p(2-k) \
               49 / 9 + 14 / 3h + h^2 & = 8p-4p k \
    h^2 + 14 / 3h + 4p k -8p + 49 / 9 & = 0       \
  $<e1>

  Si pasa por $(1,2)$
  $
                   (1-h)^2 & = 4p(-2-k)   \
              1 - 2h + h^2 & = -8p - 4p k \
    h^2 -2h +4p k + 8p + 1 & = 0          \
  $<e2>

  Si pasa por $(-10 / 3,2)$
  $
                     (-10 / 3 -h)^2 & = 4p(3-k)    \
            100 / 9 + 20 / 3h + h^2 & = 12p - 4p k \
    h^2+20 / 3h+4p k -12p + 100 / 9 & = 0          \
  $<e3>

  Ahora tenemos el siguiente sistema de 3 ecuaciones con 3 variables
  $
    cases(
      h^2 + 14 / 3h + 4p k -8p + 49 / 9 & = 0 \
                 h^2 -2h +4p k + 8p + 1 & = 0 \
        h^2+20 / 3h+4p k -12p + 100 / 9 & = 0
    )
  $

  @e1 - @e2
  $
    & h^2 + 14 / 3h + 4p k -8p + 49 / 9 & = 0 \
    & -h^2 +2h -4p k - 8p - 1           & = 0 \
    & #line(length: 50%)                      \
    & 20 / 3h -16p + 40 / 9             & = 0 \
  $<e4>

  @e1 - @e3
  $
    & h^2 + 14 / 3h + 4p k -8p + 49 / 9     & = 0 \
    & -h^2 - 20 / 3h - 4p k + 12p - 100 / 9 & = 0 \
    & #line(length: 50%)                          \
    & -2h +4p - 51 / 9                      & = 0 \
  $<e6>

  @e4 + $4 dot$ @e6
  $
    & 20 / 3h -16p + 40 / 9 & = 0 \
    & -8h + 16p - 204 / 9   & = 0 \
    & #line(length: 50%)          \
    & -4 / 3h - 164 / 9     & = 0 \
  $<e7>

  Despejamos $h$ en @e7
  $
    -4 / 3h - 164 / 9 & = 0                             \
              -4 / 3h & = 164 / 9                       \
                    h & = 164 / 9 dot -3 / 4            \
                    h & = -164 / 12 = -82 / 6 = -41 / 3 \
  $

  Remplazamos $h$ en @e6
  $
    -2(-41 / 3) +4p - 51 / 9 & = 0   \
               82 / 3-17 / 3 & = -4p \
                      65 / 3 & = -4p \
                    -65 / 12 & = p   \
  $

  Remplazamos $h$ y $p$ en @e2
  $
                                       h^2 -2h +4p k + 8p + 1 & = 0        \
    (-41 / 3)^2 - 2(-41 / 3) + 4(-65 / 12)k + 8(-65 / 12) + 1 & = 0        \
                             1681 / 9 + 82 / 3 - 520 / 12 + 1 & = 65 / 3k  \
                                (6724 + 984 - 1560 + 36) / 36 & = 65 / 3k  \
                                         1546 / 9 = 6184 / 36 & = 65 / 3 k \
                                          1546 / 9 dot 3 / 65 & = k        \
                                                   1546 / 195 & = k        \
  $

  Ahora remplazamos $h,k,p$ en la Ecuación cónica
  $
                              (x-h)^2 & = 4p(y-k)                     \
                      (x-(-41 / 3))^2 & = 4(-65 / 12)(y - 1546 / 195) \
                         (x+41 / 3)^2 & = -65 / 3(y- 1546 / 195)      \
             x^2 + 82 / 3x + 1681 / 9 & = -65 / 3y + 1546 / 9         \
    x^2 + 82 / 3x + 65 / 3y + 135 / 9 & = 0                           \
         x^2 + 82 / 3x + 65 / 3y + 15 & = 0                           \
              3x^2 + 82 x + 65 y + 45 & = 0                           \
  $

  Ecuación general $3x^2 + 82 x + 65 y + 45 & = 0$ \
  Vértice: $(-41 / 3, 1546 / 195)$ \
  Foco: $(-41 / 3, 1546 / 195-65 / 3) = (-41 / 3, −893 / 65)$ \
  Directriz: $195y - 5771 & = 0$
  $
              y & = 1546 / 195 + 65 / 3 = 5771 / 195 \
    195y - 5771 & = 0                                \
  $
  #align(right, square(width: 10pt))
][

]
