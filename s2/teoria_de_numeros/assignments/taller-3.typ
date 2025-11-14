/// Packages
#import "@preview/cetz:0.4.2"

/// Variables
#let lang = "ES"
#let data = (
  title: "Taller 2",
  author: (
    (name: "Christian Mauricio Cardenas Baron", id: "20251167009"),
  ),
  date: datetime(year: 2025, month: 11, day: 6),
  course: "Teoría de Números",
  professor: "Carlos Andres Giraldo Hernandez",
  faculty: "Facultad de Ciencias Matemáticas y Naturales",
  university: "Universidad Distrital Francisco José de Caldas",
)
#let font = (
  main: "IBM Plex Sans",
  math: "IBM Plex Math",
  mono: "IBM Plex Mono",
  size: 12pt,
)
#let theme = (
  light: (
    fg: rgb("#000"),
    bg: rgb("#fff"),
    bg-raw: rgb("#f0f0f0"),
  ),
  dark: (
    fg: rgb("#DCD7BA"),
    bg: rgb("#1f1f28"),
    bg-raw: rgb("#2A2A37"),
  ),
)
#let color = theme.dark

/// Configuration

// General
#set document(title: data.title, author: data.author.at(0).name, date: auto)
#set page(paper: "a4")

// Numbering
#set heading(numbering: "1.")
//#set math.equation(numbering: "(1)")

// Fonts
#set text(lang: lang, font: font.main, size: font.size)
#show math.equation: set text(font: font.math, size: font.size)
#show raw: set text(font: font.mono)

// Colors
#set page(fill: color.bg)
#set text(fill: color.fg)
#show raw.where(block: false): body => box(
  fill: color.bg-raw,
  inset: (x: 3pt, y: 1pt),
  outset: (x: 0pt, y: 2pt),
  radius: 2pt,
  {
    set par(justify: false)
    body
  },
)
#show raw.where(block: true): body => block(
  width: 100%,
  fill: color.bg-raw,
  outset: (x: 0pt, y: 4pt),
  inset: (x: 8pt, y: 4pt),
  radius: 2pt,
  {
    set par(justify: false)
    body
  },
)
#show link: set text(fill: blue)
#set line(stroke: 1pt + color.fg)
#set rect(stroke: 1pt + color.fg)
#set square(stroke: 1pt + color.fg)
#set table(stroke: 1pt + color.fg)

// Style
#set page(header: context {
  if counter(page).get().at(0) > 1 {
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [#data.title - #data.course], [#(counter(page).get().at(0) - 1)],
    )
    line(length: 100%)
  }
})
#show heading: set block(spacing: 1em)
#set list(spacing: 1em, indent: 0pt, marker: "•", tight: false)
#set enum(
  spacing: 1em,
  indent: 0pt,
  numbering: "1ai)",
  full: false,
  tight: false,
)

/// Environments
#let custom-box(
  title: "Title",
  sub-title: none,
  separator: ":",
  body: [],
  qed: false,
  ..args,
) = {
  let pa = args.pos()
  let num-pas = pa.len()
  let sub-title = if num-pas == 2 { pa.at(0) }
  let body = if num-pas > 0 { pa.at(num-pas - 1) }
  block(width: 100%, breakable: true, {
    set align(left)
    text(style: "oblique", weight: "bold", {
      if sub-title == none [
        #title;#separator
      ] else [
        #title #text(weight: "regular")[(#sub-title)];#separator
      ]
    })
    pad(left: 1em, top: -0.25em, bottom: 0.5em, {
      body
      if qed {
        h(1fr)
        box(square(size: 0.5em, radius: 1pt))
      }
    })
  })
}
#let proof = custom-box.with(title: "Demostración", qed: true)
#let theorem = custom-box.with(title: "Teorema")
#let definition = custom-box.with(title: "Definición")
#let algorithm = custom-box.with(title: "Algoritmo")
#let proposition = custom-box.with(title: "Proposición")
#let lemma = custom-box.with(title: "Lema")
#let corollary = custom-box.with(title: "Corolario")

