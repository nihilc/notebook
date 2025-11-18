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
#let solve = custom-box.with(title: "Solucion")
#let proof = custom-box.with(title: "Demostración", qed: true)
#let theorem = custom-box.with(title: "Teorema")
#let definition = custom-box.with(title: "Definición")
#let algorithm = custom-box.with(title: "Algoritmo")
#let proposition = custom-box.with(title: "Proposición")
#let lemma = custom-box.with(title: "Lema")
#let corollary = custom-box.with(title: "Corolario")

/// Custom math functions
#let cong(n) = math.attach(math.equiv, br: n)
#let sumi(i, n) = $sum_(i=#i)^(#n)$
#let sumj(j, n) = $sum_(j=#j)^(#n)$
#let prodi(i, n) = $product_(i=#i)^(#n)$
#let prodj(j, n) = $product_(j=#j)^(#n)$

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

*Ejercicios:*

#enum(
  indent: -6pt,
  enum.item(3)[
    Probar que $(a,b)=(a+b,[a,b])$
    #proof[
      Sea $d=(a,b)$, entonces $a=d x$ y $b=d y$, con $(x,y)=1$. Luego

      - $a+b=d x+d y=d(x+y)$
      - $[a,b]=frac(a b, (a,b))=frac(d x d y, d)=d x y$

      Entonces $(a+b,[a,b])=(d(x+y),d x y)=d(x+y,x y)$

      Sea $p$ un primo divisor común de $x+y$ y $x y$

      Luego $p|x y$, entonces $p|x$ o $p|y$

      Supongamos $p|x$, como $p|(x+y)$ y $p|x$, luego $p|(x+y)+(-x)$, entonces $p|y$

      Ahora $p|x$ y $p|y$, pero $(x,y)=1$, esto solo se cumple en caso de $p=1$, por tanto no hay un primo divisor común de $x+y$ y $x y$, entonces $(x+y,x y)=1$

      Retomando
      $ (a+b,[a,b])=d(x+y,x y)=d=(a,b) $
    ]
  ],
  enum.item(5)[
    Si $k$ es múltiplo de $a$ y $b$, probar que $ (|k|)/((k/a,k/b))=[a,b] $

    #proof[
      Como $k$ es múltiplo de $a$ y $b$, entonces existen $m,n in ZZ$ tal que $k=a m=b n$
      $
        a=k/m and b=k/n quad "tambien" quad m=k/a and n=k/b
      $
      Sabemos que $[a,b]=frac(|a b|, (a,b))$, remplazando $a$ y $b$
      $
        [a,b] & = frac(|a b|, (a,b))
                = frac(abs(k/m dot k/n), (k/m,k/n))
                = frac(abs(k dot frac(k, m n)), (k/m,k/n))
                = frac(|k| abs(k/(m n)), (k/m,k/n))
                = frac(|k|, abs(frac(m n, k))(k/m,k/n))
      $
      Tenemos que $(k/m,k/n)=(abs(k/m),abs(k/n))$, ademas $abs(frac(m n, k))$ es un entero positivo por lo que lo podemos multiplicar dentro
      $
        (abs(k/m) abs(frac(m n, k)), abs(k/n) abs(frac(m n, k)))
        = (abs(frac(cancel(k m) n, cancel(m k))), abs(frac(cancel(k) m cancel(n), cancel(n k))))
        = (|n|,|m|) = (n,m) = (k/b,k/a)
      $
      Por lo tanto $display([a,b] = frac(|k|, (k/a,k/b)))$
    ]
  ],
  enum.item(7)[
    Sean $d$ y $g$ enteros positivos. Probar que existen enteros $a$ y $b$ tales que $(a,b)=d$ y $[a,b]=g$ si y solo si $d|g$

    #proof[
      #list[
        "$==>$" $quad (d,g in ZZ^+)(exists a,b in ZZ)((a,b)=d and [a,b]=g ==> d|g)$

        Como $(a,b)=d$, entonces $d|a$ y $d|b$

        Como $[a,b]=g$, entonces $a|g$ y $b|g$

        Luego $d|a$ y $a|g$, por tanto $d|g$
      ][
        "$<==$" $quad (d,g in ZZ^+)(d|g ==> (exists a,b in ZZ)((a,b)=d) and [a,b]=g)$

        Como $d|g$, existe $k in ZZ$ tal que $g=d k$

        Sea $a=d$ y $b=g$
        $
          (a,b)=(d,g)=(d,d k)
        $
        Como para cualquier $x,n in ZZ$, se tiene que $(x,x n)=x$, luego
        $ (a,b)=(d,d k)=d $
        Entonces
        $
          [a,b]=frac(|a b|, (a,b))=frac(|d g|, d)=|g|=g
        $
      ]
    ]
  ],
  enum.item(10)[
    Hallar enteros $a$ y $b$ tales que $a+b=216$ y $[a,b]=480$

    #solve[
      Tomemos $a,b in ZZ^+$, ya que $(a,b)=(-a,-b)$

      Sea $d=(a,b)$, entonces $d|a$ y $d|b$, luego $d|a+b$

      Expresamos $a=d x$ y $b=d y$ con $(x,y)=1$

      Luego
      - $a+b=d x+d y=d(x+y)=216$
      - $[a,b]=frac(|a b|, (a,b))=frac(a b, (a,b))=frac(d x d y, d)=d x y=480$

      Como $d|216$ y $d|480$, luego $d|(216,480)$, entonces $d<=(216,480)$, siendo el máximo valor de $d=(216,480)$

      Hallamos $(216,480)$
      $
        480 & = 216 dot 2 + 48 \
        216 & = 48 dot 4 + 24  \
         48 & = 24 dot 2       \
      $
      Entonces $d=(216,480)=24$, se sigue que
      $
        x+y=216/d=216/24=9 quad "y" quad x y=480/d=480/24=20
      $
      Vemos que los $x,y$ co-primos que cumplen $x+y=9$ y $x y=20$, son
      $ x=4 quad "y" quad y=5 $

      Sustituyendo en $a=d x$ y $b=d y$, tenemos
      $
        a=24dot 4=96 quad "y" quad b=24dot 5=120,
      $

      #quote(block: true)[
        "Como la suma y multiplicación son conmutativas, así como el MCD y MCM, también se da el caso de $a=120$ y $b=96$"
      ]
    ]
  ],
  enum.item(11)[
    Hallar todos los números $a$ y $b$ que satisfacen $(a,b)=24$ y $[a,b]=1440$
    #solve[
      Sea la descomposición en factores primeros de $a$ y $b$
      $
        a=product_(i=1)^n p_i^alpha_i quad "y" quad b=product_(i=1)^n p_i^beta_i
      $
      Siendo $p_i$ números primos, los exponentes $alpha_i,beta_i in ZZ^*$ y $n$ la cantidad de primos en la descomposición que debe ser igual para $a$ y $b$.

      Sabemos que
      $
        (a,b)=24=product_(i=1)^n p_i^min(alpha_i, beta_i) quad "y" quad
        [a,b]=1440=product_(i=1)^n p_i^max(alpha_i, beta_i)
      $
      Por tanto podemos construir diferentes $a$ y $b$ intercambiando los $alpha_i$ con los $beta_i$ en los factores primos, ya que se mantendría los mismos $min$ y $max$

      Descomponemos $24$ y $1440$
      #set math.mat(delim: none, augment: 1)
      $
        mat(24, 2; 12, 2; 6, 2; 3, 3; 1) quad
        mat(1440, 2; 720, 2; 360, 2; 180, 2; 90, 2; 45, 3; 15, 3; 5, 5; 1) quad quad
        mat(
          augment: #none,
          24 & =2^3 dot 3^1 dot 5^0;
          1440 & =2^5 dot 3^2 dot 5^1
        )
      $
      Ahora construimos los distintos $a$ y $b$ variando los $alpha,beta$ en cada primo

      - Para el factor primo $p=2$ el par de exponentes $(alpha_2,beta_2)$ es $(3,5)$ o $(5,3)$
      - Para el factor primo $p=3$ el par de exponentes $(alpha_3,beta_3)$ es $(1,2)$ o $(2,1)$
      - Para el factor primo $p=5$ el par de exponentes $(alpha_5,beta_5)$ es $(0,1)$ o $(1,0)$

      #table(
        columns: 5,
        table.header(
          table.cell([Exponentes $(alpha,beta)$], align: center, colspan: 3),
          table.cell($a$, align: center + horizon, rowspan: 2),
          table.cell($b$, align: center + horizon, rowspan: 2),
          $p=2$,
          $p=3$,
          $p=5$,
        ),

        $(3,5)$, $(1,2)$, $(0,1)$, $a=2^3 3^1 5^0=24$, $b=2^5 3^2 5^1=1440$,
        $(3,5)$, $(1,2)$, $(1,0)$, $a=2^3 3^1 5^1=120$, $b=2^5 3^2 5^0=288$,
        $(3,5)$, $(2,1)$, $(0,1)$, $a=2^3 3^2 5^0=72$, $b=2^5 3^1 5^1=480$,
        $(3,5)$, $(2,1)$, $(1,0)$, $a=2^3 3^2 5^1=360$, $b=2^5 3^1 5^0=96$,
        $(5,3)$, $(1,2)$, $(0,1)$, $a=2^5 3^1 5^0=96$, $b=2^3 3^2 5^1=360$,
        $(5,3)$, $(1,2)$, $(1,0)$, $a=2^5 3^1 5^1=480$, $b=2^3 3^2 5^0=72$,
        $(5,3)$, $(2,1)$, $(0,1)$, $a=2^5 3^2 5^0=288$, $b=2^3 3^1 5^1=120$,
        $(5,3)$, $(2,1)$, $(1,0)$, $a=2^5 3^2 5^1=1440$, $b=2^3 3^1 5^0=24$,
      )
      Por lo tanto las parejas $a,b$ tal que $(a,b)=24$ y $[a,b]=1440$ son
      $
        { (24,1440), (120,288), (72,480), (360,96),
          (96,360), (480,72), (288,120), (1440,24) }
      $
    ]
  ],
)

