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
#let color = (
  fg: rgb("#000"), // #dcd7ba
  bg: rgb("#fff"), // #1f1f28
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
#set enum(spacing: 1em, indent: 2pt, numbering: "1ai)", full: false)

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

#set page(height: auto)

= Taller

Desarrollar ejercicios 2,4,7,9,11 del Libro _Introducción a la Teoría de Conjuntos - Muñoz J._ sección 3.6 pagina 115.

#enum(
  enum.item(2)[
    Pruebe que en $RR$ la relación
    $ x R y <==> sin(x-y)=0 $
    es de equivalencia. Halle para esta relación las clases de equivalencias de los reales $0,pi/2, pi/4,a$

    #proof[
      #list[
        Simetría: Sea $x in RR$. Como
        $ sin(x-x)=sin(0)=0 $
        Por lo tanto $x R x$
      ][
        Reflexividad: Sean $x,y in RR$. Tal que $x R y$. Como $x R y$
        $
          sin(x-y)=sin(-(y-x))=-sin(y-x)=-0=0
        $
        Tenemos que $sin(y-x)=0$, Por lo tanto $y R x$
      ][
        Transitividad: Sean $x,y,z in RR$. Tal que $x R y$ y $y R z$.

        Como $sin(theta)=0$ cuando $theta=k pi$ para algun entero $k$. Entonces

        $x R y ==> sin(x-y)=0 ==> x-y=n pi, quad n in ZZ$

        $y R z ==> sin(y-z)=0 ==> y-z=m pi, quad m in ZZ$

        Sumando
        $
          x-y+y-z & = n pi + m pi \
              x-z & = pi(n + m)   \
        $
        Entonces $sin(x-z)=0$, Por lo tanto $x R z$
      ]
      Por lo tanto $R$ es una relación de equivalencia.
    ]

    #list[
      Hallar $[a]_R$
      $
        [a]_R & = {x in RR: x R a)}
      $
      Como $sin(x-a)=0$ cuando $x-a=k pi$ para algún $k in ZZ$, entonces \ $x=a+(-k)pi$, como $k$ es cualquier entero $x=a+k pi$

      Por lo tanto $[a]_R={k in ZZ: a+k pi}$
    ][
      Hallar $[0]_R$
      $
        [0]_R = {k in ZZ: 0 + k pi} = {dots,-2pi,-pi,0,pi,2pi,dots}
      $
    ][
      Hallar $[pi/2]_R$
      $
        [pi/2]_R = {k in ZZ: pi/2 + k pi} = {dots,-(3pi)/2,-pi/2,pi/2,(3pi)/2,(5pi)/2,dots}
      $
    ][
      Hallar $[pi/4]_R$
      $
        [pi/4]={k in ZZ: pi/4 + k pi} = {dots, -(7pi)/4, -(3pi)/4, pi/4, (5pi)/4, (9pi)/4,dots}
      $
    ]
  ],
  enum.item(4)[
    #enum[
      Halle el numero de particiones que existen para un conjunto con $4$ elementos

      Sea $A={a,b,c,d}$
      $
         P_1 & ={ {a},{b},{c},{d} } \
                                    \
         P_2 & ={ {a},{b},{c,d} }   \
         P_3 & ={ {a},{c},{b,d} }   \
         P_4 & ={ {a},{d},{b,c} }   \
         P_5 & ={ {b},{c},{a,c} }   \
         P_6 & ={ {b},{d},{a,c} }   \
         P_7 & ={ {c},{d},{a,b} }   \
                                    \
         P_8 & ={ {a},{b,c,d} }     \
         P_9 & ={ {b},{a,c,d} }     \
        P_10 & ={ {c},{a,b,d} }     \
        P_11 & ={ {d},{a,b,c} }     \
                                    \
        P_12 & ={ {a,b},{c,d} }     \
        P_13 & ={ {a,c},{b,d} }     \
        P_14 & ={ {a,d},{b,c} }     \
                                    \
        P_15 & ={ {a,b,c,d} }       \
      $
      Por tanto existen $15$ particiones para un conjunto con $4$ elementos
    ][
      Idéntico para un conjunto con 5 elementos

      #text(
        red,
      )[*DUDA:* puedo utilizar los números de Bell o debo hacerlo por una relación de orden]

      Para esto podemos utilizar los números de Bell los cuales se calculan por
      $ B_(n+1) = sum_(k=0)^n binom(n, k)B_k, quad B_0=1 $

      En el caso de las particiones para un conjunto de 5 elementos encontramos el quinto numero de Bell
      $
        B_0 & = 1 &&&& = 1 \
        B_1 & = sum_(k=0)^0 binom(0, k)B_k &&= binom(0, 0)B_0 \
        &&& = 1 dot 1
        && = 1 \
        B_2 & = sum_(k=0)^1 binom(1, k)B_k &&= binom(1, 0)B_0 + binom(1, 1)B_1 \
        &&& = 1 dot 1 + 1 dot 1
        && = 2 \
        B_3 & = sum_(k=0)^2 binom(2, k)B_k &&= binom(2, 0)B_0 + binom(2, 1)B_1 + binom(2, 2)B_2 \
        &&& = 1 dot 1 + 2 dot 1 + 1 dot 2
        && = 5 \
        B_4 & = sum_(k=0)^3 binom(3, k)B_k &&= binom(3, 0)B_0 + binom(3, 1)B_1 + binom(3, 2)B_2 + binom(3, 3)B_3 \
        &&& = 1 dot 1 + 3 dot 1 + 3 dot 2 + 1 dot 5
        && = 15 \
        B_5 & = sum_(k=0)^4 binom(4, k)B_k &&= binom(4, 0)B_0 + binom(4, 1)B_1 + binom(4, 2)B_2 + binom(4, 3)B_3 + binom(4, 4)B_4 \
        &&& = 1 dot 1 + 4 dot 1 + 6 dot 2 + 4 dot 5 + 1 dot 15
        && = 52
      $
      Por lo tanto el numero de particiones para el conjunto de 5 elementos es 52
    ]

  ],
  enum.item(7)[
    #text(red)[Pendiente]
    Si $R_1, R_2$ son relaciones de equivalencia en $A$

    + Pruebe que $R_1 inter R_2$ también es de equivalencia.
    + Dé un contraejemplo para hacer ver que en general $R_1 union R_2$ no es una relación de equivalencia.
  ],
  enum.item(9)[
    Definimos en $RR^2$ la relación
    $
      (x,y)R(u,v) <==> (exists m,n in ZZ)(x=u+m and y=v+n)
    $
    #enum[
      Demuestre que es de equivalencia.

      #proof[
        #list[
          Simetría: Sea $(x,y) in RR^2$. Existe $0 in ZZ$ tal que $x=x+0$ y $y=y+0$. Por lo tanto $(x,y)R(x,y)$
        ][
          Reflexividad: Sean $(x,y),(u,v) in RR^2$. Tal que $(x,y)R(u,v)$

          Existen $m,n in ZZ$ tal que $x & =u+m$ y $y=v+n$.

          Como $u=x+(-m)$ y $v=y+(-n)$, entonces $(u,v)R(x,y)$
        ][
          Transitividad: Sean $(x,y),(u,v),(a,b) in RR^2$. Tal que $(x,y)R(u,v)$ y $(u,v)R(a,b)$

          Como $(x,y)R(u,v)$, existen $k_1,k_2 in ZZ$ tal que $x=u+k_1$ y $y=v+k_2$

          Como $(u,v)R(a,b)$, existen $k_3,k_4 in ZZ$ tal que $u=a+k_3$ y $v=b+k_4$

          $
            x+u & =u+k_1 + a+k_3 #h(3em) quad & y+v & = v+k_2+b+k_4 \
              x & =a+(k_1+k_3)                &   y & = b+(k_2+k_4) \
          $

          Por lo tanto $(x,y)R(a,b)$
        ]
      ]
    ][
      Localice en un gráfico $[(0,0)]_R$ y $[(1/2,10/3)]_R$
      #list[
        Para $[(0,0)]_R$ tenemos que:
        $
          [(0,0)]_R & = {(x,y) in RR^2: (x,y)R(0,0)}                 \
                    & = {(x,y) in RR^2: x=m and y=n, quad m,n in ZZ} \
                    & = {(m,n): m,n in ZZ}                           \
                    & = {(0,0),(-1,0),(0,1),(-1,-1),(1,1),dots}      \
        $
        Por lo tanto la gráfica son todos los puntos enteros en el plano.
        #align(center, cetz.canvas(
          {
            import cetz.draw: *
            let x-range = 3
            let y-range = 3
            let ratio = 1

            // Draw dot grid
            for x in range(-x-range, x-range + 1) {
              for y in range(-y-range, y-range + 1) {
                circle((x, ratio * y), radius: 1pt, fill: black)
              }
            }

            // Draw axes with arrows
            let arrow-style = (mark: (start: "stealth", end: "stealth"))
            line(
              (-x-range - 1, 0),
              (x-range + 1, 0),
              ..arrow-style,
              name: "x-axis",
            )
            line(
              (0, -ratio * y-range - 1),
              (0, y-range + 1),
              ..arrow-style,
              name: "y-axis",
            )

            // Add axis labels
            content(
              (rel: (-.25, .25), to: "x-axis.end"),
              $x$,
              anchor: "south-west",
            )
            content((rel: (.5, 0), to: "y-axis.end"), $y$, anchor: "north-east")

            // Add axis numbers
            content((-0.25, -0.3), $0$)
            for x in range(x-range) {
              content((x + 1, -0.3), $#(x + 1)$)
              content((-(x + 1.1), -0.3), $-#(x + 1)$)
            }
            for y in range(y-range) {
              content((-0.25, y + 1), $#(y + 1)$)
              content((-0.35, -(y + 1)), $-#(y + 1)$)
            }
          },
          length: 30pt,
        ))
      ][
        Para $[1/2,10/3]_R$, primero expresamos $10/3=3+1/3$
        $
          [(1/2,10/3)]_R & = {(x,y) in RR^2: (x,y)R(1/2,3+1/3)}                         \
                         & = {(x,y) in RR^2: x=1/2+m and y=3+1/3+n, quad m,n in ZZ}     \
                         & = {(1/2+m,1/3+n): m,n in ZZ}                                 \
                         & = {(1/2,1/3),(1/2,4/3),(1/2,-4/3),(3/2,1/3),(-3/2,1/3),dots} \
        $
        #align(center, cetz.canvas(
          {
            import cetz.draw: *
            let x-range = 3
            let y-range = 3
            let ratio = 2 / 3

            // Draw dot grid
            for x in range(-x-range, x-range + 1) {
              for y in range(-y-range, y-range + 1) {
                circle((x, ratio * y), radius: 1pt, fill: black)
              }
            }

            // Draw axes with arrows
            let arrow-style = (mark: (start: "stealth", end: "stealth"))
            line(
              (-x-range - .5, 0),
              (x-range + .5, 0),
              ..arrow-style,
              name: "x-axis",
            )
            line(
              (0, -ratio * y-range - .5),
              (0, (y-range + .5) * ratio),
              ..arrow-style,
              name: "y-axis",
            )

            // Add axis labels
            content(
              (rel: (-.25, .25), to: "x-axis.end"),
              $x$,
              anchor: "south-west",
            )
            content((rel: (.5, 0), to: "y-axis.end"), $y$, anchor: "north-east")

            // Add axis numbers
            for x in range(x-range) {
              content((x + 1, -0.35), $#(1 + x * 2)/2$)
              content((-(x + 1.1), -0.35), $-#(1 + x * 2)/2$)
            }
            for y in range(y-range) {
              content((-.25, (y + 1) * ratio - .05), $#(1 + y * 3)/3$)
              content((-.35, -(y + 1) * ratio - .05), $-#(1 + y * 3)/3$)
            }
          },
          length: 45pt,
        ))
      ]
    ][
      #text(red)[Pendiente]
      Pruebe que toda pareja ordenada $(x,y)$ de $RR^2$ es equivalente según $R$ con un único punto de $[0,1) times [0,1)$
    ]
  ],
  enum.item(11)[
    Considere en $ZZ$ la relación de congruencia módulo $m$

    + Demuestre que nunca dos elementos del conjunto ${0,1,2,dots,m-1}$ pueden ser congruentes entre si módulo $m$.
    + Pruebe que todo entero es congruente módulo $m$ con un único elemento del conjunto ${0,1,2,dots,m-1}$
    + Deduzca de $(b)$ y $(c)$ que
      $ ZZ\/(m) = {[0],[1],[2],dots,[m-1]} $
  ],
)