/// Custom math functions
#let cong(n) = math.attach(math.equiv, br: n)

/// Content

// Title
#align(center + top, {
  v(25%)
  text(2em, weight: 500)[#data.title - #data.course]
  v(4em, weak: true)
  for author in data.author {
    par[#author.name\ #author.id]
  }
  v(40%)
  par(data.professor)
  par(data.faculty)
  par(data.university)
  par(data.date.display())
})
#pagebreak()

// Content
#set page(height: auto)

#counter(heading).update(1)
= Divisibilidad
#counter(heading).update((2, 4))
== Mínimo Común Múltiplo

*Ejercicios:* // TODO:  3,5,7,10,11.

#enum(
  enum.item(3)[
    Probar que $(a,b)=(a+b,[a,b])$
  ],
  enum.item(5)[
    Si $k$ es múltiplo de $a$ y $b$, probar que $ (|k|)/((k/a,k/b))=[a,b] $
  ],
  enum.item(7)[
    Sean $d$ y $g$ enteros positivos. Probar que existen enteros $a$ y $b$ tales que $(a,b)=d$ y $[a,b]=g$ si y solo si $d|g$
  ],
  enum.item(10)[
    Hallar enteros $a$ y $b$ tales que $a+b=216$ y $[a,b]=480$
  ],
  enum.item(11)[
    Hallar todos los números $a$ y $b$ que satisfacen $(a,b)=24$ y $[a,b]=1440$
  ],
)



#counter(heading).update(3)
= Congruencias
== Definición y Propiedades Básicas

*Ejercicios:* // TODO: 4,6,8,10

#enum(
  enum.item(2)[
    Probar que si $a c cong(c n) b c$ entonces $a cong(n) b$
    #proof[
      $
        a c cong(c n) b c & ==> &         c n & | a c - b c                         \
                          & ==> & cancel(c) n & | cancel(c) (a-b)                   \
                          & ==> &           n & | a-b             & ==> a cong(n) b \
      $
    ]
  ],
  enum.item(4)[
    Probar que $3^105 + 4^105 cong(13) 0$
  ],
  enum.item(6)[
    Si $p$ es un primo impar probar que:
    #enum(numbering: "a)")[
      $1+2+3+dots+(p-1) cong(p) 0$
    ][
      $1^2+2^2+3^2+dots+(p-1)^2 cong(p) 0$
    ][
      $1^3+2^3+3^3+dots+(p-1)^3 cong(p) 0$
    ]
  ],
  enum.item(8)[
    Si $f(x)$ es un polinomio con coeficientes enteros y $f(a) cong(n) k$ probar que para todo entero $t$, $f(a+t n) cong(n) k$
  ],
  enum.item(10)[
    Hallar el dígito de las unidades de los números $13^13$ y $(5)(7)^29+(8)(9)^72$
  ],
)



== Criterios de Divisibilidad

*Ejercicios:* // TODO: 1,2,3,4,5

#enum(
  enum.item(1)[
    Sea $n=a_0+a_1 10 + a_2 10^2 + dots + a_k 10^k$ la representación decimal del entero positivo $n$. Probar que $n$ es divisible por $11$, si y solo si $sum_(i=0)^k (-1)^i a_i$ es divisible por 11
  ],
  enum.item(2)[
    A partir de la relación $10^3 cong(7) -1$, deducir un criterio de Divisibilidad por $7$.
  ],
  enum.item(3)[
    Probar que $6|n$ si y solo si $2|n$ y $3|n$.
  ],
  enum.item(4)[
    Con las notaciones del ejercicio 1, probar que $8|n$ si y solo si $8|(100 a_2 + 10 a_1 + a_0)$
  ],
  enum.item(5)[
    Expresando los enteros positivos en el sistema de numeración con base $100$, deducir un criterio de divisibilidad por $101$.
  ],
)
