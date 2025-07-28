= Negación de cuantificadores

== Cuantificador Universal

#quote([La negación de $forall$ es $exists$ seguido de la negación de la proposición])

*Afirmación:* "_Para todo $x$ se cumple $P(x)$_" \
En lenguaje de predicados: $(forall x)(P(x))$

*Negación:* "_No es cierto que, para todo $x$ se cumple $P(x)$_" $<==>$ $not (forall x)(P(x))$ \
Esto significa que existe al menos un elemento $x$ para el cual no se cumple $P(x)$. \
En lenguaje de predicados: $not (forall x)(P(x)) <==> (exists x)(not P(x))$

#list[
  Ejemplo:

  "_Para todo entero $a,b$ se cumple que $a+b$ también es entero_"
  $ (forall a)(forall b)(a in ZZ and b in ZZ ==> a+b in ZZ) $

  "_No es cierto que, para todo entero $a,b$ se cumple que $a+b$ también es entero_"
  $ not (forall a)(forall b)(a in ZZ and b in ZZ ==> a+b in ZZ) \
  (exists a)(exists b)(not (a in ZZ and b in ZZ ==> a+b in ZZ)) \
  (exists a)(exists b)(a in ZZ and b in ZZ and not (a+b in ZZ)) \
  (exists a)(exists b)(a in ZZ and b in ZZ and a+b in.not ZZ) \ $

  En lenguaje natural: "_Exists algún entero $a,b$ tal que $a+b$ no es un entero_"
],

== Cuantificador Existencial

#quote([La negación de $exists$ es $forall$ seguido de la negación de la proposición])

*Afirmación:* "_Existe $x$, tal que se cumple $P(x)$_" \
En lenguaje de predicados: $(exists x)(P(x))$

*Negación:* "_No es cierto que, existe $x$, tal que se cumple $P(x)$_" \
Esto significa que para ningún elemento $x$ se cumple $P(x)$, o equivalentemente para todos los elementos $x$ no se cumple $P(x)$ \
En lenguaje de predicados: $not (exists x)(P(x)) <==> (forall x)(not P(x))$

#list[
  Ejemplo:

  "_Existe un numero natural $n$ tal que $n$ es mayor que $10$_"
  $ (exists n)(n in ZZ and n>10) $

  "_No es cierto que, existe un numero natural $n$ tal que $n$ es mayor que $10$_"
  $
    not (exists n)(n in ZZ and n>10) \
    (forall n)(not (n in ZZ and n>10)) \
    (forall n)(not n in ZZ or not n>10)) \
    (forall n)(n in.not ZZ or n lt.eq 10) \
  $
  En lenguaje natural: "_Para todo $x$, $x$ no es entero o x es menor o igual que 10_"
]
