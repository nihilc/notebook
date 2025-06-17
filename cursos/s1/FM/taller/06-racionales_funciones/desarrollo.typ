#set page(width: 20cm, height: auto)
#set enum(numbering: "1.a", spacing: 10pt)

#let finish = align(right, pad(bottom: 4pt, square(width: 8pt)))

= Taller

#enum()[
  $ZZ$

  $-1 = 1-2 = 2-3 = 3-4 \ -2 = 1-3 = 2-4 = 3-5$ \

  $ 1-2 = 2-3 <==> 1+3 = 2+2 $

  Tenga el conjunto $B={(m,n) in NN times NN}$

  Definimos la relación $(m,n) ~ (p,q) <==> m+q = n+p$

  Compruebe si $~$ es equivalencia
][
  $QQ$

  $1 / 2=2 / 4=3 / 6=4 / 8= dots$

  $ 1 / 2=2 / 4 <==> 1 dot 4 = 2 dot 2 $

  Tenga el conjunto $A={(m,n) in ZZ times ZZ^\# } quad ZZ^\# = ZZ - {0}$

  Definimos la relación $(m,n) ~ (p,q) <==> m q = n p$

  Compruebe si $~$ es equivalencia
][
  Halle dominio y rango de las siguientes funciones
  #enum[
    $f(x)= sqrt(x^2+x-6)$
  ][
    $f(x)= ln x$
  ][
    $f(x)=cos x$
  ][
    $f(x)=(x-1) / (x^2-1)$
  ]
]

= Desarrollo

#list[
  $R$ es *reflexiva* si y solo si $forall a (a in A --> a R a)$
][
  $R$ es *simétrica* si y solo si $forall a forall b (a,b in A and a R b --> b R a)$
][
  $R$ es *transitiva* si y solo si $forall a forall b forall c (a,b,c in A and a R b and b R c --> a R c)$
][
  $R$ es *antisimétrica* si y solo si $forall a forall b (a,b in A and a R b and b R a --> a = b)$
]

#enum[
  $B={(x,y) in NN times NN}$

  $R={(a,b),(c,d) in B | a+d=b+c}$

  #list(marker: $checkmark$)[
    $R "es reflexiva" <==> forall (a,b) ((a,b) in B ==> (a,b)R(a,b))$

    $
      (a,b)R(a,b) & <==> a+b = b+a \
                  & <==> a+b = a+b \
    $
  ][
    $R "es simétrica" <==> forall(a, b) forall(c, d) ( (a,b),(c,d) in B and (a,b)R(c,d) ==> (c,d)R(a,b) )$

    $
      (a,b)R(c,d) & <==> a+d = b+c   \
                  & <==> d+a = c+b   \
                  & <==> c+b = d+a   \
                  & <==> (c,d)R(a,b) \
    $

  ][
    $R "es transitiva" <==> forall(a, b) forall(c, d) forall(m, n)((a,b),(c,d)(m,n) in B and (a,b)R(c,d) and (c,d)R(m,n) ==> (a,b)R(m,n) )$

    #set math.equation(numbering: "(1)", number-align: bottom)
    #counter(math.equation).update(0)

    $ (a,b)R(c,d) & <==> a+d = b+c $
    $ (c,d)R(m,n) & <==> c+n = d+m $

    Sumamos (1) y (2)
    $
                      (a+d) + (c+n) & = (b+c) + (d+m)                 \
      a + cancel(d) + cancel(c) + n & = b + cancel(c) + cancel(d) + m \
                                a+n & = b+m                           \
    $

    Ahora con (3) vemos que
    $
      a+n & = b+m <==> (a,b)R(m,n)
    $
  ]

  $R "es una relacion de equivalencia"$
  #finish
][
  $A={(x,y) in ZZ times ZZ^\#} quad ZZ^\#=ZZ-{0}$

  $R={(a,b),(c,d) in A | a d=b c}$

  #list(marker: $checkmark$)[
    $R "es reflexiva" <==> forall(a, b)( (a,b) in A ==> (a,b)R(a,b))$

    $
      (a,b)R(a,b) & <==> a b = b a \
                  & <==> a b = a b \
    $
  ][
    $R "es simétrica" <==> forall(a, b) forall(c, d) ( (a,b),(c,d) in A and (a,b)R(c,d) ==> (c,d)R(a,b) )$

    $
      (a,b)R(c,d) & <==> a d = b c   \
                  & <==> d a = c b   \
                  & <==> c b = d a   \
                  & <==> (c,d)R(a,b) \
    $
  ][
    $R "es transitiva" <==> forall(a, b) forall(c, d) forall(m, n) ( (a,b),(c,d),(m,n) in A and (a,b)R(c,d) and (c,d)R(m,n) ==> (a,b)R(m,n) )$

    #set math.equation(numbering: "(1)", number-align: bottom)
    #counter(math.equation).update(0)

    $ (a,b)R(c,d) & <==> a d = b c $
    $ (c,d)R(m,n) & <==> c n = d m $

    Multiplicamos (1) y (2)

    $
                   (a d)(c n) & = (b c)(d m)              \
      a cancel(d) cancel(c) n & = b cancel(c) cancel(d) m \
                          a n & = b m                     \
    $

    Ahora con (3) vemos que

    $
      a n & = b m <==> (a,b)R(m,n)
    $
  ]
  $R "es una relacion de equivalencia"$
  #finish
][
  Halle Dominio y Rango de las siguientes funciones
  #enum[
    $f(x)= sqrt(x^2+x-6)$

    _Dominio_
    $
         x^2+x-6 & >= 0 \
      (x-2)(x+3) & >= 0 \
    $
    $
      (x-2>=0 and x+3>=0) & or (x-2<=0 and x+3<=0) \
         (x>=2 and x>=-3) & or (x<=2 and x<=-3)    \
            [2, infinity) & union (-infinity, -3]  \
    $
    El dominio es $[2, infinity) union (-infinity, -3]$ \

    _Rango_
    $
        y & = sqrt(x^2+x-6) \
      y^2 & = x^2+x-6       \
        0 & = x^2+x-y^2-6   \
    $
    El rango es $[0,infinity)$
  ][
    $f(x)= ln x$

    _Dominio_
    $
      x>0 \
      (0,infinity)
    $
    El dominio es $(0,infinity)$

    _Rango_
    $
      y=ln x \
      e^y = x
    $
    El rango es $RR$
  ][
    $f(x)=cos x$

    _Dominio_ $RR$

    _Rango_ $[-1,1]$
  ][
    $f(x)=(x-1) / (x^2-1)$

    _Dominio_

    Miramos cuando se índetermina la función
    $
      x^2 -1 = 0 \
      x^2=1 \
      x=cases(1 \ -1)
    $
    El dominio de la función es $RR-{-1,1}$

    _Rango_

    Simplificamos teniendo en cuenta $x-1!=0$ osea cuando $x=1$
    $
            y & = (x-1) / (x^2-1)      \
              & = (x-1) / ((x-1)(x+1)) \
              & = 1 / (x+1)            \
      y x + y & = 1                    \
            x & = (1 -y ) / y          \
    $
    Vemos que el en el rango no puede estar $y=0$ y ademas excluimos el caso cuando $x=1$
    $
      f(1)=1 / (1+1)=1 / 2
    $
    El rango de la funcion es $RR-{0,1 / 2}$

  ]
]
