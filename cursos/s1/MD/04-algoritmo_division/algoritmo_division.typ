#import "@preview/cetz:0.4.0"
#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

// Defaults
#set text(lang: "es")
#set page(width: 15cm, height: auto)
#set heading(numbering: "1.1.")
#set math.equation(numbering: "(1.1)")

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

// Inicio de documento
= Algoritmo de la division

#Teorema[
  Sean $a,b in ZZ and b!=0$, Existe enteros únicos $q$ y $r$ con $0<r<=b$ tal que $a=b dot q + r$
]
#figure(cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0.5, 0), stroke: 0.5pt)
  line((0, 0), (0, 0.5), stroke: 0.5pt)

  content((-0.25, 0.25), name: "dividendo")[$a$]
  content((0.25, 0.25), name: "divisor")[$b$]
  content((-0.25, -0.25), name: "resto")[$r$]
  content((0.25, -0.25), name: "cociente")[$q$]

  content("dividendo", anchor: "east", padding: 0.5)[Dividendo]
  content("divisor", anchor: "west", padding: 0.5)[Dividendo]
  content("resto", anchor: "east", padding: 0.5)[Resto]
  content("cociente", anchor: "west", padding: 0.5)[Cociente]
}))

#Pregunta[Halle $q$ y $r$ para $a=94$ y $b=3$]

#Respuesta[
  $94=3 dot 31 + 1$ entonces $q=31$ y $r=1$

  #figure(cetz.canvas({
    import cetz.draw: *
    line((0, 0), (0.5, 0), stroke: 0.5pt)
    line((0, 0), (0, 0.5), stroke: 0.5pt)

    content((-0.25, 0.25), name: "dividendo")[$94$]
    content((0.25, 0.25), name: "divisor")[$3$]
    content((-0.25, -0.25), name: "resto")[$1$]
    content((0.25, -0.25), name: "cociente")[$31$]
  }))
]