#counter(heading).update(3)
= Congruencias
== Definición y Propiedades Básicas

*Ejercicios:*

#enum(
  indent: -7pt,
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
    #proof[
      Supongamos que $3^105 + 4^105 cong(13) 0$, entonces
      $
               3^105 & cong(13) - 4^105              \
               3^105 & cong(13) 4^(2+52+1) (-1)      \
               3^105 & cong(13) 16^52 dot (4)(-1)    \
               3^105 & cong(13) 16^52 (-4)           \
               3^105 & cong(13) 3^52 (-4)            \
        3^(3 dot 35) & cong(13) 3^(3 dot 17 +1) (-4) \
               27^35 & cong(13) 27^17 (3) (-4)       \
                1^35 & cong(13) 1^17 (3) (-4)        \
                   1 & cong(13) -12                  \
                   1 & cong(13) 1                    \
      $
      Como $1 cong(13) 1$, entonces la suposición es correcta
    ]
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


    #proof[
      #enum[
        Sea $S_1=sumi(1, p-1) i$, sabemos que la suma de los $n$ primeros números es
        $ sumi(1, n) i = frac(n(n+1), 2) $
        Luego para $n=p-1$
        $
          sumi(1, p-1)=frac((p-1)((p-1)+1), 2)=frac((p-1)p, 2)=p ((p-1))/2
        $
        Como $p$ es primo y factor de $S_1$, luego
        $
          S_1 cong(p) p frac(p-1, 2) cong(p) 0
        $
      ][
        Sea $S_2=sumi(1, p-1) i^2$, sabemos que la suma de los $n$ primeros cuadrados es
        $ sumi(1, n) i^2 = frac(n(n+1)(2n+1), 6) $
        Luego para $n=p-1$
        $
          sumi(1, p-1) i^2 & = frac((p-1)((p-1)+1)(2(p-1)+1), 6) \
                           & = frac((p-1)p(2p-1), 6)             \
                           & = p frac((p-1)(2p-1), 6)            \
        $
        Como $p$ es primo y factor de $S_2$, luego
        $
          S_2 cong(p) p frac((p-1)(2p-1), 6) cong(p) 0
        $
      ][
        Sea $S_3=sumi(1, p-1) i^3$, sabemos que la suma de los $n$ primeros cubos es
        $ sumi(1, n) i^3 = (frac(n(n+1), 2))^2 $
        Luego para $n=p-1$
        $
          sumi(1, p-1) i^3 = (frac((p-1)p, 2))^2=(S_1)^2
        $
        De (a) tenemos que $S_1 cong(p) 0$, por tanto
        $
          (S_1)^2 = S_3 & cong(p) 0
        $
      ]
    ]
  ],
  enum.item(8)[
    Si $f(x)$ es un polinomio con coeficientes enteros y $f(a) cong(n) k$ probar que para todo entero $t$, $f(a+t n) cong(n) k$

    #proof[
      Sea $f(x)=c_0+c_1x+c_2x^2+dots+c_m x^m = sumi(0, m) c_i x^i$

      Por definición $n|t n$, pero $n|(t n+a-a)$, luego $a+t n cong(n) a$

      Para todo $i in ZZ^*$ se tiene que $(a+t n)^i cong(n) a^i$

      Para todo $c_i in ZZ$ se tiene que $c_i (a+t n)^i cong(n) c_i a^i$

      Luego vemos que todo termino $i$ de $f(a+t n)$ es congruente con su correspondiente $f(a)$ modulo $n$. Por lo tanto su suma también lo es
      $
                   c_i (a+t n)^i & cong(n) c_i a^i            \
        sumj(0, m) c_j (a+t n)^j & cong(n) sumj(0, m) c_j a^j \
                        f(a+t n) & cong(n) f(a)               \
      $
      Luego $f(a+t n) & cong(n) f(a) cong(n) k$, entonces $f(a+t n)cong(n) k$
    ]
  ],
  enum.item(10)[
    Hallar el dígito de las unidades de los números $13^13$ y $(5)(7)^29+(8)(9)^72$

    #solve[
      #enum[
        Calculamos el modulo $10$ de $13^13$
        $
          13^13 & cong(10) 3^13
          & cong(10) 3^(4 dot 3 + 1)
          & cong(10) 81^3 (3)
          & cong(10) 1^3 (3)
          & cong(10) 3
        $
        Por tanto el dígito de las unidades de $13^13$ es $3$
      ][
        Calculamos el modulo $10$ de $(5)(7)^29 + (8)(9)^72$

        Hallamos el ultimo dígito de cada termino por separado
        #grid(
          columns: (1fr, 1fr),
          $
            (5)(7)^29 & cong(10) 7^(4 dot 7 + 1) (5) \
                      & cong(10) 2401^7 (7)(5)       \
                      & cong(10) 1^7 (35)            \
                      & cong(10) 5                   \
          $,
          $
            (8)(9)^72 & cong(10) 9^(2 dot 36) (8) \
                      & cong(10) 81^36 (8)        \
                      & cong(10) 1^36 (8)         \
                      & cong(10) 8                \
          $,
        )
        Luego sumamos las congruencias
        $
          (5)(7)^29 + (8)(9)^72 & cong(10) 5 + 8 \
                                & cong(10) 13    \
                                & cong(10) 3     \
        $

        Por tanto el ultimo dígito de $(5)(7)^29 + (8)(9)^72$ es $3$
      ]
    ]
  ],
)

