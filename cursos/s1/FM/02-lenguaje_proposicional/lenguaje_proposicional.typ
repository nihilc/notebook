#set table(stroke: 0.5pt)
#let T = text(green)[T]
#let F = text(red)[F]

= Lenguaje Posicional

Una proposición es una afirmación a la cual se puede decir que es *Verdadera* o *Falsa*

== Syntax

=== Proposiciones Atómicas

Son las mas sencillas que se puede construir y carecen de Conectivos Lógicos

Notación: $p,q,r,dots$

Ejemplos:

- $p: "El cielo es azul" checkmark "Atómica"$
- $q: "Hoy es lunes" checkmark "Atómica"$
- Hoy no hay clase
  - $r: "Hoy hay clase" checkmark "Atómica"$
  - $not r: "Hoy no hay clase" crossmark "Atómica"$

=== Proposiciones Moleculares

Son obtenidas a partir de Proposiciones Atómicas usando Conectivos lógicos

#list(
  list.item[
    Ejemplo:
    $
      "Si hoy es lunes va a lover" \
      p: "Hoy es lunes" \
      q: "Hoy va a llover" \
      p ==> q
    $
  ],
  list.item[
    Ejemplo:
    $
      "Como empanada y me voy a pie" \
      p: "Como empanada" \
      q: "Me voy a pie" \
      p and q
    $
  ],
  list.item[
    Ejemplo:

    En el siguiente ejemplo dependiendo de donde se encuentre la coma puede cambiar el como se usan los símbolos de agrupación o si no tuviera una coma seria ambiguo.
    $
      "Si tengo clase de fundamentos entonces hay quiz y no estudie" \
      p: "Tengo clase de fundamentos" \
      q: "Hay quiz" \
      r: "Estudié" \
      p ==> q and not r \
      \
      "Si tengo clase de fundamentos entonces hay quiz"#text(red)[*,*] "y no estudie" \
      (p ==> q) and not r \
      \
      "Si tengo clase de fundamentos entonces"#text(red)[*,*]" hay quiz y no estudie" \
      p ==> (q and not r)
    $
  ],
)


=== Formulas bien formadas (FBF o WFF)

+ Las Proposiciones atómicas son FBF
+ La negación de una FBF es una FBF $(not p)$
+ Si $p$ y $q$ sin FBF entonces $p and q, p or q, p ==> q, p <==> q$ son FBF
+ Si $x$ es una variable y $p(x)$ es una FBF entonces $(forall x)(p(x))$ y $(exists x)(p(x))$ son FBF \

Cualquier FBF debe obtenerse a partir de 1-4

== Semántica

Sentido de valor de una proposición True o False

=== Evaluar valor de verdad de una proposición

En lenguaje proposicional una proposición solamente puede tener dos valores #T (verdad/true) o #F (falso,false)

