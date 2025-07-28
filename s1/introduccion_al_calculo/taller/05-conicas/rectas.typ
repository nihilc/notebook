#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

== Recta
#enum[
  Halle la ecuación de la recta que pasa por los puntos $A(2,3)$ y $B(4,7)$.

  Encontramos la pendiente
  $
    m & = (y_2-y_1) / (x_2-x_1) \
    m & = (7-3) / (4-2)         \
    m & = 4 / 2                 \
    m & = 2                     \
  $

  Ahora con punto pendiente obtenemos
  $
      y-y_1 & = m(x-x_1) \
        y-3 & =2(x-2)    \
        y-3 & =2x-4      \
    -2x+y+1 & =0         \
  $
  #finish
][
  Data la ecuación de la recta $3x-4y+12=0$, determina la pendiente y la ordenada al origen.

  Expresamos la ecuación en forma Pendiente-Ordenada al origen
  $
    3x-4y+12 & =0           \
         -4y & =-3x-12      \
          4y & =3x+12       \
           y & = 3 / 4x + 3 \
  $

  Tenemos que la pendiente $m=3 / 4$ y la ordenada al origen $b=3$
  #finish
][
  Halle los puntos de intersección de la recta $y=2x+1$ con los ejes $x$ e $y$ con la recta $3x+y-5=0$.

  Remplazamos $x=0$
  $
    y = 2(0) + 1 \
    y = 1
  $
  Punto de intersección en eje $x$ $(0,1)$

  Remplazamos $y=0$
  $
    0 = 2x + 1 \
    -1 / 2 = x
  $
  Punto de intersección en eje $y$ $(-1 / 2,0)$

  Para la intersección de ambas rectas resolvemos el sistema de ecuaciones
  $
    cases(y=2x+1 \ y=-3x+5)
  $
  Por igualación en $y$
  $
    2x + 1 & =-3x+5  \
        5x & = 4     \
         x & = 4 / 5 \
  $
  Remplazamos $x$ en alguna de las ecuaciones
  $
    y= 2(4 / 5) + 1\
    y= 13 / 5
  $

  Punto de intersección entre las rectas es $(4 / 5 , 13 / 5)$
][
  Hallar las ecuaciones de las rectas que pasan por los vertices del triangulo $A(-2,3)$, $B(4,-3)$ y $C(8,1)$. Que tipo de triangulo es? Justifique su respuesta.

  #enum(numbering: "i.")[
    Recta $A,B$

    Pendiente:
    $
      m=(-3-3) / (4-(-2))= -6 / 6 = -1
    $
    Ecuación General:
    $
        y-3 & =-1(x-(-2)) \
        y-3 & =-x-2       \
      x+y-1 & =0          \
    $
  ][
    Recta $A,C$

    Pendiente:
    $
      m = (1-3) / (8-(-2)) = -2 / 10 = -1 / 5
    $
    Ecuación General:
    $
                   y-3 & =-1 / 5(x-(-2))  \
                   y-3 & =-1 / 5x - 2 / 5 \
      1 / 5x+y -13 / 5 & = 0              \
    $
  ][
    Recta $B,C$

    Pendiente
    $
      m= (1-(-3)) / (8-4) = 4 / 4 = 1
    $
    Ecuación General:
    $
         y-1 & =1(x-8) \
         y-1 & =x-8    \
      -x+y+7 & =0      \
    $
  ]

  Que tipo de triangulo es?

  Vemos que la pendiente de la recta $B,C$ es $m_1=1$\
  También la pendiente de la recta $A,B$ es $m_2=-1$

  Observamos que las rectas son perpendiculares siendo ya que $m_2$ es el negativo del inverso multiplicativo de $m_1$

  Por lo tanto es un triangulo rectángulo.
  #finish
][
  #set enum(numbering: "i.")
  #set list(
    marker: level => {
      align(horizon, sym.bullet)
    },
    spacing: 10pt,
  )

  Halle las ecuaciones de las alturas, de las medianas y de las mediatrices del triangulo del punto 4.

  Vertices del triangulo $A(-2,3), B(4,-3), C(8,1)$

  Rectas del triangulo:
  #list[
    De los vertices $A,B$ sea $l_1:y=-x-1$
  ][
    De los vertices $A,C$ sea $l_2:display(y=-1 / 5x+13 / 5)$
  ][
    De los vertices $B,C$ sea $l_3:y=x-7$
  ]

  Puntos medios:
  #list[
    De $l_1$ sea $display(M_1=((-2+4) / 2, (3+(-3)) / 2)=(1,0))$
  ][
    De $l_2$ sea $display(M_2=((-2+8) / 2, (3+1) / 2)=(3,2))$
  ][
    De $l_3$ sea $display(M_3=((4+8) / 2, (-3+1) / 2)=(6,-1))$
  ]

  _Alturas_:
  #enum[
    Altura $l_1$

    Hallamos $l_4$ tal que $l_4 perp l_1$ y pase por $C$

    Pendiente de $l_1=-1$\
    Pendiente de $l_4=-(-1)^(-1)=1$ \
    Ecuación de $l_4$
    $
      y-1 & =1(x-8) \
      y-1 & =x-8    \
        y & =x-7    \
    $
  ][
    Altura $l_2$

    Hallamos $l_5$ tal que $l_5 perp l_2$ y pase por $B$

    Pendiente de $l_2=-1 / 5$ \
    Pendiente de $l_5=-(-1 / 5)^(-1)=5$ \
    Ecuación de $l_5$
    $
      y-(-3) & =5(x-4) \
         y+3 & =5x-20  \
           y & =5x-23  \
    $
  ][
    Altura $l_3$

    Hallamos $l_6$ tal que $l_6 perp l_3$ y pase por $A$

    Pendiente de $l_3=1$ \
    Pendiente de $l_6=-(1)^(-1)=-1$ \
    Ecuación $l_6$
    $
      y-3 & =-1(x-(-2)) \
      y-3 & =-x-2       \
        y & =-x+1       \
    $
  ]

  _Medianas_:
  #enum[
    Mediana $C$ y $l_1$

    Hallamos $l_7$ que pase por los puntos $C$ y $M_1$

    Pendiente $l_7$
    $
      m=(1-0) / (8-1)=1 / 7
    $
    Ecuación $l_7$
    $
      y-0 & =1 / 7(x-1)    \
        y & =1 / 7x -1 / 7 \
    $
  ][
    Mediana $B$ y $l_2$

    Hallamos $l_8$ que pase por los puntos $B$ y $M_2$

    Pendiente $l_8$
    $
      m=(-3-2) / (4-3)=-5
    $
    Ecuación $l_8$
    $
      y-2 & =-5(x-3) \
      y-2 & =-5x+15  \
        y & =-5x+17  \
    $
  ][
    Mediana $A$ y $l_3$

    Hallamos $l_9$ que pase por los puntos $A$ y $M_3$

    Pendiente $l_9$
    $
      m = (3-(-1)) / (-2-6) = -4 / 8 = -1 / 2
    $
    Ecuación $l_9$
    $
      y-3 & =-1 / 2(x-(-2)) \
      y-3 & =-1 / 2x - 1    \
        y & =-1 / 2x +2     \
    $
  ]

  _Mediatrices_:
  #enum[
    Mediatriz $l_1$

    Hallamos $l_10$ tal que $l_10 perp l_1$ y pase por $M_1$

    Pendiente de $l_1=-1$\
    Pendiente de $l_10=-(-1)^(-1)=1$ \
    Ecuación de $l_10$
    $
      y-0 & =1(x-1) \
        y & =x-1    \
    $
  ][
    Mediatriz $l_2$

    Hallamos $l_11$ tal que $l_11 perp l_2$ y pase por $M_2$

    Pendiente de $l_2=-1 / 5$ \
    Pendiente de $l_11=-(-1 / 5)^(-1)=5$ \
    Ecuación de $l_11$
    $
      y-2 & =5(x-3) \
      y-2 & =5x-15  \
        y & =5x-13  \
    $
  ][
    Mediatriz $l_3$

    Hallamos $l_12$ tal que $l_12 perp l_3$ y pase por $M_3$

    Pendiente de $l_3=1$ \
    Pendiente de $l_12=-(1)^(-1)=-1$ \
    Ecuación de $l_12$
    $
      y-(-1) & =-1(x-6) \
         y+1 & =-x+6    \
           y & =-x+5    \
    $
  ]
  #image("rectas-5-triangulo.png", width: 7cm)
  #finish
]
