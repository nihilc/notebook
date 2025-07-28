#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *
#import "@preview/cetz:0.4.0"

// Defaults
#set text(lang: "es")
#set page(width: 20cm, height: auto)
#set heading(numbering: "1.1.")
// #set math.equation(numbering: "(1.1)")

// Custom commands
#let Box(content) = box(baseline: 1.5pt, rect(
  inset: 1.5pt,
  stroke: 0.5pt,
  content,
))
#let mcd = math.op("mcd", limits: true)
#let mcm = math.op("mcm", limits: true)

// Plugins
// great-theorems
#show: great-theorems-init
#let mathcounter = rich-counter(identifier: "mathblocks", inherited_levels: 1)

#let Definicion = mathblock(
  blocktitle: "Definicion",
  counter: mathcounter,
  inset: 5pt,
  fill: luma(233),
)
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
#let Ejemplo = mathblock(
  blocktitle: "Ejemplo",
  prefix: [_*Ejemplo*:_],
  inset: 5pt,
)

= Representaciones de Números Enteros

(Sección 2.5 libro Rosen)

Usualmente para representar números enteros usamos la notación decimal

#Ejemplo[
  $
    2586 & = 2 dot 10^3 + 5 dot 10^2 + 8 dot 10^1 + 6 dot 10^0 \
         & = 2000 + 500 + 80 + 6                               \
  $
]

#Definicion[
  Sea $b$ un entero positivo mayor 1, Sean $n$ un entero positivo cualquiera, entonces

  #math.equation(numbering: "(*)", block: true)[$
      n=a_k b^k + a_(k-1) b^(k-1) + dots + a_1b^1 + a_0b^0
    $]<eq>

  De forma única donde $k$ es un entero no negativo y $a_0,a_1,dots,a_k$ son enteros no negativos menores que $b$ y $a_k != 0$
]

A la representación @eq de $n$ se le llama expresión de $n$ en base $b$ y se representa por

$n_b=(a_x a_(x-1) dots a_1 a_0)_b$



== Conversion de base

El siguiente algoritmo permite obtener la expresión en base $b$ de un entero $n$.

Primero se divide $n$ por $b$ para obtener el cociente y el resto, esto es:
$ n = b q_0 + a_0; quad 0<=a_0<b $

El resto $a_0$, es el dígito situado mas a la derecha en la expresión en base $b$ de $n$. Luego se divide $q_0$ por $b$ para obtener

$ q_0 = b q_1 + a_1; quad 0<=a_1<b $

Vemos que $a_1$, es el segundo dígito por la derecha de la expresión de $n$ en base $b$. Este proceso continua dividiendo sucesivamente el cociente por $b$, obteniendo como restos los dígitos de la representación en base $b$. El proceso concluye cuando obtenemos un cociente igual a cero.


