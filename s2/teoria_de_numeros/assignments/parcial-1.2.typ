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
  fg: rgb("#000"), // #dcd7ba
  bg: rgb("#fff"), // #1f1f28
  bg-raw: rgb("#f0f0f0"), // #2a2a37
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

== Defina MCM de dos números y explique la importancia de la necesidad de las hipótesis.

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

== Ejemplifique y demuestre el método usado.

#custom-box(title: "Ejemplo")[
  Para hallar $[15,20]$. Se descomponen en factores primos $15$ y $20$ y para cada factor se toma el exponente máximo.

  $
         15 & = 2^0 dot 3^1 dot 5^1      \
         20 & = 2^2 dot 3^0 dot 5^1      \
    [15,20] & = 2^2 dot 3^1 dot 5^1 = 60 \
  $

]

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

== Extienda la definición de MCM a un conjunto de $n$ números finito.

#definition[
  Sean $a_1,a_2,dots,a_n$, todos diferentes de cero. Existe $b in ZZ$, que es múltiplo común de todos ellos si $b|a_1,b|a_2,dots,b|a_n$. El menor de los múltiplos comunes positivos recibe el nombre de _mínimo común múltiplo_ y se denota por $[a_1,a_2,dots,a_n]$.
]

== Realice una lista de 10 propiedades del MCM y demuéstralas.