== Criterios de Divisibilidad

*Ejercicios:* // TODO: 2,5

#enum(
  enum.item(1)[
    Sea $n=a_0+a_1 10 + a_2 10^2 + dots + a_k 10^k$ la representación decimal del entero positivo $n$. Probar que $n$ es divisible por $11$, si y solo si $sum_(i=0)^k (-1)^i a_i$ es divisible por 11

    #proof[
      Sea $n=sumi(0, k) a_i 10^i$

      Vemos que $10 cong(11) -1$

      Para todo $i in ZZ^*$ se tiene que $10^i cong(11) (-1)^i$

      Para todo $a_i in ZZ$ se tiene que $a_i 10^i cong(11) a_i (-1)^i$

      Luego la suma de todos los elementos $a_i 10^i$ va a ser congruente modulo $11$ de la suma de todos los elementos $a_i (-1)^i$ de $i=0,1,dots,k$
      $ sumi(0, k) a_i 10^i cong(11) sumi(0, k) a_i (-1)^i $

      Luego $n=sumi(0, k)a_i 10^i$, por tanto
      $ n cong(11) sumi(0, k) a_i (-1)^i $

      #list[
        "$==>$" $quad 11|n ==> 11|sumi(0, k)(-1)^i a_i$

        Si $11|n$, entonces $n cong(11) 0$

        Por lo anterior tenemos que
        $ sumi(0, k) a_i (-1)^i cong(11) n cong(11) 0 $

        Entonces $11|sumi(0, k) a_i (-1)^i$

      ][
        "$<==$" $quad 11|sumi(0, k)(-1)^i a_i ==> 11|n$

        Si $11|sumi(0, k) a_i (-1)^i$, entonces $sumi(0, k) a_i (-1)^i cong(11) 0$

        Por lo anterior tenemos que
        $ n cong(11) sumi(0, k) a_i (-1)^i cong(11) 0 $

        Entonces $11|n$
      ]
    ]
  ],
  enum.item(2)[
    A partir de la relación $10^3 cong(7) -1$, deducir un criterio de Divisibilidad por $7$.

  ],
  enum.item(3)[
    Probar que $6|n$ si y solo si $2|n$ y $3|n$.

    #proof[
      #list[
        "$==>$" $quad 6|n ==> 2|n and 3|n$

        Como $6|n$, entonces $n=6k$, con $k in ZZ$, luego $n=(2)(3)k$, por tanto $2|n$ y $3|n$
      ][
        "$<==$" $quad 2|n and 3|n ==> 6|n$

        Como $2|n$ y $3|n$, luego $n=2a=3b$, con $a,b in ZZ$

        Entonces $2a=3b$, por tanto $3b$ debe ser par, por tanto $b=2k$, con $k in ZZ$

        Luego $n=2a=3(2k)=6k$, por tanto $6|n$
      ]
    ]
  ],
  enum.item(4)[
    Con las notaciones del ejercicio 1, probar que $8|n$ si y solo si $8|(100 a_2 + 10 a_1 + a_0)$

    #proof[
      Sea $n=a_0 + a_1 10 + a_2 10^2 + a_3 10^3 + dots + a_k 10^k=sumi(0, k) a_i 10^i$

      #list[
        "$==>$" $quad 8|n ==> 8|(a_0 + a_1 10 + a_2 10^2)$

        Extraemos los $3$ primeros términos y factorizamos $10^3$
        $
          n & = a_0+a_1 10 + a_2 10^2 + sumi(3, k) a_i 10^i                 \
            & = a_0+a_1 10 + a_2 10^2 + sumi(0, k-3) a_(i+3) 10^(i+3)       \
            & = a_0+a_1 10 + a_2 10^2 + sumi(0, k-3) a_(i+3) 10^i 10^3      \
            & = (a_0+a_1 10 + a_2 10^2) + (10^3 sumi(0, k-3) a_(i+3) 10^i ) \
        $
        Por hipótesis $8|n$, entonces $n cong(8) 0$

        Luego $10^3=1000$ y $8|1000$, entonces $10^3 cong(8) 0$, por tanto
        $10^3 sumi(0, k-3) cong(8) 0$

        Como $n cong(8) n$, remplazando
        $
          n & cong(8)
              (a_0+a_1 10 + a_2 10^2) + (10^3 sumi(0, k-3) a_(i+3) 10^i ) \
            & cong(8) (a_0+a_1 10 + a_2 10^2) + 0                         \
            & cong(8) a_0+a_1 10 + a_2 10^2                               \
        $
        Por definición $8|(a_0+a_1 10+ a_2 10^2 - n)$, y como $8|n$, entonces
        $ 8|(a_0 + a_1 10 + a_2 10^2) $
      ][
        "$<==$" $quad 8|(a_0+a_1 10+a_2 10^2) ==> 8|n$

        Por hipótesis $8|(a_0+a_1 10+a_2 10^2)$

        Sabemos que
        $ n=a_0+a_1 10+a_2 10^2 + 10^3 sumi(0, k-3) a_(i+3) 10^i $

        Y que $8|10^3 sumi(0, k-3) a_(i+3) 10^i$, luego
        $
          8 & | (a_0+a_1 10+a_2 10^2) + (10^3 sumi(0, k-3) a_(i+3) 10^i)
        $
        Por lo tanto $8|n$
      ]
    ]
  ],
  enum.item(5)[
    Expresando los enteros positivos en el sistema de numeración con base $100$, deducir un criterio de divisibilidad por $101$.
  ],
)
