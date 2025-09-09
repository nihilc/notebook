#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 08, day: 25).display()

== Principio del buen orden | PBO

#definition[Principio del buen orden][
  Todo subconjunto no vació de los números naturales tiene mínimo
]<def:PBO>

== Algoritmo de la division
#algorithm[Algoritmo de la division][
  Sean $a,b in ZZ$ con $b>0$. Entonces existen $q,r in ZZ$ únicos tal que:
  $ a= b q + r, quad 0<= r < b $
]<alg:division>

#example[@alg:division][
  - $-3,7: quad -3=7(-1)+4, quad 0<=4<7$
  - $0,6: quad 0=6(0)+0, quad 0<=0<6$
]

#proof[@alg:division][

  Sea $S={a-b x: x in ZZ and a-b q >=0} subset.eq NN$

  Comprobamos que $S!=emptyset$
  #list[
    Si $a>=0$: \
    Sea $x=-1$, entonces $a-b(-1)=a+b$, ahora $a+b>=0$, tal que $a-b(-1) in S$
  ][
    Si $a<0$: \
    $
      a- b a=a(1-b) quad cases(
        b=0 ==> & a(1-b)=0,
        b >1 ==> & 1-b < 0
      )
    $
    $ 1-b < 0 and a<0 ==> a(1-b)>=0 $
    Como $a-b a >=0 ==> a-b a in S$
  ]

  Como $S$ es un subconjunto no vació de $NN$ por el #link(<def:PBO>)[PBO], $S$ tiene mínimo.\ Sea $r=min(S)$. Luego, existe $q in ZZ$ tal que $a-b q=r ==> a=b q + r$

  Comprobamos unicidad de $q,r$
  - Como el mínimo es único, $r$ es único.
  - Supongamos que existe $q' in ZZ$, tal que $a-b q' = r$
    $
      cases(reverse: #true, a-b q=r, a-b q'=r) quad a-b q & = a-b q' \
      a-b q & = a-b q' \
      -b q & = -b q' \
      0 & = b q - b q' \
      0 &= b(q-q') quad cases(b=0 #text(fill: red)[Falso], q-q'=0 ==> #rect[$q=q'$])
    $
]

== Principio de inducción matemática (débil) | PIM(D)

#definition[PIM(D)][
  Sea $S subset.eq NN$ que satisface

  #enum(number-align: bottom)[
    $overbracket(0 in S, "Paso base")$
  ]
  #enum(number-align: horizon, start: 2)[
    $overbracket(underbracket(n in S, "HI") ==> n+1 in S, "Paso Inductivo")$
  ]
  Entonces $S=NN$
]<def:PIM_D>

#example[@def:PIM_D][
  $ 1+r+r^2+dots+r^n = (1-r^(n+1))/(1-r), quad r in RR\\{1} $
  $$

  #proof[
    Prueba por inducción matemática

    $ S = {n in NN: 1+r+r^2+dots+r^n = (1-r^(n+1))/(1-r)} $

    #enum[
      Paso Base

      $ r^0=1=(1-r^(0+1))/(1-r)=(1-r)/(1-r) ==> 0 in S $
    ][
      Paso Inductivo:

      Supongamos que $n in S$, es decir
      $ 1+r+r^2+dots+r^n = (1-r^(n+1))/(1-r) quad "(HI)" $
      Ahora verificamos comprobamos para $n+1$
      $
        underbracket(1+r+r^2+dots+r^n, "HI") + r^(n+1) & = (1-r^((n+1)+1))/(1-r) \
        (1-r^(n+1))/(1-r) + r^(n+1) & = (1-r^(n+2))/(1-r) \
        (1-r^(n+1) + (1-r)r^(n+1))/(1-r) & = (1-r^(n+2))/(1-r) \
        ( 1 - cancel(r^(n+1)) + cancel(r^(n+1)) - r^(n-2) )/(1-r) & = (1-r^(n+2))/(1-r) \
        ( 1 - r^(n-2) )/(1-r) & = (1-r^(n+2))/(1-r) \
      $
      Entonces $n+1 in S$
    ]
    Por lo tanto $S=NN$
  ]
]

#example[@def:PIM_D][
  $ 3|n^3-n $

  Sea $S={n in ZZ: 3|n^3-n}$

  #enum[
    Paso Base

    $0^3-0=0 and 3|0 ==> 0 in S$
  ][
    Paso Inductivo

    Supongamos que $n in S ==> 3|n^3-n$

    Verificamos para $n+1$

    $
      (n+1)^3-(n+1) & = n^3+3n^2+3n+cancel(1)-n-cancel(1) \
                    & = n^3 -n+3n^2+3n                    \
                    & = (n^3 -n)+3(n^2+n)                 \
    $
    $overbracket(3|n^3-n, "Por HI") and 3|3(n^2-n) & ==> 3|(n^3-n)+3(n^2-n)$

    Luego $n+1 in S$
  ]
  Por lo tanto $S=NN$
]