#Ejemplo[
  Halle el numero entero representado por $(314)_5$
  (Convierta el numero 314 en base 10 a base 5)

  $
        314 & = 5 dot 62 + #Box[4] \
         62 & = 5 dot 12 + #Box[2] \
         12 & = 5 dot 2 + #Box[2]  \
          2 & = 5 dot 0 + #Box[2]  \
                                   \
    (314)_5 & = 2224_5             \
  $

  También se puede mostrar como la descomposición del numero de la siguiente forma
  $
    314 & = 5(62) + 4                                                             \
        & = 5(5(12) + 2) + 4                                                      \
        & = 5(5(5#Box[(2) + 2) + 2) + 4]                                          \
        & = 5(5(2 dot 5^1 + 2) + 2) + 4                                           \
        & = 5(2 dot 5^2 + 2 dot 5^1 + 2) + 4                                      \
        & = #Box[2] dot 5^3 + #Box[2] dot 5^2 + #Box[2] dot 5^1 + #Box[4] dot 5^0 \
        & = 2224_5                                                                \
  $

  También se puede hacer mas visualmente por divisiones
  #image("ej-314.svg")
  $therefore (314)_5=2224$
]

#Ejemplo[
  Halle $1583$ en base $2,4,$ y $8$

  $
    1583 & = 2 dot 791 + 1 & 1583 & = 4 dot 395 + 3 & quad 1583 & = 8 dot 197 + 7 \
     791 & = 2 dot 395 + 1 &  395 & = 4 dot 98 + 3  &       197 & = 8 dot 24 + 5  \
     395 & = 2 dot 197 + 1 &   98 & = 4 dot 24 + 2  &        24 & = 8 dot 3 + 0   \
     197 & = 2 dot 98 + 1  &   24 & = 4 dot 6 + 0   &         3 & = 8 dot 0 + 3   \
      98 & = 2 dot 49 + 0  &    6 & = 4 dot 1 + 2   &                             \
      49 & = 2 dot 24 + 1  &    1 & = 4 dot 0 + 1                                 \
      24 & = 2 dot 12 + 0                                                         \
      12 & = 2 dot 6 + 0                                                          \
       6 & = 2 dot 3 + 0                                                          \
       3 & = 2 dot 1 + 1                                                          \
       1 & = 2 dot 0 + 1                                                          \
                                                                                  \
    1583 & = 11000101111_2 &      & = 120233_4      &           & = 3057_8        \
  $

  $
    1583 & = 2(791) + 1 \
    & = 2(2(395) + 1) + 1 \
    & = 2(2(2(197) + 1) + 1) + 1 \
    & = 2(2(2(2(98) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(49) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(24) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(12) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(2(6) + 0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(2(2(3) + 0) + 0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(2(2(2(1) + 1) + 0) + 0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(2(2(1 dot 2^1 + 1 dot 2^0) + 0) + 0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(2(1 dot 2^2 + 1 dot 2^1 + 0 dot 2^0) + 0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(2(1 dot 2^3 + 1 dot 2^2 + 0 dot 2^1 + 0 dot 2^0) + 0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(2(1 dot 2^4 + 1 dot 2^3 + 0 dot 2^2 + 0 dot 2^1 + 0 dot 2^0) + 1) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(2(1 dot 2^5 + 1 dot 2^4 + 0 dot 2^3 + 0 dot 2^2 + 0 dot 2^1 + 1 dot 2^0) + 0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(2(1 dot 2^6 + 1 dot 2^5 + 0 dot 2^4 + 0 dot 2^3 + 0 dot 2^2 + 1 dot 2^1 + 0 dot 2^0) + 1) + 1) + 1) + 1 \
    & = 2(2(2(1 dot 2^7 + 1 dot 2^6 + 0 dot 2^5 + 0 dot 2^4 + 0 dot 2^3 + 1 dot 2^2 + 0 dot 2^1 + 1 dot 2^0) + 1) + 1) + 1 \
    & = 2(2(1 dot 2^8 + 1 dot 2^7 + 0 dot 2^6 + 0 dot 2^5 + 0 dot 2^4 + 1 dot 2^3 + 0 dot 2^2 + 1 dot 2^1 + 1 dot 2^0) + 1) + 1 \
    & = 2(1 dot 2^9 + 1 dot 2^8 + 0 dot 2^7 + 0 dot 2^6 + 0 dot 2^5 + 1 dot 2^4 + 0 dot 2^3 + 1 dot 2^2 + 1 dot 2^1 + 1 dot 2^0) + 1 \
    & = 1 dot 2^10 + 1 dot 2^9 + 0 dot 2^8 + 0 dot 2^7 + 0 dot 2^6 + 1 dot 2^5 + 0 dot 2^4 + 1 dot 2^3 + 1 dot 2^2 + 1 dot 2^1 + 1 dot 2^0 \
    & = 11000101111_2 \
    \
    1583 & = 4(395)+3 \
    & = 4(4(98) + 3) + 3 \
    & = 4(4(4(24) + 2) + 3) + 3 \
    & = 4(4(4(4(6) + 0) + 2) + 3) + 3 \
    & = 4(4(4(4(4(1) + 2) + 0) + 2) + 3) + 3 \
    & = 4(4(4(4(1 dot 4^1 + 2 dot 4^0) + 0) + 2) + 3) + 3 \
    & = 4(4(4(1 dot 4^2 + 2 dot 4^1 + 0 dot 4^0) + 2) + 3) + 3 \
    & = 4(4(1 dot 4^3 + 2 dot 4^2 + 0 dot 4^1 + 2 dot 4^0) + 3) + 3 \
    & = 4(1 dot 4^4 + 2 dot 4^3 + 0 dot 4^2 + 2 dot 4^1 + 3 dot 4^0) + 3 \
    & = 1 dot 4^5 + 2 dot 4^4 + 0 dot 4^3 + 2 dot 4^2 + 3 dot 4^1 + 3 dot 4^0 \
    & = 120233_4 \
    \
    1583 & = 8(197)+7 \
    & = 8(8(24) + 5) + 7 \
    & = 8(8(8(3) + 0) + 5) + 7 \
    & = 8(8(3 dot 8^1 + 0 dot 8^0) + 5) + 7 \
    & = 8(3 dot 8^2 + 0 dot 8^1 + 5 dot 8^0) + 7 \
    & = 3 dot 8^3 + 0 dot 8^2 + 5 dot 8^1 + 7 dot 8^0 \
    & = 3057_8 \
  $
]

== Expresiones hexadecimal

#quote[La base principal usada en informática es la base 2, es decir la expresión binaria, los símbolos utilizados son $0$ y $1$. Otras bases también son las potencias de 2:$4,8,16$]

- Base 4: $0,1,2,3$
- Base 8 u octal: $0,1,2,3,4,5,6,7$
- Base 16 o hexadecimal: $0,1,2,3,4,5,6,7,8,9,A,B,C,D,F$

#Ejemplo[
  Halle $1543$ en base hexadecimal
  $
    1543 & = 16 dot 96 + 7 \
      96 & = 16 dot 6 + 0  \
       6 & = 16 dot 0 + 6  \
    1543 & = 607_16        \
  $
  $
    1543 & = 16(96) + 7                           \
         & = 16(16(6) + 0) + 7                    \
         & = 16(6 dot 16^1 + 0 dot 16^0) + 7      \
         & = 6 dot 16^2 + 0 dot 16^1 + 7 dot 16^0 \
         & = 607_16                               \
  $
]

#Ejemplo[
  Encuentre la expresión decimal de $n_16=9 C 1 A B$
  $
    n & = 9 dot 16^4 + 12 dot 16^3 + 1 dot 16^2 + 10 dot 16^1 + 11 dot 16^0 \
      & = 589824 + 49152 + 256 + 160 + 11                                   \
      & = 639403                                                            \
  $
]
