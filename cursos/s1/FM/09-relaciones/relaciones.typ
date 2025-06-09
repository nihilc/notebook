= Relaciones

*Definición:* Sean $A,B$ dos conjunto. El *producto (cartesiano)* de $A$ y $B$ es el conjunto de parejas ordenadas $A times B = {(a,b): a in A and b in B}$ Una relación $R$ de $A$ en $B$ es un subconjunto de $A times B: R subset.eq A times B$.

*Definición:* El *dominio* y el *codominio* de una relación $R subset.eq A times B$ se definen, respectivamente, como el subconjunto de elementos de $A$ relacionados con algún elemento de $B$, y como el subconjunto de elementos de $B$ relacionados con algún elemento de $A$. Utilizando los conectivos y los cuantificadores. $op("dom")(R) = {a: a in A and exists b (b in B and (a,b) in R)}$, $op("cod") = {b; b in B and exists a (a in A and (a,b) in R)}$

*Definición:* Sea $R$ una relación sobre un conjunto $A (R subset.eq A times A)$ ($A$ finito o infinito). Para mayor comodidad en la notación, denotamos $a R b$ cada vez que se tenga $(a,b) in R$ Diremos que

#list[
  $R$ es *reflexiva* si y solo si $forall a (a in A --> a R a)$
][
  $R$ es *simétrica* si y solo si $forall a forall b (a,b in A and a R b --> b R a)$
][
  $R$ es *transitiva* si y solo si $forall a forall b forall c (a,b,c in A and a R b and b R c --> a R c)$
][
  $R$ es *antisimétrica* si y solo si $forall a forall b (a,b in A and a R b and b R a --> a = b)$
]

#quote(block: true)[
  _Relaciones de Equivalencia_ son aquellas que cumplen con *reflexividad, simetría y transitividad*
]

#quote(block: true)[
  _Relaciones de Orden_ son aquellas que cumplen con *reflexividad, antisimetría y transitividad*
]
