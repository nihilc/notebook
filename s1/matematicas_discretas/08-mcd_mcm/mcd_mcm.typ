#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

// Defaults
#set text(lang: "es")
#set page(width: 15cm, height: auto)
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
#let Ejemplo = mathblock(
  blocktitle: "Ejemplo",
  prefix: [_Ejemplo:_],
  inset: 5pt,
)

= MCD y MCM

#Teorema[
  $a,b in ZZ^+ ==> a b = mcd(a, b) dot mcm(a, b)$
]

#Prueba[
  Realizamos la descomposición de $a$ y $b$ en factores primos:

  $a = P_1^(a_1) dot P_2^(a_2) dots.c P_n^(a_n)$\
  $b = P_1^(b_1) dot P_2^(b_2) dots.c P_n^(b_n)$

  Donde $P_1,P_2,dots,P_n$ son primos y $a_1,a_2,dots,a_n$ y $b_1,b_2,dots,b_n$ son enteros positivos. Ahora

  $mcd(a, b) = P_1^(min(a_1, b_1)) dot P_2^(min(a_2, b_2)) dots.c P_n^(min(a_n, b_n))$\
  $mcm(a, b) = P_1^(max(a_1, b_1)) dot P_2^(max(a_2, b_2)) dots.c P_n^(max(a_n, b_n))$

  Luego

  $
    mcd(a, b) dot mcm(a, b) &= [P_1^(min(a_1, b_1)) dot P_2^(min(a_2, b_2)) dots.c P_n^(min(a_n, b_n))] \
    & quad dot [P_1^(max(a_1, b_1)) dot P_2^(max(a_2, b_2)) dots.c P_n^(max(a_n, b_n))] \
    & = P_1^(a_1+b_1) dot P_2^(a_2+b_2) dots.c P_n^(a_n+b_n) \
    & = P_1^(a_1)P_1^(b_1) dot P_2^(a_2)P_2^(b_2) dots.c P_n^(a_n)P_n^(b_n) \
    & = (P_1^(a_1) dot P_2^(a_2) dots.c P_n^(a_n)) dot (P_1^(b_1) dot P_2^(b_2) dots.c P_n^(b_n)) \
    & = a dot b
  $
]

#Ejemplo[
  Verifique teorema con $a=18$ y $b=24$

  $
             18 & = 2^1 dot 3^2     \
             24 & = 2^3 dot 3       \
    mcd(18, 24) & = 2^1 dot 3^1 = 6 \
    mcm(18, 24) & = 2^3 dot 32 = 72 \
  $

  $therefore mcd(18, 24) dot mcm(18, 24)=6 dot 72=432=18 dot 24 = a dot b$
]
