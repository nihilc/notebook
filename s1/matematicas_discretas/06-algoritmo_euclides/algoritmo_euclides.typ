#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

// Defaults
#set text(lang: "es")
#set page(width: 15cm, height: auto)
#set heading(numbering: "1.1.")
// #set math.equation(numbering: "(1.1)")

// great-theorems
#show: great-theorems-init
#let mathcounter = rich-counter(identifier: "mathblocks", inherited_levels: 1)

#let Definicion = mathblock(blocktitle: "Definicion", counter: mathcounter)
#let Teorema = mathblock(blocktitle: "Teorema", counter: mathcounter)
#let Lema = mathblock(blocktitle: "Lema", counter: mathcounter)
#let Prueba = mathblock(
  blocktitle: "Prueba",
  prefix: [_Prueba:_],
  suffix: [#h(1fr)$square$],
  inset: 5pt,
)
#let Pregunta = mathblock(blocktitle: "Pregunta", prefix: [_*Pregunta:*_])
#let Respuesta = mathblock(
  blocktitle: "Respuesta",
  prefix: [_Respuesta:_],
  inset: 5pt,
)

#let mcd = $op("mcd")$

= Algoritmo Euclides


#Lema[$forall a,b,q,r in ZZ and a=b q + r ==> mcd(a, b)=mcd(b, r)$]

#Prueba[
  Tenemos que

  $ a=b q+r \ r=a-b q $

  Probemos que $a$ y $b$ tienen los mismos divisores comunes que $b$ y $r$.\
  Así $mcd(a, b)=mcd(b, r)$

  #list[
    Supongamos que $d|a and d|b; quad d in ZZ$ \
    Luego por teorema $d|b q$ \
    Luego por teorema $d|(a-b q)$ \
    Ahora $r=a-b q$ \
    $therefore d|r$
  ][
    Supongamos que $d|b and d|r$ \
    Luego $d|(b q + r)$ \
    Ahora $a=b q+r$ \
    $therefore d|a$
  ]

  Por lo tanto hemos probado que cualquier divisor común de $b$ y $r$ también es divisor común de $a$ y $b$ \
  $therefore mcd(a, b)=mcd(b, r)$
]

== Ejemplos Algoritmo de Euclides

#Pregunta[Hallar el $mcd(287, 91)$]

#Respuesta[
  Dividir el mas grande entre el mas pequeño $287 div 91$, por algoritmo de la division $287=91 dot 3 + 14$.

  Fijémonos que cualquier divisor de $91$ y $287$ debe ser un divisor de $14=287-91 dot 3$ de modo que si $d$ es un divisor de $91$ y $287$ entonces

  $ 287=d dot q_1 and 91=d dot q_2 $

  Luego

  $
    14 & = 287-91 dot 3                \
       & = d dot q_1 - d dot q_2 dot 3 \
       & = d(q_1 - q_2 dot 3)          \
  $

  Es decir, $d$ es un divisor de $14$

  De igual forma se prueba que cualquier divisor de $91$ y $14$ debe ser un divisor de $287$

  Por lo tanto $mcd(287, 91)=mcd(91, 14)$

  Hallar $mcd(91, 14)$

  $
               91 & = 14 dot 6 + 7 \
    91 - 14 dot 6 & = 7            \
  $

  Cualquier divisor de $91$ y $14$ también divide a $7$ y cualquier divisor común de $14$ y $7$ divide a $91$, luego

  $ mcd(91, 14)=mcd(14, 7) $

  Y continua de la misma forma:

  $ 14=7 dot 2 $

  Luego $mcd(14, 7)=7$

  Por lo tanto

  $ mcd(287, 91)=mcd(91, 14)=mcd(14, 7)=7 $

  En conclusion, el algoritmo de Euclides para hallar el $mcd$ de dos enteros $a$ y $b$ utiliza divisiones sucesivas hasta que uno de los enteros se haga cero (residuo $0$)
]
