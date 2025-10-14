/// Variables
#let lang = "ES"
#let data = (
  title: "Parcial 1.2",
  author: (
    (name: "Christian Mauricio Cardenas Baron", id: "20251167009"),
    (name: "Diego Andrés Capera Saenz", id: "20251167019"),
  ),
  date: datetime(year: 2025, month: 10, day: 16),
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
#let color = (
  fg: rgb("#dcd7ba"), // #dcd7ba
  bg: rgb("#1f1f28"), // #1f1f28
  bg-raw: rgb("#2a2a37"), // #2a2a37
)

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
#set list(spacing: 1em, indent: 2pt, marker: "•")
#set enum(spacing: 1em, indent: 2pt, numbering: n => emph[#n)], full: false)

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
    pad(x: 0.5em, {
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

= Taller

#enum[
  Defina MCM de dos números y explique la importancia de la necesidad de las hipótesis.

  #definition[Mínimo Común Múltiplo][
    Sean $a,b in ZZ$, ambos diferentes de cero, se tiene un múltiplo común $c$, si $a|c$ y $b|c$. El menor de los múltiplos comunes positivos recibe el nombre de _mínimo común múltiplo_, y se denota por $[a,b]$
  ]
  Podemos identificar dos hipótesis principales:
  #enum(numbering: "i)")[
    Se toman $a$ y $b$ distintos de cero.

    Si se toma $a=0$. El único múltiplo de $a$ es $0$, por lo tanto limitaría los múltiplos comunes de $a,b$ solamente a ${0}$, pero $0$ no es positivo por lo tanto no cumpliría la segunda hipótesis, entonces no se tendría un mínimo común múltiplo.

    "El razonamiento es análogo para $b=0$"
  ][
    Se toma el menor de los múltiplos comunes *positivos*:

    Esto se debe a que el conjunto de múltiplos comunes de $a,b$ tiene una cantidad infinita de enteros positivos y negativos, Si no se limita a los positivos no abría un menor ya que el conjunto se extiende hasta $-infinity$
  ]
][
  Ejemplifique y demuestre el método usado.

  #custom-box(title: "Ejemplo")[
    $[15,20] & = 2^2 dot 3^1 dot 5^1 = 60 \
         15 & = 2^0 dot 3^1 dot 5^1      \
         20 & = 2^2 dot 3^0 dot 5^1      \ $

    #proof[MCM por descomposición en factores primos][
      Sea $a,b in ZZ$ ambos distintos de cero, por Teorema Fundamental de la Aritmética:

      $|a|=product_(i=1)^n P_i^(alpha_i) quad
      |b|=product_(i=1)^n P_i^(beta_i) quad$
      Donde $P_i$ son primos y $alpha_i,beta_i in ZZ_(>=0)$

      Sea $m=product_(i=1)^n P_i^(max(alpha_i, beta_i))$.

      Para que $[a,b]=m$, se debe cumplir:

      #enum[
        $a|m$ y $b|m$

        Fijamos un primo $P_i$.
        - para $a$ el exponente de $P_i$ es $alpha_i$
        - para $b$ el exponente de $P_i$ es $beta_i$
        - para $m$ el exponente de $P_i$ es $max(alpha_i, beta_i)$

        Como $alpha_i<=max(alpha_i, beta_i)$, entonces $P_i^alpha_i | P_i^max(alpha_i, beta_i)$

        Como $beta_i<=max(alpha_i, beta_i)$, entonces $P_i^beta_i | P_i^max(alpha_i, beta_i)$.

        Ademas esto se tiene para cada $P_i$, entonces:

        $
          product_(i=1)^n P_i^alpha_i &| product_(i=0)^n P_i^max(alpha_i, beta_i) &&and
          product_(i=1)^n P_i^beta_i &&| product_(i=0)^n P_i^max(alpha_i, beta_i) \
          a&|m &&and &b&|m
        $
      ][
        Para cualquier entero $k$ si $a|k$ y $b|k$, entonces $m|k$

        Sea $k in ZZ$ tal que $a|k$ y $b|k$, se toma la descomposición de $k$ en los mismos factores primos que $a,b$
        $ k = product_(i=1)^n (P_i^kappa_i) dot Q $
        Con $Q$ siendo otros posibles primos fuera de los factores de $a,b$

        Como $a|k$, para cada $i$ se tiene que $alpha_i<=kappa_i$

        Como $b|k$, para cada $i$ se tiene que $beta_i<=kappa_i$

        Por lo tanto para cada $i$ se tiene que $max(alpha_i, beta_i)<=kappa_i$

        Entonces tenemos que $P_i^max(alpha_i, beta_i)|P_i^kappa_i$

        Por lo tanto
        $
          product_(i=1)^n P_i^max(alpha_i, beta_i) & | product_(i=1)^n P_i^kappa_i \
                                                 m & | k                           \
        $
      ]
    ]
  ]
][
  Extienda la definición de MCM a un conjunto de $n$ números finito.

  #definition[
    Sean $a_1,a_2,dots,a_n$, todos diferentes de cero. Existe $b in ZZ$, que es múltiplo común de todos ellos si $b|a_1,b|a_2,dots,b|a_n$. El menor de los múltiplos comunes positivos recibe el nombre de _mínimo común múltiplo_ y se denota por $[a_1,a_2,dots,a_n]$.
  ]
][
  Realice una lista de 10 propiedades del MCM.

  #enum[
    Sean $a,b in ZZ$ no nulos. Entonces
    $ m=[a,b] <==> cases(m>0, a|m and b|m, forall n: a|n and b|n ==> m|n) $
  ][
    Sean $a_1,a_2,dots,a_n in ZZ$ todos distintos de cero. Sea $b in ZZ$ múltiplo común de $a_1,a_2,dots,a_n$. Entonces $[a_1,a_2,dots,a_n]|b$
  ][
    Si $m>0$, $[m a,m b]= m[a,b]$
  ][
    Sean $a,b in ZZ$ no nulos. Entonces $[a,b] dot (a,b) = |a b|$
  ][
    Sean $a_1,a_2,dots,a_n in ZZ$ todos distintos de cero, con $n>2$. Entonces $[a_1,a_2,dots,a_n] = [[a_1,a_2,dots,a_(n-1)], a_n]$
  ][
    Sean $a,b in ZZ$ no nulos. Entonces
    $[a,b]= (|a b|)/((a,b))$
  ][
    Sean $a,b in ZZ$ no nulos. Entonces
    $a$ y $b$ son primos relativos si y solo si $[a,b]=|a b|$
  ][ ]
][
  Demuestre cada una de las propiedades anteriores.
]
