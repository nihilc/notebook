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
  fg: rgb("#dcd7ba"), // #000000
  bg: rgb("#1f1f28"), // #ffffff
  bg-raw: rgb("#2a2a37"), // #f0f0f0
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

  Si $a_1|a_2, a_2|a_3, dots, a_(n-1)|a_n$, entonces $a_1|a_n$

  #proof[no inducción][
    Por Hipótesis existen $x_1,x_2,dots,x_(n-1) in ZZ$ tal que:
    $
         a_2 & = a_1 x_1                                       \
         a_3 & = a_2 x_2         && = a_1x_1x_2                \
      dots.v                                                   \
         a_n & = a_(n-1) x_(n-1) && = a_1x_1x_2 dots.c x_(n-1) \
    $
    Entonces podemos expresar $a_n=a_1 product_(i=1)^(n-1) x_i$

    Como $product_(i=1)^(n-1) x_i = x_1x_2dots.c x_(n-1) in ZZ$, entonces $a_1|a_n$
  ]

  #proof[inducción][
    #list[
      Caso Base: $n=2, a_1|a_2$
    ][
      Paso inductivo: Supongamos que si $a_1|a_2, a_2|a_3, dots, a_(n-1)|a_n$, entonces $a_1|a_n$

      Por HI $a_1|a_n$ entonces $a_n=a_1 k_1$ para algún $k_1 in ZZ$

      #text(red)[Duda:] Como $a_n|a_(n+1)$ entonces $a_(n+1)=a_n k_2$ para algún $k_2 in ZZ$

      $a_(n+1)=a_n k_2 = a_1 k_1 k_2 ==> a_1|a_(n+1)$
    ]
    Por lo tanto si $a_1|a_2, a_2|a_3, dots, a_(n-1)|a_n$ entonces $a_1|a_n$
  ]
][
  Demuestre por inducción:

  Si $a|b_1, a|b_2, dots , a|b_n$, entonces $a|b_1x_1 + b_2x_2 + dots + b_n x_n, quad$
  $x_1,x_2,dots,x_n in ZZ$

  #proof[
    #list[
      Caso base: $n=2$
      $
        b_1=a k_1 and b_2 = a k_2 & ==> b_1 x_1 = a k_1 x_1 and b_2 x_2 = a k_2 x_2 \
                                  & ==> b_1x_1 + b_2x_2 = a k_1x_1 + a k_2x_2       \
                                  & ==> b_1x_1 + b_2x_2 = a (k_1x_1 + k_2x_2)       \
                                  & ==> a|(b_1x_1 + b_2x_2)                         \
      $
    ][
      Paso Inductivo: Supongamos
      $
        a|b_1, a|b_2, dots, a|b_n ==> a|b_1x_1 + b_2x_2 + dots + b_n x_n, quad x_1,x_2,dots,x_n in ZZ
      $
      Por HI $b_1x_1 + b_2x_2 + dots + b_n x_n = sum_(i=1)^(n) (b_i x_i) = a k, quad k in ZZ$

      #text(red)[Duda:] Como $a|b_(n+1)$, entonces $b_(n+1)=a q, quad q in ZZ$
      $
                         a k & = sum_(i=1)^n (b_i x_i)                  \
        a k + b_(n+1)x_(n+1) & = sum_(i=1)^n (b_i x_i) + b_(n+1)x_(n+1) \
           a k + a q x_(n+1) & = sum_(i=1)^(n+1) (b_i x_i)              \
           a (k + q x_(n+1)) & = sum_(i=1)^(n+1) (b_i x_i)              \
      $
      Esto muestra que $a|sum_(i=1)^(n+1)(b_i x_i)$
    ]
    Por lo tanto si $a|b_1,a|b_2,dots,a|b_n$, entonces $a|sum_(i=1)^(n)(b_i x_i)$
  ]
][
  Demostrar por inducción: Sean $a_1,a_2,dots,a_n in ZZ$ no nulos simultáneamente, existen enteros $x_1,x_2,dots,x_n$, tales que $(a_1,a_2,dots,a_n)=a_1x_1 + a_2x_2 + dots + a_n x_n$

  #proof[
    $
      (forall a_1,a_2,dots,a_n in ZZ)
      (exists x_1,x_2,dots,x_n in ZZ)
      ((a_1,a_2,dots,a_n)=sum_(i=1)^n (a_i x_i))
    $
    #list[
      Caso Base: $n=2$

      Sea $S={a_1 x+a_2 y: x,y in ZZ and a_1 x + a_2 y >0}$
      - $a_1=a_2 and a_1>0 ==> a_1(1)+a_2(1) in S$
      - $a_1=a_2 and a_1<0 ==> a_1(-1)+a_2(-1) in S$
      - $a_1<a_2 ==> a_2-a_1>0 ==> a_1(-1)+a_2(1) in S$
      "El razonamiento para $a_1>=a_2$ es análogo"

      Entonces $S!=emptyset$

      Como $min(S) in S$, existen $x_0,y_0$ tal que
      $ min(S)=a_1 x_0 + a_2 y_0 $
      $(a_1,a_2)|a_1 and (a_1,a_2)|a_2 ==> (a_1,a_2)|min(S)$

      Como $(a_1,a_2)|min(S) and (a_1,a_2)>0 and min(S)>0 ==> (a_1,a_2) <= min(S)$

      Por algoritmo de la division existen únicos $q,r in ZZ$ tal que
      $ a_1 = min(S) q + r, quad 0<=r<min(S) $
      $
        r & = a_1-min(S)q                \
          & = a_1-(a_1 x_0 + a_2 y_0)q   \
          & = a_1-a_1 q x_0 - a_2 q y_0  \
          & = a_1(1-q x_0) + a_2(-q y_0) \
      $
      Si $r>0 ==> r in S ==> r>=min(S)$, lo cual contradice $r<min(S)$, por lo tanto $r=0 ==> a_1=min(S)q ==> min(S)|a$

      "El razonamiento para $min(S)|a_2$ es análogo"

      Como $min(S)|a_1 and min(S)|a_2 ==> min(S)|(a_1,a_2) ==> min(S)<=(a_1,a_2)$

      Por lo tanto $min(S)<=(a_1,a_2) and (a_1,a_2)<=min(S) ==> min(S)=(a_1,a_2)$
    ][
      Paso inductivo: Supongamos
      $
        (forall a_1,a_2,dots,a_n in ZZ)
        (exists x_1,x_2,dots,x_n in ZZ)
        ((a_1,a_2,dots,a_n)=sum_(i=1)^n (a_i x_i))
      $
      Sea $g=(a_1,a_2,dots,a_n)$
      $
                          g & = sum_(i=1)^n (a_i x_i)                   \
        g + a_(n+1) x_(n+1) & = sum_(i=1)^n (a_i x_i) + a_(n+1) x_(n+1) \
      $
      #text(red)[Incompleta]
    ]
  ]
][
  Demostrar: Sean $a,b in ZZ$ no nulos simultáneamente,
  $ d=(a,b) <==> cases(d|a and d|b, m|a and m|b ==> m|d) $

  #proof[
    #list(spacing: 20pt)[
      $d=(a,b) ==> cases(d|a and d|b, m|a and m|b ==> m|d)$

      Sea $S={x in ZZ: x|a and x|b}$

      + Por definición si $d=(a,b)$, entonces $d=max(S)$, por lo tanto $d|a and d|b$
      + Si $m|a and m|b ==> m in S$, como $d=max(S)$, entonces $m<=d$


    ][
      $cases(reverse: #true, d|a and d|b, m|a and m|b ==> m|d) ==> d=(a,b)$

      #text(red)[DUDA:]
      Sea $a=90 and b=60$
      $
           op("div")(90) & ={1,2,3,5,6,9,10,15,30,45,90}    \
           op("div")(60) & ={1,2,3,4,5,6,10,12,15,20,30,60} \
        op("div")(90,60) & = {1,2,3,5,6,10,15,30}           \
      $
      Si tomamos $m=2 and d=10$
      $
        10|90 and 10|60 \
        2|90 and 2|60 ==> 2|10
      $
      Pero $10=d!=(90,60)=30$
    ]
  ]
][
  Demostrar: $m>0 ==> (m a, m b)=m(a,b)$

  #proof[
    Sea $S_1={m a x + m b y: x,y in ZZ and m a x + m b y >0}$



    $
      (m a, m b) = min(S_1) = m a x_0 + m b y_0 & = m(a x_0 + b y_0)
    $

    Como $m(a x_0 + b y_0)>0 and m>0 ==> a x_0 + b y_0 >0$

    Sea $S_2={a x + b y: x,y in ZZ and a x + b y >0}$
    $
      (m a, m b) = m(a x_0 + b y_0) = m min(S_2) = m(a,b)
    $
    Por lo tanto $(m a,m b)=m(a,b)$
  ]
][
  Demostrar: $d>0 and d|a and d|b ==> (a/d,b/d)=1/d (a,b)$

  #proof[
    Como $d|a$ y $d|b$, existen $m,n in ZZ$ tal que $a=d m$ y $b=d n$

    $
      (a,b) & = a x + b y     & quad x,y in ZZ \
            & = d m x + d n y                  \
            & = d(m x + n y)                   \
    $
    Como $d>0$ y $d|(a,b)$ podemos dividir la expresión por $d$
    $
      1/d (a,b) = m x + n y = a/d x + b/d y = (a/d, b/d)
    $
  ]
][
  Demostrar: $(a,m)=(b,m)=1 ==> (a b,m)=1$

  #proof[
    Como $(a,m)=a x + m y=1$ y $(b,m)= b u + m v=1$
    $
      1 & = (a x + m y)(b u + m v) \
      & = (a x)(b u) + (a x)(m v) + (m y)(b u) + (m y)(m v) \
      & = a b(x u) + m (a x v) + m (b y u) + m (m y v) \
      & = a b underbrace((x u), in ZZ) + m underbrace((a x v + b y u + m y v), in ZZ) \
      & = (a b, m)
    $
  ]
][
  Demostrar: $(a,b)=(b,a)=(-a,b)=(a,-b)=(-a,-b)=(a,b+a x), quad x in ZZ$
][
  Demostrar: $c|a b and (c,b)=1 ==> c|a$

  #proof[
    $(c,b)=1=c x + b y, quad x,y in ZZ$

    $c|a b ==> a b=c k ==> k = a/c, quad k in ZZ$
  ]
]
