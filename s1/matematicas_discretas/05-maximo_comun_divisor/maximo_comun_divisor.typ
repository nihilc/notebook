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

#let Teorema = mathblock(blocktitle: "Teorema", counter: mathcounter)
#let Definicion = mathblock(blocktitle: "Definicion", counter: mathcounter)
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

= Máximo Común Divisor

El mayor entero que divide a 2 enteros se llama máximo común divisor de estos enteros

#Definicion[
  Sean $a,b in ZZ$. El mayor entero $c$ tal que $c|a and c|b$ se llama máximo común divisor y se denota por $mcd(a, b)$
]

== Forma básica de hallar MCD

#Pregunta[Hallar $mcd(45, 120)$]
#Respuesta[
  $mcd(45, 120)=15$

  #let Box(content) = box(baseline: 1.5pt, rect(
    inset: 1.5pt,
    stroke: 0.5pt,
    content,
  ))
  Divisores de $45={#Box[1],#Box[3],9,#Box[15],45}$\
  Divisores de $120={#Box[1],2,#Box[3],4,5,6,8,10,12,#Box[15],20,24,30,40,60}$\
]

== Forma avanzada de hallar MCD

Hallamos la descomposición en factores primos de $a$ y $b$ es decir:

$a = P_1^(m_1) dot P_2^(m_2) dot dots dot P_k^(m_k) \
b = P_1^(n_1) dot P_2^(n_2) dot dots dot P_k^(n_k)$

Donde $P_1,P_2,dots,P_k$ son números primos y $m_1,m_2,dots,m_k$ y $n_1,n_2,dots,n_k$ son enteros no negativos. De modo que:

$mcd(a, b) = P_1^(min(m_1, n_1)) dot P_2^(min(m_2, n_2)) dot dots dot P_k^(min(m_k, n_k))$

#Pregunta[ Hallar $mcd(45, 120)$]

#Respuesta[
  $
              45 & = 3^2 dot 5       && = 2^0 dot 3^2 dot 5^1 \
             120 & = 2^3 dot 3 dot 5 && = 2^3 dot 3^1 dot 5^1 \
    mcd(45, 120) & = 15              && = 2^0 dot 3^1 dot 5^1 \
  $
]

== Algoritmo de Euclides para hallar $mcd(a, b)$

Sean $a$ y $b$ enteros positivo con $a>=b$

Aplicamos el algoritmo de la division sucesivamente

$
        a & = b q_1 + r_1               & quad & 0<=r_1<=b      \
        b & = r_1 q_2 + r_2             &      & 0<=r_2<=r_1    \
      r_1 & = r_2 q_3 + r_3             &      & 0<=r_3<=r_2    \
      r_2 & = r_3 q_4 + r_4             &      & 0<=r_4<=r_3    \
   dots.v                                                       \
  r_(n-3) & = r_(n-2) q_(n-1) + r_(n-1) &      & 0<=r_n<r_(n-1) \
  r_(n-2) & = r_(n-1) q_(n) + 0                                 \
$

Siguiendo este proceso hallamos una sucesión de residuos $r_1,r_2,dots,r_(n-2),r_(n-1),0$ y por el lema tenemos que $mcd(a, b)=mcd(b, r_1)=mcd(r_1, r_2)=dots=mcd(r_(n-2), r_(n-1))=mcd(r_(n-1), 0)=r_(n-1)$

Es decir $mcd(a, b)$ es el ultimo residuo no nulo de la sucesión de divisores

#Pregunta[Hallar $mcd(621, 512)$]

#Respuesta[
  $
                        621 & = 512 dot 1 + 109    \
                        512 & = 109 dot 4 + 76     \
                        109 & = 76 dot 1 + 33      \
                         76 & = 33 dot 3 + 10      \
                         33 & = 10 dot 3 + 3       \
                         10 & = 3 dot 3 + #rect[1] \
                          3 & = 1 dot 3 + 0        \
                                                   \
    therefore mcd(621, 512) & = mcd(512, 109)      \
                            & = mcd(109, 76)       \
                            & = mcd(76, 33)        \
                            & = mcd(33, 10)        \
                            & = mcd(10, 3)         \
                            & = mcd(3, 1)          \
                            & = 1                  \
  $
]

#Pregunta[Hallar $mcd(80, 44)$]

#Respuesta[
  $
                       80 & = 44 dot 1 + 36      \
                       44 & = 36 dot 1 + 8       \
                       36 & = 8 dot 4 + #rect[4] \
                        8 & = 4 dot 2 + 0        \
                                                 \
    therefore mcd(80, 44) & = mcd(44, 36)        \
                          & = mcd(36, 8)         \
                          & = mcd(8, 4)          \
                          & = 4                  \
  $
]
