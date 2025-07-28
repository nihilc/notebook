#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

// Defaults
#set text(lang: "es")
#set page(width: 15cm, height: auto)
#set heading(numbering: "1.1.")
#set math.equation(numbering: "(1.1)")

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

= Mínimo Común Múltiplo

El mínimo común múltiplo de dos enteros positivos $a$ y $b$ es el menor entero positivo que es divisible tanto por a como por $b$ y se representa por $mcm(a, b)$

#Definicion[
  Sean $a,b in ZZ$. El menor entero $c$ tal que $a|c and b|c$ se llama máximo común divisor y se denota por $mcm(a, b)$
]

== Formas básicas de hallar el $mcm$

#Pregunta[ Hallar $mcm(9, 6)$ ]

=== Por múltiplos

Escribimos los múltiplos de $9$ y $6$ y resaltamos los comunes, elegimos el menor

Múltiplos de $9={0,9,#Box[18],27,#Box[36],45,dots}$ \
Múltiplos de $6={0,6,12,#Box[18],24,30,#Box[36],42,dots}$

$therefore mcm(9, 6)=18$

=== Por divisibilidad

$18$ es divisible por $9$, si porque $18=9 dot 2$\
$18$ es divisible por $6$, si porque $18=6 dot 3$

$therefore mcm(9, 6)=18$

== Forma avanzada de hallar el $mcm$

Lo mismo que la forma avanzada para hallar el $mcd$ pero en vez de buscar el exponente mínimo buscamos el máximo

Hallamos la descomposición en factores primos de $a$ y $b$ es decir:

$a = P_1^(m_1) dot P_2^(m_2) dot dots dot P_k^(m_k)$ \
$b = P_1^(n_1) dot P_2^(n_2) dot dots dot P_k^(n_k)$

Donde $P_1,P_2,dots,P_k$ son números primos y $m_1,m_2,dots,m_k$ y $n_1,n_2,dots,n_k$ son enteros no negativos. De modo que:

$mcd(a, b) = P_1^(max(m_1, n_1)) dot P_2^(max(m_2, n_2)) dot dots dot P_k^(max(m_k, n_k))$

#Pregunta[Hallar $mcm(9, 6)$]

#Respuesta[
  $
            9 & = 3^2     & = 2^0 dot 3^2 \
            6 & = 2 dot 3 & = 2^1 dot 3^1 \
    mcm(9, 6) & = 18      & = 2^1 dot 3^2 \
  $
]