#list(
  list.item[
    Ejemplo:

    Evaluar los valores de verdad de la proposición "_Hoy es miércoles_"\
    Entonces si es verdad que "_Hoy es miércoles_" $p=#T$ mientras que si no es verdad que "_Hoy es miércoles_" $p=#F$

    Los valores de verdad de $p$ podrían ser:

    #align(center, table($p$, [#T], [#F]))
  ],
  list.item[
    Ejemplo:

    Evaluar los valores de verdad de la proposición "_Hoy no tengo clase entonces no estudié_"

    Como es una proposición molecular lo mas sencillo es siempre sacar las proposiciones atómicas (tener en cuenta que siempre deben ser verdaderas) y luego organizar los conectivos

    $
      p: "Hoy tengo clase" \
      q: "Estudié" \
      not p ==> not q
    $

    Ahora obtenemos todos los valores de verdad posibles de la proposición $not p ==> not q$

    #align(center, table(
      columns: 5,
      $p$, $q$, $not p$, $not q$, $not p ==> not q$,
      [#T], [#T], [#F], [#F], [#T],
      [#T], [#F], [#F], [#T], [#T],
      [#F], [#T], [#T], [#F], [#F],
      [#F], [#F], [#T], [#T], [#T],
    ))
  ],
)

=== Tablas de verdad

- Siendo $p$ una proposición atómica $p$ puede tomar un valor de #T o #F
- Siendo $p$ y $q$ proposiciones atómicas tenemos que

#align(center, table(
  columns: 7,
  $p$, $q$, $not p$, $p and q$, $p or q$, $p ==> q$, $p <==> q$,
  [#T], [#T], [#F], [#T], [#T], [#T], [#T],
  [#T], [#F], [#F], [#F], [#T], [#F], [#F],
  [#F], [#T], [#T], [#F], [#T], [#T], [#F],
  [#F], [#F], [#T], [#F], [#F], [#T], [#T],
))

=== Tautología

*Definición:* Una FBF es una tautología si su valor de verdad siempre es verdadero para cualquier valor de verdad de sus letras proposicionales.

#list[
  Ejemplo:

  La proposición $p or not p$ es una tautología porque siempre es verdadera
  #align(center, table(
    columns: 3,
    $p$, $not p$, $p or not p$,
    [#T], [#F], [#T],
    [#F], [#T], [#T],
  ))
]

=== Contradicción

*Definición:* Una FBF es una contradicción si su valor de verdad siempre es falso para cualquier valor de verdad de sus letras proposicionales

#list[
  Ejemplo:

  La proposición $p and not p$ es una contradicción porque siempre es falsa
  #align(center, table(
    columns: 3,
    $p$, $not p$, $p and not p$,
    [#T], [#F], [#F],
    [#F], [#T], [#F],
  ))
]

=== Equivalencia lógica

Si dos FBF tiene la misma valuación o los mismos renglones en su tabla de verdad se dice que las FBF son equivalentes.

*Definición:* Sean $a,b$ FBF. Se dice que $a$ es equivalente a $b$ notado por $a<==>b$ si $a<==>b$ es una tautología

#list[
  Ejemplo:

  El condicional $p==>q$ es equivalente a su variable contra-reciproca $not q ==> not p$
  #align(center, table(
    columns: 5,
    $p$, $q$, $p==>q$, $not q==>not p$, $(p==>q) <==> (not q==>not p)$,
    [#T], [#T], [#T], [#T], [#T],
    [#T], [#F], [#F], [#F], [#T],
    [#F], [#T], [#T], [#T], [#T],
    [#F], [#F], [#T], [#T], [#T],
  ))
]

=== Variables del condicional

#align(center, table(
  columns: 6,
  [], [], [Condicional], [Reciproca], [Contraria], [Contra-Reciproca],
  $p$, $q$, $p==>q$, $q==>p$, $not p==> not q$, $not q ==> not p$,
  [#T], [#T], [#T], [#T], [#T], [#T],
  [#T], [#F], [#F], [#T], [#T], [#F],
  [#F], [#T], [#T], [#F], [#F], [#T],
  [#F], [#F], [#T], [#T], [#T], [#T],
))

== Metalenguaje

Debido a la complejidad y dificultad de legibilidad al expresar algunas expresiones se utiliza un *metalenguaje* para facilitar su escritura, este comprende lenguaje proposicional junto con lenguaje natural y matemático

#list[
  Ejemplo:

  Si quisiéramos expresar "_n es primo_" lo podríamos hacer de alguna de las siguientes formas:

  $
    (forall n)(n in ZZ and n >1 and not(exists c)(c in ZZ and c>1 and c!=n and c|n)) \
    (forall n)(n>1 ==> not(exists a)(exists b)(1<a<n and 1<b<n and a b = n))
  $

  Ahora pensemos que tenemos una proposición que use numero primos ejemplo "Colo 2 y 3 son primos y 2 multiplicado por 3 es 6 entonces 6 no es primo" esto nos daría una proposición demasiado larga por lo que es mejor usar el metalenguaje

  $
    2 "primo" and 3 "primo" and 2 dot 3=6 ==> 6 "no primo"
  $
]
