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

      Particiones de 1 subconjunto $ P_15 & ={ {a,b,c,d} } $
      Particiones de 2 sub conjuntos

      Tipo 1,3
      $
         P_8 & ={ {a},{b,c,d} } \
         P_9 & ={ {b},{a,c,d} } \
        P_10 & ={ {c},{a,b,d} } \
        P_11 & ={ {d},{a,b,c} } \
      $
      Tipo 2,2
      $
        P_12 & ={ {a,b},{c,d} } \
        P_13 & ={ {a,c},{b,d} } \
        P_14 & ={ {a,d},{b,c} } \
      $
      Particiones de 3 sub conjuntos
      $
        P_2 & ={ {a},{b},{c,d} } \
        P_3 & ={ {a},{c},{b,d} } \
        P_4 & ={ {a},{d},{b,c} } \
        P_5 & ={ {b},{c},{a,c} } \
        P_6 & ={ {b},{d},{a,c} } \
        P_7 & ={ {c},{d},{a,b} } \
      $
      Particiones de 4 sub conjuntos $ P_1 & ={ {a},{b},{c},{d} } $
      Por tanto existen $15$ particiones para un conjunto con $4$ elementos
    ][
      Idéntico para un conjunto con 5 elementos

      El número de Bell $B_n$ representa el numero de particiones de un conjunto con $n$ elementos. Una forma de obtenerlo es a partir de la suma de los números de Stirling de segundo tipo
      $ B_n = sum_(k=1)^n S(n,k) $

      Los números de Stirling de segundo tipo $S(n,k)$, se definen como el numero de formas de particionar un conjunto de $n$ elementos en exactamente $k$ subconjuntos no vacíos.

      Se obtiene mediante de la recurrencia
      $
        S(n,k)=k dot S(n-1,k) + S(n-1,k-1), quad quad cases(S(0,0)=1, S(n,0)=0\, quad n>0)
      $
      Ademas se intuye:
      #list[
        $S(n,0)=0$ para $n>0$, no se puede particionar elementos en $0$ conjuntos
      ][
        $S(0,k)=0$ para $k>0$, no se puede armar subconjuntos sin elementos
      ][
        $S(n,n)=1$ cada elemento en su propio conjunto
      ][
        $S(n,1)=1$ todos los elementos en un conjunto
      ]

      #proof[
        Hallemos todas las particiones de ${1,2,dots,n}$ en $k$ subconjuntos, primero particionemos ${1,2,dots,n-1}$ y luego agregamos el elemento $n$.

        Caso 1: $n$ esta en su propio subconjunto
        - Primero se particiona ${1,2,dots,n-1}$ en $k-1$ subconjuntos. Hay $S(n-1,k-1)$ formas de hacerlo.
        - Luego $n$ queda en su propio subconjunto.
        - El total en este caso: $ S(n-1,k-1) times 1= S(n-1,k-1) $

        Caso 2: $n$ se agrega a un subconjunto existente
        - Primero se particiona ${1,2,n-1}$ en $k$ subconjuntos. Hay $S(n-1,k)$ formas de hacerlo.
        - Luego se elije en cual de los $k$ bloques se agrega $n$. Hay $k$ opciones.
        - El total en este caso: $ S(n-1,k) times k = k S(n-1,k) $

        Toda particion de ${1,2,dots,n}$ en $k$ subconjuntos cae en uno y solo uno de los casos. Por tanto, aplicando la regla de la suma.
        $
          S(n,k)=underbrace(S(n-1,k-1), "Caso 1") + underbrace(k dot S(n-1,k), "Caso 2")
        $
      ]

      Construimos los números de Stirling para $n=1,2,dots,5$

      #table(
        columns: 2,
        table.header($n$, $S(n,k)$),
        $n=1$, $S(1,1)=1$,
        $n=2$,
        [
          $S(2,1)=1$ \
          $S(2,2)=1$
        ],

        $n=3$,
        [
          $S(3,1)=1$ \
          $S(3,2)=2 dot S(2,2)+S(2,1)=2(1)+1=3$ \
          $S(3,3)=1$
        ],

        $n=4$,
        [
          $S(4,1)=1$ \
          $S(4,2)=2 dot S(3,2) + S(3,1)=2(3)+1=7$ \
          $S(4,3)=3 dot S(3,3) + S(3,2)=3(1)+3=6$ \
          $S(4,4)=1$
        ],

        $n=5$,
        [
          $S(5,1)=1$ \
          $S(5,2)=2 dot S(4,2) + S(4,1) = 2(7)+1=15$ \
          $S(5,3)=3 dot S(4,3) + S(4,2) = 3(6)+7=25$ \
          $S(5,4)=4 dot S(4,4) + S(4,3) = 4(1)+6=10$ \
          $S(5,5)=1$
        ],
      )

      Por lo tanto vemos que para un conjunto de $5$ elementos
      $
        B_n = sum_(k=1)^n S(n,k) & = S(5,1) + S(5,2) + S(5,3) + S(5,4) + S(5,5) \
                                 & = 1 + 15 + 25 + 10 + 1                       \
                                 & = 52                                         \
      $
    ]

  ],
  enum.item(7)[
    Si $R_1, R_2$ son relaciones de equivalencia en $A$

    #enum[
      Pruebe que $R_1 inter R_2$ también es de equivalencia.
      #proof[
        Sea $A$ un conjunto y $R_1,R_2 subset.eq A times A$ dos relaciones de equivalencia en $A$ Definimos
        $ R=R_1 inter R_2 = {(x,y)in A times A: x R_1 y and x R_2 y} $
        #list[
          *Reflexividad:* Sea $x in A$. \
          Como $R_1,R_2$ son relaciones de equivalencia, entonces $x R_1 x$ y $x R_2 x$. Por lo tanto $x R x$
        ][
          *Simetría:* Sean $x,y in A$ tal que $x R y$. \
          Entonces $x R_1 y$ y $x R_2 y$, como $R_1, R_2$ son simétricas, entonces $y R_1 x$ y $y R_2 x$. Por lo tanto $y R x$
        ][
          *Transitiva:* Sean $x,y,z in A$ tal que $x R y$ y $y R z$.\
          Entonces $x R_1 y$, $x R_2 y$, $y R_1 z$ y $y R_2 z$ \
          Como $R_1,R_2$ son transitivas entonces $x R_1 z$ y $x R_2 z$. Por lo tanto $x R z$
        ]
        Concluyendo $R_1 inter R_2$ es una relación de equivalencia
      ]
    ][
      Dé un contraejemplo para hacer ver que en general $R_1 union R_2$ no es una relación de equivalencia.
    ]
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
          [(1/2,10/3)]_R & = {(x,y) in RR^2: (x,y)R(1/2,10/3)}                          \
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
      Pruebe que toda pareja ordenada $(x,y)$ de $RR^2$ es equivalente según $R$ con un único punto de $[0,1) times [0,1)$

      #proof[
        #list[
          *Existencia:*
          Sean $x,y in RR$, sean $m=floor x floor.r$ y $n=floor y floor.r$,

          Entonces $x'=x-m$ satisface $0<=x'<1$ \
          También $y'=y-n$ satisface $0<=y'<1$.

          Entonces:
          - $m,n in ZZ$, por definición de parte entera.
          - $x=x'+m$ y $y=y'+n$, Luego $(x,y)R(x',y')$
          - $(x',y') in [0,1) times [0,1)$
        ][
          *Unicidad:*
          Sean $(x_1,y_1),(x_2,y_2) in [0,1) times [0,1)$ tales que $(x,y)R(x_1,y_1)$ y $(x,y)R(x_2,y_2)$.

          Por simetría y transitividad $(x_1,y_1)R(x_2,y_2)$, existen $m,n in ZZ$ con
          $ x_1=x_2+m quad y_1=y_2+n $

          Como $0<=x_1<1$ y $0<=x_2<1$, entonces $x_1-x_2=m$ debe estar en $(-1,1)$. Como $m in ZZ$ y el único entero en el intervalo $(-1,1)$ es $0$, entonces $m=0=x_1-x_2$. Por lo tanto $x_1=x_2$. "Analógicamente para $y_1=y_2$"
        ]
      ]
    ]
  ],
  enum.item(11)[
    Considere en $ZZ$ la relación de congruencia módulo $m$

    #enum[
      Demuestre que nunca dos elementos del conjunto ${0,1,2,dots,m-1}$ pueden ser congruentes entre si módulo $m$.
      #proof[
        Sea $m in ZZ$ con $m>0$\
        Sea $a,b in {0,1,2,dots,m-1}$ tal que $a equiv b (mod m)$

        Por definición de congruencia $m|(a-b)$, entonces existe $k in ZZ$ tal que
        $ a-b=m k $

        Como $a,b in {0,1,2,dots,m-1}$, entonces $|a-b|<=m-1$. Si $k!=0$, entonces $|k m|>=m$, lo que es una contradicción. Por tanto $k=0$, entonces $a-b=0$ , se sigue $a=b$

        Concluyendo si $a,b in {0,1,2,dots,m-1}$ solo pueden ser congruentes entre si modulo $m$, si $a=b$
      ]
    ][
      Pruebe que todo entero es congruente módulo $m$ con un único elemento del conjunto ${0,1,2,dots,m-1}$
      #proof[
        Sea $a,m in ZZ$ con $m>0$
        #list[
          *Existencia:*

          Por algoritmo de la division existen $q,r in ZZ$ tal que
          $ a=m q + r, quad 0<=r<m $
          Como $a-r=m q$, entonces $m|(a-r)$, se sigue que $a equiv r (mod m)$.

          Entonces todo entero $a$ es congruente modulo $m$ con algún elemento $r$ del conjunto ${0,1,dots,m-1}$
        ][
          *Unicidad:* Supongamos $r,s in {0,1,dots,m-1}$, y también $a equiv r(mod m)$ y $a equiv s(mod m)$
          $
            a equiv r(mod m) ==> m|(a-r) ==> a-r=m k_1, quad k_1 in ZZ \
            a equiv s(mod m) ==> m|(a-s) ==> a-s=m k_2, quad k_2 in ZZ
          $
          Restando $(a-s)-(a-r) & = m k_2 -m k_1$, tenemos $r-s & = m(k_2 - k_1)$

          Como $r,s in {0,1,dots,m-1}$, entonces $|r-s|<=m-1$. Si $k_2-k_1 !=0$, entonces $|m(k_2-k_1)|>=m$, lo cual es una contradicción. Por tanto $k_2-k_1=0$, entonces $r-s=0$, concluyendo $r=s$
        ]
        Por lo tanto todo entero $a$ es congruente modulo $m$ con un único elemento del conjunto ${0,1,dots,m-1}$
      ]
    ][
      Deduzca de $(a)$ y $(b)$ que
      $ ZZ\/(m) = {[0],[1],[2],dots,[m-1]} $

      De (a) Se tiene que dos elementos distintos de ${0,1,dots,m-1}$ no son congruentes modulo $m$ entre si. Por lo tanto las clases de equivalencia $[0],[1],dots,[m-1]$ son distintas.

      De (b) Se tiene que todo $a in ZZ$ es congruente modulo $m$ con un único elemento de ${0,1,dots,m-1}$. Por lo tanto cada entero perteneces a una única de estas clases

      Cada clase $[r]$ contiene todos los enteros congruentes con $r$
      $ [r]={a in ZZ: a equiv r (mod m)} = {k in ZZ: r+m k} $
      Por lo tanto el conjunto cociente es
      $ ZZ\/(m) = {[0],[1],[2],dots,[m-1]} $
    ]
  ],
)
