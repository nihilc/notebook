#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

== Hipérbolas

#enum[
  Halle la ecuación de la hipérbola con centro en $(0,0)$, asíntotas $y= plus.minus 3 / 4x$.

  Como la pendiente de una hipérbola es $m = b / a$ tenemos $a=4$, $b=3$

  Como no se especifica si la hipérbola es horizontal o vertical hallamos ambas:
  #list[
    Para la hipérbola horizontal remplazamos $a$ y $b$ y el centro
    $
      (x-h)^2 / a^2 - (y-k)^2 / b^2 & = 1 \
      (x-0)^2 / 4^2 - (y-0)^2 / 3^2 & = 1 \
                 x^2 / 16 - y^2 / 9 & = 1 \
    $
  ][
    Para la hipérbola vertical remplazamos $a$ y $b$ y el centro
    $
      -(x-h)^2 / a^2 + (y-k)^2 / b^2 & = 1 \
      -(x-0)^2 / 4^2 + (y-0)^2 / 3^2 & = 1 \
                 -x^2 / 16 + y^2 / 9 & = 1 \
    $
  ]
  #finish
][
  Dada la hipérbola $display((x-4)^2 / 25 - (y+6)^2 / 16 = 1)$, determina las coordenadas de los focos, los vertices y las ecuaciones de las asíntotas.

  $a=5; quad b=4; quad c=sqrt(25+16)=sqrt(41)$

  - Centro $(4,-6)$
  - Vertices $(4+5,-6),(4-5,-6); quad (9,-6),(-1,-6)$
  - Focos $(4+sqrt(41),-6),(4-sqrt(41),-6)$

  Hallamos las asíntotas

  Sabemos que la pendiente de las asíntotas es $plus.minus b / a$

  Hallamos la primera usando punto pendiente
  $
    y-(-6) & = 4 / 5(x-4)    \
       y+6 & = 4 / 5x-16 / 5 \
         y & = 4 / 5x-46 / 5 \
  $
  Hallamos la segunda usando punto pendiente
  $
    y-(-6) & = -4 / 5(x-4)    \
       y+6 & = -4 / 5x+16 / 5 \
         y & = -4 / 5x-14 / 5 \
  $
  #finish
][
  Halla los puntos de intersección entre la hipérbola $x^2-y^2=1$ y la recta $y=x-1$.

  Remplazamos $y=x-1$ en la hipérbola
  $
       x^2-(x-1)^2 & =1 \
    x^2-(x^2-2x+1) & =1 \
      x^2-x^2+2x-1 & =1 \
                2x & =2 \
                 x & =1 \
  $
  Remplazamos $x=1$ en la recta $y=x-1=1-1=0$

  Obtenemos punto de intersección en $(1,0)$
  #finish
][
  Escribe la ecuación de la hipérbola $display((x-1)^2 / 9 - (y+2)^2 / 4 = 1)$ en su forma estándar.

  $
         (x-1)^2 / 9 - (y+2)^2 / 4 & = 1       \
               4(x-1)^2 - 9(y+2)^2 & = 9 dot 4 \
     4(x^2 -2x +1) - 9(y^2 +4y +4) & = 36      \
    4x^2 -8x +4 -9y^2 -36y -36 -36 & = 0       \
           4x^2 -9y^2 -8x -36y -68 & = 0       \
  $
  #finish
]
