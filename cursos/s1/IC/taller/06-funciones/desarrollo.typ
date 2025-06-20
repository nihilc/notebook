#set page(width: 15cm, height: auto)
#set enum(spacing: 15pt, numbering: "1.a.")

= Desarrollo

#enum[
  El area de la superficie de un cilindro circular recto cerrado es de $50 pi c m^2$. Expresar el volumen del cilindro en función de su radio.

  Sabemos que el area de un cilindro es $A = 2 pi r^2 + 2 pi r h$ donde $r$ es el radio y $h$ es la altura del cilindro

  También sabemos que el volumen de un cilindro es $V= pi r^2 h$

  Ahora, nos dicen que $A=50 pi$, entonces $50pi = 2 pi r^2 + 2 pi r h$

  Hallamos $h$
  $
                   50pi & = 2 pi r^2 + 2 pi r h \
                     50 & = 2 r^2 + 2 r h       \
             50 - 2 r^2 & = 2 r h               \
    (50 - 2 r^2) / (2r) & = h                   \
       (25 - r^2) / (r) & = h                   \
  $

  Ahora para expresar el volumen en función del radio remplazamos $h$ en la formula del volumen
  $
    V(r) & = pi r^2 ((25 - r^2) / (r)) \
         & = pi r (25-r^2)             \
         & = 25 pi r - pi r^3          \
  $

  $therefore V(r)=25 pi r - pi r^3$
][
  Un comerciante vende 750 de sus productos al mes, a un precio de \$25.000 cada uno, y por cada \$4.000 de reducción en el precio de cada uno, se venden cada mes 40 productos mas. Si $s$ representa el numero de veces que se reduce el precio en \$4.000, exprese el ingreso generado cada mes por ventas del producto como función de $s$

  $
    f(s) & = (25000 - 4000s) (750 + 40s)
  $
][
  // TODO:
  Exprese el área del rectángulo en función del radio del circulo.
][
  El punto $(3,1)$ pertenece a la recta que pasa por los puntos $(0,b)$ y $(a,0)$, exprese el area del triangulo formado por la recta y los ejes de coordenadas en función de $a$

  Como los puntos están en los ejes podemos usar la forma simétrica $x / a + y / b = 1$ y remplazamos el punto $(3,1)$

  $
     3 / a+1 / b & = 1                \
           1 / b & = 1-3 / a          \
    (1 / b)^(-1) & = ((a-3) / a)^(-1) \
               b & = a / (a-3)        \
  $

  Sabemos que el area de un triangulo es $A=1 / 2 dot "base" dot "altura"$, sabemos que la base es $a$ y la altura es $b$, remplazando:

  $
    A(a) = 1 / 2 dot a dot (a / (a-3)) = a^2 / (2a-6)
  $
][
  Determine el dominio y rango de las siguientes funciones, elabore una tabla de valores y represente cada función en un plano $x y$

  #let fid = [La función se índetermina en]
  #enum[
    $f(x)=(x-2) / (3x+2)$

    #fid $3x+2=0; x=-2 / 3$

    _Dominio:_ $RR \\ {-2 / 3}$

    Por definición de rango
    $
                y & = (x-2) / (3x+2)       \
          y(3x+2) & = x-2                  \
      3x y +2y -x & = -2                   \
          3x y -x & = -2y -2               \
       x (3 y -1) & = -2y -2               \
                x & = (-2y -2 ) / (3 y -1) \
    $

    #fid $3y-1=0; y = 1 / 3$

    _Rango:_ $RR \\ {1 / 3}$
  ][
    $f(x)=(4x^2-4) / (2x-2)$

    $
      (4x^2-4) / (2x-2) = (4(x^2-1)) / (2(x-1)) = (2(x+1)(x-1)) / (x-1)
    $
    Simplificamos siempre que $x!=1$ entonces
    $ f(x)=2(x+1) $

    _Dominio:_ $RR \\ {1}$

    Excluimos cuando $f(1)=2(1+1)=4$

    _Rango:_ $RR \\ {4}$
  ][
    $f(x)=5x^2+4x-2$

    _Dominio:_ $RR$

    Encontramos el vértice de la parabola

    $
                          5x^2 +4x -2 & = y              \
                      5(x^2 +4 / 5x ) & =y+2             \
      5(x^2 +4 / 5x +4 / 25 -4 / 25 ) & =y+2             \
              5((x+2 / 5)^2 -4 / 25 ) & =y+2             \
                  5(x+2 / 5)^2 -4 / 5 & =y+2             \
                         5(x+2 / 5)^2 & =y+14 / 5        \
                          (x+2 / 5)^2 & =1 / 5(y+14 / 5) \
    $
    Vértice en $(-2 / 5,-14 / 5)$

    _Rango:_ $[-14 / 5,infinity)$

  ][
    $f(x)=(4x^2+4) / (2x^2-8)$

    Simplificamos la ecuación
    $
      f(x) = (4x^2+4) / (2x^2-8) = (4(x^2+1)) / (2(x^2-4)) = (2(x^2+1)) / (x^2-4)
    $

    La función se indetermina en $x^2-4=0; x={-2,2}$

    _Dominio:_ $RR\\{-2,2}$

    Por definición de rango

    $
              y & = (2(x^2 +1)) / (x^2 -4) \
      y(x^2 -4) & = 2(x^2 +1)              \
       x^2y -4y & = 2x^2 +2                \
      x^2y-2x^2 & = 4y +2                  \
       x^2(y-2) & = 4y +2                  \
            x^2 & = (4y +2 ) / (y-2)       \
    $

    Verificamos $(4y +2 ) / (y-2) >= 0$

    $
      ( 4y+2>=0 and y-2>0 ) & or ( 4y+2<=0 and y-2<0 ) \
      ( y>=-1 / 2 and y>2 ) & or ( y<=-1 / 2 and y<2 ) \
               (2,infinity) & union (-infinity,1 / 2]  \
    $

    _Rango:_ $RR\\{(-1 / 2,2]}$
  ][
    $f(x)=(x^3+3x^2+2x) / (x^2+3x+2)$

    $
      f(x) & = (x^3+3x^2+2x) / (x^2+3x+2)   \
           & = x(x^2+3x+2) / (x^2+3x+2)     \
           & = (x(x+1)(x+2)) / ((x+1)(x+2)) \
    $

    #fid $x={-2,-1}$

    _Dominio:_ $RR\\{-2,-1}$

    Simplificamos la función teniendo en cuenta que $x!={-2,-1}$

    $
      f(x)=(x(x+1)(x+2)) / ((x+1)(x+2)) = x
    $

    Excluimos $f(-2)=-2$ y $f(-1)=-1$ del rango

    _Rango:_ $RR\{-2,-1}$
  ][
    $f(x)=root(3, 4-2x)$

    Como el indice de la raíz es impar el dominio es el mismo que el de la interna, Entonces hallamos dominio de $4-2x$, que por definición son todos los reales

    _Dominio:_ $RR$

    Por definición de rango

    $
               y & = root(3, 4-2x) \
             y^3 & = 4-2x          \
          y^3 +4 & = 2x            \
      y^3 / 2 +2 & = x             \
    $

    _Rango:_ $RR$
  ][
    $f(x)=(sqrt(x+3)) / (x-2)$

    #fid $x-2=0; x=2$

    #fid $x+3<=0; x<= -3$

    _Dominio:_ $[-3,2) union (2,infinity)$

    Por definición de rango
    $
                                   y & = (sqrt(x+3)) / (x-2) \
                              y(x-2) & = sqrt(x+3)           \
                          (x y-2y)^2 & = x+3                 \
      (x y)^2 - 2(x y)(2y) + (-2y)^2 & = x+3                 \
                x^2y^2 -4x y^2 +4y^2 & = x+3                 \
          x^2y^2 -4x y^2 -x +4y^2 -3 & = 0                   \
        x^2y^2 -x(4 y^2 +1) +4y^2 -3 & = 0                   \
    $

    Tenemos una cuadrática, revisamos si el discriminante $D>=0$

    $
      D & = (4y^2 +1)^2 - 4(y^2)(4y^2-3) \
        & = 16y^4 +8y^2 +1 -16y^4 +12y^2 \
        & = 20y^2 +1                     \
    $

    $20y^2 +1 >=0$ siempre se cumple para todos los $RR$

    _Rango:_ $RR$
  ][
    $f(x)=(x) / (|x|)$

    #fid $|x|=0; x=0$

    _Dominio:_ $RR\\{0}$

    Analizamos el comportamiento de la función en los casos:
    #list[
      $x>0$

      $|x|=x ==> f(x)=x / x=1$
    ][
      $x<0$

      $|x|=-x ==> f(x)=x / -x=-1$
    ]

    _Rango:_ ${-1,1}$
  ]
][
  Si $f(x)=3x^2+x-5$ Hallar

  #enum[
    $(f(x-2)-f(x)) / 2$

    $
      g(x) & = (f(x-2)-f(x)) / 2                        \
           & = ((3(x-2)^2+(x-2)-5) - (3x^2+x-5)) / 2    \
           & = (3(x^2-4x+ 4) +x -2 -5 -3x^2 -x +5) / 2  \
           & = (3x^2 -12x +12 +x -2 -5 -3x^2 -x +5) / 2 \
           & = (-12x +10) / 2                           \
           & = -6x +5                                   \
    $
  ][
    $(f(x+4)-f(x)) / (-4)$

    $
      g(x) & = (f(x+4)-f(x)) / (-4)                            \
           & = ( (3(x+4)^2+(x+4)-5)-(3x^2+x-5) ) / (-4)        \
           & = ( 3(x^2 +8x + 16) +x +4 -5 -3x^2 -x +5 ) / (-4) \
           & = ( 3x^2 +24x +48 +x +4 -5 -3x^2 -x +5 ) / (-4)   \
           & = ( 24x +52 ) / (-4)                              \
           & = -6x -13                                         \
    $
  ][
    $(f(x-h) - f(f)) / h$

    $
      g(x) & = (f(x-h) - f(x)) / h                            \
           & = ( (3(x-h)^2+(x-h)-5) - (3x^2+x-5) ) / h        \
           & = ( 3(x^2 -2x h +h^2) +x -h -5 -3x^2 -x +5 ) / h \
           & = ( 3x^2 -6x h +3h^2 +x -h -5 -3x^2 -x +5 ) / h  \
           & = ( -6x h +3h^2 -h ) / h                         \
           & = -6x +3h -1                                     \
    $
  ]
][
  Un asesor comercial cobra \$75.000 por una consulta inicial con duración de máximo una hora y \$100.000 por cada hora adicional dedicada al proyecto, exprese el cobro del asesor en función de la cantidad total de horas dedicadas al proyecto.

  $
    f(h) = 75000 + 100000h
  $
][
  // TODO:
  Exprese $y$ en función de $x$, como también el area del triangulo $Delta A B C$
][
  // TODO:
  Dada la función $g(x)=sqrt(x-2)$ trace la gráfica de las funciones:

  #enum[
    g_1(x)=g(x)+5/2
  ][
    g_2(x)=g(x+3)
  ][
    g_3(x)=g(x+2)-2
  ][
    g_4(x)=-3g(x)
  ]

  #image("9.svg")
][
  // TODO:
  Dada la función $h(t)=|t^2-3|$ trace la gráfica de las funciones:

  #enum[
    h_1(t)=h(t)-3
  ][
    h_2(t)=h(t+5)
  ][
    h_3(t)=h(t-2)+2
  ][
    h_4(t)=-h(t)
  ]
][
  // TODO:
  Un tanque de agua tiene forma de tanque circular recto, con una altura de $7$ metros y un radio de $3$ metros si el tanque se llena a una profundidad de $h$ metros y $x$ el radio sobre la superficie del agua, exprese el volumen de agua en el tan que en función de $x$.
][
  // TODO:
  Exprese el area del semicirculo en función del radio.
][
  // TODO:
  Se desea cortar un alambre de $30$cm de longitud, en dos partes, con una se forma un cuadrado y con la otra una circunferencia, exprese el area del cuadrado y de el circulo en función del lado del cuadrado.
]
