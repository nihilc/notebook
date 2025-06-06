#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

= Elipses

#enum[
  Halle la ecuación de la elipse con centro en $(-1,4)$, semiejes de longitud $4$ y $3$.

  Como no se especifica cual es el semieje vertical ni el horizontal hallamos ambas elipses

  #list[
    Remplazamos el centro y los semiejes en la ecuación de elipse horizontal
    $
         (x-h)^2 / a^2 + (y-k)^2 / b^2 & = 1 \
      (x-(-1))^2 / 4^2 + (y-4)^2 / 3^2 & = 1 \
            (x+1)^2 / 16 + (y-4)^2 / 9 & = 1 \
    $
  ][
    Remplazamos el centro y los semiejes en la ecuación de elipse horizontal
    $
         (x-h)^2 / a^2 + (y-k)^2 / b^2 & = 1 \
      (x-(-1))^2 / 3^2 + (y-4)^2 / 4^2 & = 1 \
            (x+1)^2 / 9 + (y-4)^2 / 16 & = 1 \
    $
  ]
  #finish
][
  Dada la elipse $display((x+5)^2 / 16 + (y-7)^2 / 9 = 1)$, determine las coordenadas de los extremos de los ejes y los focos.

  $a=4; quad b=3; quad c=sqrt(4^2-3^3)=sqrt(7)$

  - Centro: $(-5,7)$
  - Extremos eje mayor: $(-5+4,7), (-5-4,7); quad (-1,7), (-9,7)$
  - Extremos eje menor: $(-5,7+3), (-5,7-3); quad (-5,10), (-5,4)$
  - Focos: $(-5+sqrt(7),7),(-5-sqrt(7),7)$
  #finish
][
  Halle los puntos de intersección entre la elipse $4x^2+y^2=16$ y la recta $x+y=4$.

  Despejamos $y$ en la recta $y=-x+4$

  Remplazamos $y$ en la elipse
  $
     4x^2+(-x+4)^2 & =16 \
    4x^2+x^2-8x+16 & =16 \
           5x^2-8x & =0  \
           x(5x-8) & =0  \
  $
  Obtenemos que $x=0 " o " 5x-8=0; x=8 / 5$

  Remplazamos $x$ en la recta
  #list[
    Para $x=0$
    $
      y & =4-x   \
      y & =4-0=4 \
    $
    Obtenemos punto $(0,4)$
  ][
    Para $x=8 / 5$
    $
      y & =4-x            \
      y & =4-8 / 5=12 / 5 \
    $
    Obtenemos punto $display((8 / 5,12 / 5))$
  ]
  #finish
][
  Escribe la ecuación de la elipse $display((x-2)^2 / 25 + (y+1)^2 / 16 = 1)$ en su forma general. Dibuje la cónica.
  $
       (x-2)^2 / 25 + (y+1)^2 / 16 & = 1         \
             16(x-2)^2 + 25(y+1)^2 & = 25 dot 16 \
       16(x^2-4x+4) + 25(y^2+2y+1) & = 400       \
    16x^2 -64x +64 +25y^2 +50y +25 & = 400       \
       16x^2 +25y^2 -64x +50y -311 & = 0         \
  $
]
