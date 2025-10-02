/// Variables
#let date = datetime.today()
#let lang = "ES"
#let data = (
  title: "Taller 1",
  author: "Christian Mauricio Cárdenas Barón",
  author-id: "20251167009",
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
#set document(title: data.title, author: data.author, date: auto)
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
      [#data.title - #data.course],
      // WARN: Solución visual al contador, buscar mejor solución
      [#(counter(page).get().at(0) - 1)],
    )
    line(length: 100%)
  }
})
#show heading: set block(spacing: 1em)
#set list(spacing: 1em, indent: 2pt, marker: "•")
#set enum(spacing: 1em, indent: 2pt, numbering: n => emph[#n.], full: false)

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
  par[#data.author]
  par[#data.author-id]
  v(40%)
  par(data.professor)
  par(data.faculty)
  par(data.university)
  par(date.display())
})
#pagebreak()

// Content
= Taller
#enum(spacing: 1.5em)[
  Demuestre por inducción:

  $ a_1|a_2, a_2|a_3, dots, a_(n-1)|a_n ==> a_1|a_n $

  #proof[
    #list[
      Caso Base: $n=3$

      Por hipótesis $a_1|a_2$ y $a_2|a_3$, existen $x,y in ZZ$ tal que $a_2=a_1 x$ y $a_3=a_2 y$
      $ a_3=a_2 y = (a_1 x) y = a_1 (x y) ==> a_1|a_3 $
    ][
      Paso inductivo: Supongamos $a_1|a_2, a_2|a_3, dots, a_(n-1)|a_n ==> a_1|a_n$

      También se supone la relación para $n+1$ tal que
      $ a_1|a_2, a_2|a_3, dots a_(n-1)|a_n, a_n|a_(n+1) $

      Por HI $a_1|a_n$ y $a_n|a_(n+1)$, existen $x,y in ZZ$ tal que $a_n=a_1 x$ y $a_(n+1)=a_n y$
      $ a_(n+1)=a_n y=(a_1 x)y=a_1(x y) ==> a_1|a_(n+1) $
    ]
  ]
][
  Demuestre por inducción:
  $
    a|b_1, a|b_2, dots , a|b_n
    ==> a|(b_1x_1 + b_2x_2 + dots + b_n x_n),
    quad x_1,x_2,dots,x_n in ZZ
  $
  #proof[
    #list[
      Caso base: $n=2$

      Por definición existen $y_1,y_2 in ZZ$ tal que $b_1=a y_1$ y $b_2=a y_2$

      Multiplicando por sus respectivos $x_i$
      $
            b_1 & = a y_1          &     b_2 & = a y_2     \
        b_1 x_1 & = a y_1 x_1 quad & b_2 x_2 & = a y_2 x_1 \
      $
      Sumando las expresiones
      $
        b_1 x_1 + b_2 x_2 & = a y_1 x_1 + a y_2 x_2 \
        b_1 x_1 + b_2 x_2 & = a (y_1 x_1 + y_2 x_2) \
      $
      Por lo tanto $a|(b_1x_1 + b_2x_2)$
    ][
      Paso Inductivo: Supongamos
      $
        a|b_1, a|b_2, dots , a|b_n
        ==> a|(b_1x_1 + b_2x_2 + dots + b_n x_n),
        quad x_1,x_2,dots,x_n in ZZ
      $
      También se supone la relación para $n+1$, tal que $a|b_(n+1)$

      Por HI $b_1x_1 + b_2x_2 + dots + b_n x_n = a k, quad k in ZZ$

      Como $a|b_(n+1)$, entonces $b_(n+1)=a q, quad q in ZZ$
      $
        b_1x_1 + b_2x_2 + dots + b_n x_n + b_(n+1) x_(n+1) & = a k + b_(n+1)x_(n+1) \
                                                           & = a k + (a q)x_(n+1)   \
                                                           & = a (k + q x_(n+1))    \
      $
      Por lo tanto $a|(b_1x_1 + b_2x_2 + dots + b_n x_n + b_(n+1) x_(n+1))$
    ]
  ]
][
  Demostrar por inducción: Sean $a_1,a_2,dots,a_n in ZZ$ no nulos simultáneamente, existen enteros $x_1,x_2,dots,x_n$, tales que
  $ (a_1,a_2,dots,a_n)=a_1x_1 + a_2x_2 + dots + a_n x_n $

  #proof[
    #list[
      Caso Base: $n=2$

      Sea $S={a_1 x+a_2 y: x,y in ZZ and a_1 x + a_2 y >0}$

      - Si $a_1=a_2$ y $a_1>0$, entonces $a_1(1)+a_2(1) in S$
      - Si $a_1=a_2$ y $a_1<0$, entonces $a_1(-1)+a_2(-1) in S$
      - Si $a_1<a_2$, entonces $a_2-a_1>0$, por lo tanto $a_1(-1)+a_2(1) in S$
      - Si $a_1>a_2$, entonces $a_1-a_2>0$, por lo tanto $a_1(1)+a_2(-1) in S$

      Entonces $S!=emptyset$

      Como $min(S) in S$, existen $x_0,y_0$ tal que
      $ min(S)=a_1 x_0 + a_2 y_0 $

      $(a_1,a_2)|a_1 and (a_1,a_2)|a_2 ==> (a_1,a_2)|(a_1x_0 + a_2+y_0) ==> (a_1,a_2)|min(S)$

      $(a_1,a_2)|min(S) and (a_1,a_2)>0 and min(S)>0 ==> (a_1,a_2) <= min(S)$

      Por algoritmo de la division existen únicos $q,r in ZZ$ tal que
      $ a_1 = min(S) q + r, quad 0<=r<min(S) $
      $
        r & = a_1-min(S)q                \
          & = a_1-(a_1 x_0 + a_2 y_0)q   \
          & = a_1-a_1 x_0 q - a_2 y_0 q  \
          & = a_1(1-x_0 q) + a_2(-y_0 q) \
      $
      Si $r>0 ==> r in S ==> r>=min(S)$, lo cual contradice $r<min(S)$

      Por lo tanto $r=0 ==> a_1=min(S)q ==> min(S)|a$

      "El razonamiento para $min(S)|a_2$ es análogo"

      Como $min(S)|a_1 and min(S)|a_2 ==> min(S)|(a_1,a_2) ==> min(S)<=(a_1,a_2)$

      Por lo tanto $min(S)<=(a_1,a_2) and (a_1,a_2)<=min(S) ==> min(S)=(a_1,a_2)$
    ][
      Paso inductivo: Supongamos que para todo $a_1,a_2,dots,a_n in ZZ$ no nulos simultáneamente, existen $x_1,x_2,dots,x_n$ tales que
      $ (a_1,a_2,dots,a_n)=a_1x_1+a_2x_2+dots+a_n x_n $

      Sea $d=(a_1,a_2,dots,a_n)$

      Por definición de MCD, $d$ divide a cada $a_1,a_2,dots,a_n$

      #list[
        Sea $c$ un divisor común de $a_1,a_2,dots,a_n,a_(n+1)$ \
        Como $d=(a_1,a_2,dots,a_n)$, entonces $c|d$ \
        Ademas $c|a_(n+1)$ por lo tanto $c$ es divisor común de $d,a_(n+1)$
      ][
        Recíprocamente. Sea $c$ un divisor común de $d,a_(n+1)$ \
        Como $c|d$ y $d|a_1, d|a_2, dots d|a_n$, entonces $c|a_1, c|a_2, dots, c|a_n$ \
        Ademas $c|a_(n+1)$ por lo tanto $c$ es divisor común de $a_1,a_2,dots,a_n,a_(n+1)$
      ]
      Por lo tanto el conjunto de divisores comunes de $a_1,a_2,dots,a_n,a_(n+1)$ es igual que el conjunto de divisores comunes de $d,a_(n+1)$ y por definición de MCD $(a_1,a_2,dots,a_n,a_(n+1))=(d,a_(n+1))$

      Por HI existen $x_1,x_2,dots,x_n$ tal que $d=a_1x_1 + a_2x_2 + dots + a_n x_n$

      Por teorema de Bézout existen $y_1,y_2$ tal que
      $
        (d,a_(n+1)) & = d y_1 + a_(n+1)y_2                                              \
                    & = (a_1x_1 + a_2x_2 + dots + a_n y_n) y_1 + a_(n+1)y_2             \
                    & = a_1x_1y_1 + a_2x_2y_1 + dots + a_n x_n y_1 + a_(n+1)y_2         \
                    & = a_1(x_1y_1) + a_2(x_2y_1) + dots + a_n (x_n y_1) + a_(n+1)(y_2) \
      $
      Por lo tanto $(a_1,a_2,dots,a_n,a_(n+1))$ se puede expresar como una combinación lineal.
    ]
  ]
][
  Demostrar: Sean $a,b in ZZ$ no nulos simultáneamente,
  $ d=(a,b) <==> cases(d>0, d|a and d|b, m|a and m|b ==> m|d) $

  #proof[
    #list[
      $==>$
      + Como $1$ es divisor común para cualquier pareja de enteros, tenemos que $d>=1$, entonces $d>0$
      + Por definición de MCD $d|a$ y $d|b$
      + Sea $m in ZZ$ tal que $m|a$ y $m|b$.

        Por teorema de Bézout, existen $x,y in ZZ$ tal que $d=(a,b)=a x + b y$
        $ m|a and m|b ==> m|a x + b y ==> m|d $
    ][
      $<==$

      Por hipótesis $d>0$, $d|a$ y $d|b$

      Sea $k in ZZ$ tal que $k|a$ y $k|b$. Por hipótesis $k|d$

      + Si $k<0$: como $d>0$, entonces $k<d$
      + Si $k>0$: como $k|d$, entonces $k<=d$
      Por lo tanto $d=(a,b)$
    ]
  ]
][
  Demostrar: $ m>0 ==> (m a, m b)=m(a,b) $

  #proof[
    Sea $S_1={m a x + m b y: x,y in ZZ and m a x + m b y >0}$
    $
      (m a, m b) = min(S_1) = m a x_0 + m b y_0 & = m(a x_0 + b y_0)
    $
    Como $m(a x_0 + b y_0)>0$ y $m>0$, entonces $a x_0 + b y_0 >0$

    Sea $S_2={a x + b y: x,y in ZZ and a x + b y >0}$
    $
      m(a x_0 + b y_0) = m min(S_2) = m(a,b)
    $
    Por lo tanto $(m a,m b)=m(a,b)$
  ]
][
  Demostrar: $ d>0 and d|a and d|b ==> (a/d,b/d)=1/d (a,b) $

  #proof[
    Como $d|a$ y $d|b$, existen $m,n in ZZ$ tal que $a=d m$ y $b=d n$

    Por teorema de Bézout existen $x,y in ZZ$ tal que $(a,b)=a x + b y$

    $
      (a,b) = a x + b y = d m x + d n y = d(m x + n y)
    $
    Como $d>0$ y $d|(a,b)$ podemos dividir la expresión por $d$
    $
      ((a,b))/d = d(m x + n y)/d = m x + n y= (m,n) = (a/d, b/d)
    $
    Por lo tanto $(a/d,b/d) = 1/d (a,b)$
  ]
][
  Demostrar: $ (a,m)=(b,m)=1 ==> (a b,m)=1 $

  #proof[
    Por teorema de Bézout existen $x,y,u,v in ZZ$ tal que $(a,m)=a x + m y=1$ y $(b,m)= b u + m v=1$
    $
      1 & = (a x + m y)(b u + m v)                            \
        & = (a x)(b u) + (a x)(m v) + (m y)(b u) + (m y)(m v) \
        & = a b (x u) + m (a x v + b y u + m y v)             \
        & = a b (x u) + m (a x v + y (b u + m v))             \
        & = a b (x u) + m (a x v + y)                         \
    $
    Como $a b (x u) + m (a x v + y)$ es una combinación lineal de $a b$ y $m$, por teorema de Bézout existe una combinación tal que $a b (x u) + m (a x v + y)= (a b, m)$
  ]
][
  Demostrar: $ (a,b)=(b,a)=(-a,b)=(a,-b)=(-a,-b)=(a,b+a x), quad x in ZZ $

  #proof[
    #enum[
      $(a,b)=(b,a)$

      Sean $S_1={x in ZZ: x|a}$ y $S_2={x in ZZ: x|b}$

      Entonces $op("div")(a,b)=S_1 inter S_2$, pero también $op("div")(b,a)=S_2 inter S_1$ \

      $ op("div")(a,b)=S_1 inter S_2 = S_2 inter S_1=op("div")(b,a) $
    ][
      $(a,b)=(-a,b)=(a,-b),(-a,-b)$

      Por definición si $d|a$, existe $k in ZZ$ tal que $a=d k$, pero $-a=d(-k)$, entonces $d|(-a)$. Por lo tanto los divisores de $a$ y $-a$ son iguales.

      Por lo tanto $(a,b)=(-a,b)$, analógicamente $(a,b)=(a,-b)$, finalmente $(a,b)=(-a,-b)$
    ][
      $(a,b)=(a,b+a x), quad x in ZZ$

      Sean $K_1={k in ZZ: k|a and k|b}$ y $K_2={k in ZZ: k|a and k|(b+a x)}$

      #list[
        Sea $d in K_1$, tal que $d|a$ y $d|b$. Como $d|a$, entonces $d|a x$.
        Como $d|b$ y $d|a x$, entonces $d|b+a x$ \
        Por lo tanto $d in K_2$, así $K_1 subset.eq K_2$
      ][
        Recíprocamente. Sea $d in K_2$ tal que $d|a$ y $d|(b+a x)$, de modo que $d|a x$ por lo tanto $d$ divide a $(b+a x)+a(-x)=b$, entonces $d|b$ \
        Por lo tanto $d in K_1$, así $K_2 subset.eq K_1$
      ]
      Por lo tanto $K_1=K_2$, entonces $(a,b)=(a,b+a x)$
    ]
  ]
][
  Demostrar: $ c|a b and (c,b)=1 ==> c|a $

  #proof[
    Por teorema de Bézout existen $x,y in ZZ$ tal que $(c,b)=1=c x + b y$

    Por definición existe $k in ZZ$ tal que $a b = c k$
    $
      1 & = c x + b y       \
      a & = a c x + a b y   \
      a & = a c x + (c k) y \
      a & = c (a x + k y)   \
    $
    Por lo tanto $c|a$
  ]
]
