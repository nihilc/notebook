#set page(width: 15cm, height: auto)
#let Teorem(teorem) = {
  block(fill: luma(230), inset: 8pt, radius: 2pt)[
    *Teorema:* #teorem
  ]
}

= Números Primos

Todo numero entero positivo es divisible por $1$ y por si mismo \
Un entero positivo $p>1$ se llama primo si los únicos divisores positivos de $p$ sin $1$ y $p$ \
Si un entero positivo no es primo se llama compuesto

$PP={2,3,5,7,11,13,17,19,23,29,dots}$

#quote(block: true)[
  *Ejemplo:* Determine si un numero dado es primo o compuesto
  - $121$. Compuesto porque $11|121$
  - $53$. Primo porque $forall n (n in ZZ and n|53 ==> n=1 or n=53)$
  - $259$. Compuesto porque $7|259$
  - $641$. Primo porque $forall n (n in ZZ and n|641 ==> n=1 or n=641)$
]

== Teorema Fundamental de la Aritmética FTA

Todo entero positivo mayor que $1$ se puede escribir de forma única como un primo o como el producto de dos o mas primos, en el que los factores primos se escriben de forma no decreciente.

#quote(block: true)[
  *Ejemplo:* Descomponga en primos
  - $89=89$
  - $256=2^8$
  - $525=3 dot 5^2 dot 7$
  - $1000=2^3 dot 5^3$
]

== Teoremas

#list(spacing: 10pt)[
  #Teorem[Si $n$ es un entero compuesto entonces $n$ tiene un divisor primo menor o igual $sqrt(n)$]

  _*Demostración:*_

  Supongamos que $n$ es un entero compuesto.

  Es decir $exists k in ZZ and k!=1 and k!=n$ tal que $k|n$ de modo que $n=k dot l$ donde $l in ZZ$.

  Observemos que $k<=sqrt(n) and l<=sqrt(n)$, dado que si no fuera así, es decir si $k>sqrt(n) or l>sqrt(n)$ entonces $k dot l> sqrt(n) dot sqrt(n) ==> k dot l>n$ lo cual es falso

  Si $k$ es primo entonces queda probado que $n$ tiene un divisor primo menor o igual que $sqrt(n)$

  Si $k$ y $l$ no son primos entonces por el Teorema Fundamental de la Aritmética poseen al menos un divisor primo, y como $k$ o $l$ son menores o iguales que $sqrt(n)$ este divisor también lo sera.

  _*Ejemplo:*_

  Para saber si $817$ es primo o compuesto buscamos si es divisible por un entero menor o igual que $sqrt(817) approx 28.58$

  Buscamos los $PP<28 = {2,3,5,7,11,13,17,19,23}$

  Encontramos que $817=19 dot 43$ por lo que $817$ es compuesto

  _*Observe:*_

  Por el teorema anterior, si un entero positivo $n$ no tiene divisores primos menores o iguales que $sqrt(n)$ entonces $n$ es primo.
][
  #Teorem[Existen infinitos números primos]

  _*Demostración:* (por reducción al absurdo)_

  Supongamos que existen un numero finito de primos ${P_1,P_2,dots,P_n}$. Sea $Q=P_1 dot P_2 dot dots dot P_n + 1$

  Observe que $P_1,P_2,dots,P_n$ no son divisores de $Q$

  Ademas $Q$ puede ser primo o compuesto y por Teorema Fundamental de la Aritmética si $Q$ es compuesto se puede descomponer en factores primos

  - Si $Q$ fuera primo entonces $Q$ seria otro primo fuera de ${P_1,P_2,dots,P_n}$ lo cual no puede ocurrir.
  - Si $Q$ fuera compuesto debe existir algún $P_i in {P_1,P_2,dots,P_n}$ tal que $P_i|Q$ \
    Pero también $P_i|P_1 dot P_2 dot dots dot P_n$ \
    Luego $P_i|Q-P_1 dot P_2 dot dots dot P_n$ Es decir $P_i|1$
]

== Primos Relativos

Los enteros positivos $a$ y $b$ se llaman primos relativos si su mínimo común divisor $op("mcd")(a,b)=1$

Los enteros $a_1,a_2,dots,a_n$ son primos relativos dos a dos si $op("mcd")(a_i,a_j)=1$ para $i=1,2,dots,n$ y $j=1,2,dots,n$ con $i!=j$

_*Ejemplo:*_ $5,7,68,99$ son primos relativos dos a dos porque:

$
  & op("mcd")(5,7)   & = 1 \
  & op("mcd")(5,68)  & = 1 \
  & op("mcd")(5,99)  & = 1 \
  & op("mcd")(7,68)  & = 1 \
  & op("mcd")(7,99)  & = 1 \
  & op("mcd")(68,99) & = 1 \
$