#enum[
  Sean $a,b in ZZ$ no nulos. Entonces $[a,b]=[b,a]=[-a,b]=[a,-b]=[-a,-b]$

  #proof[
    #list[
      $[a,b]=[b,a]$

      Sean $S_1={m in ZZ: a|m}$ y $S_2={m in ZZ: b|m}$,

      #let mul = math.op("mul")
      Tenemos que $mul(a, b)= S_1 inter S_2$, pero también $mul(b, a)=S_2 inter S_1$. Por lo tanto $mul(a, b)=mul(b, a)$, entonces sus mínimos son el mismo por lo tanto $[a,b]=[b,a]$
    ][
      $[a,b]=[-a,b]=[a,-b]=[-a,-b]$

      Por definición si $-a|m$, existe $l in ZZ$ tal que $m=(-a)l$, pero $m=a(-l)$, entonces $a|m$, por lo tanto conjuntos de múltiplos de $a$ y $-a$ son iguales

      Por lo tanto $[a,b]=[-a,b]$, "analógicamente $[a,b]=[a,-b]=[-a,-b]$"
    ]
  ]
][
  Sean $a,b in ZZ$ no nulos. Entonces $m=[a,b]$ si y solo si
  + $m>0$
  + $a|m$ y $b|m$
  + Sea $k in ZZ$, si $a|k$ y $b|k$, entonces $m|k$

  #proof[
    #list[
      $==>$

      Supongamos $m=[a,b]$
      + Por definición $m>0$
      + Por definición $a|m$ y $b|m$
      + Sea $k in ZZ$ tal que $a|k$ y $b|k$.

        Por algoritmo de division existen $q,r in ZZ$ tal que
        $
                k & =m q + r, quad 0<=r<m \
          k+m(-q) & = r                   \
        $
        Si $r>0$, como $a|k$ y $a|m$, entonces $a|r$, y como $b|k$ y $b|m$, entonces $b|r$. Ademas $r$ seria divisor común de $a$ y $b$, también $r<m$ lo que contradiría que $m$ es el mínimo común múltiplo. Por lo tanto $r=0$.

        Como $k=m q$, entonces $m|k$
    ][
      $<==$

      Por hipótesis $m>0$, $a|m$ y $b|m$

      Sea $n in ZZ$ tal que $a|n$ y $a|n$, por hipótesis $m|n$, por lo tanto $m<=n$

      Suponga otro $m'$ que cumpla las propiedades, entonces $m|m' ==> m<=m'$, pero también $m'|m ==> m'<=m$, por lo tanto $m=m'$.

      Concluyendo $m=[a,b]$
    ]
  ]
][
  Sean $a_1,a_2,dots,a_n in ZZ$ no nulos. Entonces $m=[a_1,a_2,dots,a_n]$ si y solo si:
  + $m>0$
  + $a_1|m, a_2|m,dots,a_n|m$
  + Sea $k in ZZ$, tal que $a_1|k,a_2|k,dots,a_n|k$, entonces $m|k$

  #proof[
    #list[
      $==>$

      Suponga $m=[a_1,a_2,dots,a_n]$

      #enum[
        Por definición $m>0$
      ][
        Por definición $a_i|m$ para $i=1,2,dots,n$
      ][
        Sea $k in ZZ$ tal que $a_i|k$ para $i=1,2,dots,n$

        Por algoritmo de la division existen $q,r in ZZ$ tal que
        $
                k & =m q+r,quad 0<=r<m \
          k+m(-q) & =r                 \
        $
        Si $r>0$, como $a_i|k$ y $a_i|m(-q)$ para $i=1,2,dots,n$, entonces $a|r$. Como $r<m$ se contradiría que $m$ es el menor múltiplo común de $a_i$. Por lo tanto $r=0$.

        Como $k=m q$, entonces $m|k$
      ]
    ][
      $<==$

      Suponga
      + $m>0$
      + $a_i|m$ para $i=1,2,dots,n$
      + Sea $k in ZZ$ tal que $a_i|k$ para $i=1,2,dots,n$, entonces $m|k$

      Como $m|k$, entonces $m<=k$

      Sea $m'$ que cumpla todas las condiciones anteriores, por _(3)_ se tiene $m|m' ==> m<=m'$, pero también por _(3)_ $m'|m ==> m'<=m$, por lo tanto $m=m'$

      Concluyendo $m=[a_1,a_2,dots,a_n]$
    ]
  ]
][
  Sean $a_1,a_2,dots,a_n in ZZ$ todos distintos de cero, con $n>2$. Entonces $[a_1,a_2,dots,a_n] = [[a_1,a_2,dots,a_(n-1)], a_n]$

  #proof[
    Sea $L=[a_1,a_2,dots,a_(n-1),a_n], quad M=[a_1,a_2,dots,a_(n-1)], quad R=[M,a_n]$

    - Por definición $M$ es múltiplo de $a_1,a_2,dots,a_(n-1)$. Como $R=[M,a_n]$, entones $R$ es múltiplo de $M$, y también $R$ es múltiplo de $a_n$, por lo tanto $R$ es múltiplo de $a_1,a_2,dots,a_n$. Como $L=[a_1,a_2,dots,a_n]$, entonces $L|R$

    - Por definición $L$ es múltiplo de todos los $a_i$, en particular de $a_1,a_2,dots,a_(n-1)$, entonces $L$ es múltiplo de $M$. También $L$ es múltiplo de $a_n$, por lo tanto $L$ es múltiplo común de $M$ y $a_n$. Como $R=[M,a_n]$, entonces $R|L$

    Como $L|R$ y $R|L$, entonces $L=R$
  ]
][
  Sean $a,b in ZZ$ no nulos. Entonces $[a,b] dot (a,b)= |a b|$

  #proof[
    Sean las factorizaciones primas de $a,b$
    $
      |a|=product_(i=1)^n P_i^alpha_i quad quad
      |b|=product_(i=1)^n P_i^beta_i
    $
    Donde cada $P_I$ es un numero primo distinto, y cada $alpha_i,beta_i >=0$.

    Sabemos que $(a,b) = product_(i=1)^n P_i^min(alpha_i, beta_i)$

    También que $[a,b] = product_(i=1)^n P_i^max(alpha_i, beta_i)$

    Por lo tanto
    $
      (a,b) dot [a,b]= product_(i=1)^n P_i^min(alpha_i, beta_i) dot product_(i=1)^n P_i^max(alpha_i, beta_i)
      = product_(i=1)^n P_i^(min(alpha_i, beta_i) + max(alpha_i, beta_I))
    $
    Ahora como $alpha_i,beta_i>=0$, entonces $min(alpha_i, beta_i) + max(alpha_i, beta_i)=alpha_i + beta_i$
    $
      product_(i=1)^n P_i^(min(alpha_i, beta_i) + max(alpha_i, beta_I))
      = product_(i=1)^n P_i^(alpha_i + beta_I)
      = product_(i=1)^n P_i^alpha_i dot product_(i=1)^n P_i^beta_I
      = |a| dot |b| = |a b|
    $
    Por lo tanto $(a,b)dot[a,b]=|a b|$
  ]
][
  Sean $a,b in ZZ$ no nulos. Entonces $[a,b]=|a b| <==> (a,b)=1$

  #proof[
    #list[
      $==>$
      Supongamos $[a,b]=|a b|$, como $[a,b] dot (a,b)= |a b|$, entonces $(a,b)=1$
    ][
      $<==$
      Supongamos $(a,b)=1$, como $[a,b] dot (a,b)=|a b|$, entonces $[a,b] = |a,b|$
    ]
  ]
][
  Sean $a,b in ZZ$ no nulos. Entonces $[a,b]= (|a b|)/((a,b))$
  #proof[
    Sea $m=(|a b|)/((a,b))$

    #list[
      Como $|a b| >0$ y $(a,b)>0$, entonces $m>0$
    ][
      Sean $x,y in ZZ$ tal que $(x,y)=1$

      Sea $d=(a,b)$, entonces $a=d x$ y $b=d y$
      $
        m= (|a b|)/d = (|a||d y|)/d = |a||y| = a(plus.minus y)
      $
      Por lo tanto $a|m$ "analógicamente $b|m$"
    ][
      Sea $k in ZZ$ tal que $a|k$ y $b|k$, existen $r,s in ZZ$ tal que \
      $k = a r = b s ==> (d x)r = (d y)s ==> x r = y s$

      Ahora $y|x r$ y como $(x,y)=1$, entonces $y|r$, existe $u in ZZ$ tal que $r=y u$

      Remplazando $k=a r = a (y u) = (a y)u = plus.minus m u$, por lo tanto $m|n$
    ]
  ]
][
  Sean $a,b in ZZ$ no nulos. Entonces $a|b <==> [a,b]=|b|$

  #proof[
    #list[
      $==>$

      Suponga $a|b$, entonces $(a,b)=|a|$, como $[a,b] dot (a,b) = |a b|$ remplazando
      $ [a,b] dot |a| = |a b| ==> [a,b] = (|a b|)/(|a|) ==> [a,b] = |b| $
    ][
      $<==$

      Suponga $[a,b]=|b|$, como $[a,b] dot (a,b)=|a b|$
      $ |b| dot (a,b)=|a b| ==> (a,b)=(|a b|)/(|b|) ==> (a,b)=|a| $
      Por lo tanto $|a| | b$, entonces $a|b$
    ]
  ]
][
  Sea $k in ZZ$ con $k>0$. Entonces $[m a,m b]= m[a,b]$

  #proof[
    Como $[a,b]=(|a b|)/((a,b))$, entonces
    $
      [m a, m b] = (|m a dot m b|)/((m a, m b))
      = (|m^2 a b|)/(m(a, b))
      = (m^2|a b|)/(m(a, b))
      = m (|a b|)/((a, b))
      = m[a,b]\
    $
  ]
][
  Sea $k in ZZ$ con $k>0$. Entonces $[a/k,b/k]=[a,b]/k$

  #proof[
    Como $[a,b]=(|a b|)/((a,b))$, entonces
    $
      [a/k,b/k] = (|a/k dot b/k|)/((a/k,b/k))
      = (|(a b)/k^2|)/(((a,b))/k)
      = ((|a b|)/k^2)/(((a,b))/k)
      = (k|a b|)/(k^2(a,b))
      = 1/k dot (|a b|)/((a,b))
      = 1/k dot [a,b]
      = ([a,b])/k
    $
  ]
]
