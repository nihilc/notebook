#import "@local/notebook:0.1.0": *

#enum(
  enum.item(3)[
    Sea $A = {a, b, c}$. Halle todas las particiones del conjunto $A$. Encuentre dando como conjuntos de parejas ordenadas, las relaciones de equivalencia correspondientes a las particiones halladas.

    Particiones de $A$

    #show math.equation: set text(size: default-font.size * 0.8)
    #grid(
      columns: 2,
      column-gutter: 5pt,
      row-gutter: 5pt,
      inset: 5pt, [
        $ P_1 & ={{a},{b},{c}} $
        #image("../assets/r1.svg")
        $ R_1={(a,a),(b,b),(c,c)} subset.eq A times A $
      ], [
        $ P_2 & ={{a},{b,c}} $
        #image("../assets/r2.svg")
        $ R_1={(a,a),(b,b),(c,c),(b,c),(c,d)}subset.eq A times A $
      ], [
        $ P_3 & ={{b},{a,c}} $
        #image("../assets/r3.svg")
        $ R_1={(a,a),(b,b),(c,c),(a,c),(c,a)}subset.eq A times A $
      ], [
        $ P_4 & ={{c},{a,b}} $
        #image("../assets/r4.svg")
        $ R_1={(a,a),(b,b),(c,c),(a,b),(b,a)}subset.eq A times A $
      ],
      grid.cell(colspan: 2)[
        $ P_5 & ={{a,b,c}} $
        #align(center, image("../assets/r5.svg"))
        $
          R_1={(a,a),(b,b),(c,c),(a,b),(a,c),(b,a),(b,c),(c,a),(c,b)}subset.eq A times A
        $
      ],
    )
  ],
  enum.item(5)[
    Demuestre que en $ZZ times (ZZ\\{0})$ la relación siguiente es de equivalencia
    $ (m,n) R (p,q) <==> m q = n p $

    $ZZ times ZZ^*, quad ZZ^* = ZZ\\{0}$

    #proof[
      #list[
        *Reflexividad:* Sean $m,n in ZZ times ZZ^*$. \
        Como $m n = n m$, entonces $(m,n) R (m,n)$
      ][
        *Simetría:* Sean $(m,n),(p,q) in ZZ times ZZ^*$ tal que $(m,n)R(p,q)$. \
        Como $(m,n)R(p,q)$, entonces $m q =n p$, así $p n=q m$, lo que implica $(p,q)R(m,n)$
      ][
        *Transitividad:* Sean $(m,n),(p,q),(a,b) in ZZ times ZZ^*$, tal que $(m,n)R(p,q)$ y $(p,q)R(a,b)$ \
        $
          (m,n)R(p,q) & --> & m q & =n p && --> & (m q)b & = (n p)b \
          (p,q)R(a,b) & --> & p b & =q a && --> & (p b)n & = (q a)n \
        $
        Luego $m q b = q a n$, así $m b = n a$, entonces $(m,n)R(a,b)$
      ]
      Por lo tanto $R$ es una relación de equivalencia
    ]

    - Hallamos $[(a,b)]$
      $
        [(a,b)]_R & = {(x,y) in ZZ times ZZ^*: x b = y a} \
                  & = {(x,y) in ZZ times ZZ^*: x/y = a/b} \
      $
    - Hallamos $[(-2,6)]_R$
      $
        [(-2,6)]_R & = {(x,y) in ZZ times ZZ^*: x/y=-2/6}
      $
    - Hallamos $[(0,1)]_R$
      $
        [(0,1)]_R & = {(x,y) in ZZ times ZZ^*: x/y=0/1}
      $
  ],
  enum.item(6)[
    #enum[
      Pruebe que en $RR$ la relación es de equivalencia
      $ x S y <==> x^2-y^2=3x-3y $
      #proof[
        #list[
          *Reflexividad:* Sea $x in RR$
          $
                  x & = x      \
                x^2 & = x^2    \
             x^2+3x & = x^2+3x \
            x^2-x^2 & = 3x-3x  \
          $
          Por lo tanto $x S x$
        ][
          *Simetría:* Sea $x,y in RR$ tal que $x S y$. Entonces
          $
               x^2-y^2 & = 3x-3y    \
            -(x^2-y^2) & = -(3x-3y) \
               y^2-x^2 & = 3y-3x    \
          $
          Por lo tanto $y S x$
        ][
          *Transitividad:* Sea $x,y,z in RR$ tal que $x S y$ y $y S z$.
          $
            x S y ==> x^2-y^2=3x-3y \
            y S z ==> y^2-z^2=3y-3z
          $
          Luego
          $
            (x^2-y^2)+(y^2-z^2) & = (3x-3y)+(3y-3z) \
                        x^2-z^2 & = 3x-3z           \
          $
          Por lo tanto $x R z$
        ]
        Concluyendo $S$ es una relación de equivalencia
      ]
      #list[
        Halle $[a]_S$
        $ [a]_S & = {x in RR: x^2-a^2=3x-3a} $
        Resolviendo $x$ en la ecuación:
        $
                      x^2-a^2 & = 3x-3a  \
                   (x+a)(x-a) & = 3(x-a) \
          (x+a)(x-a) - 3(x-a) & = 0      \
                 (x-a)(x+a-3) & = 0      \
        $
        Entonces $x = a or x = 3-a$

        Por lo tanto
        $ [a]_S={a,3-a} $
      ][
        Halle $[0]_S = {0,3}$
      ][
        Halle $[2]_S = {2, 1}$
      ]
    ][
      Pruebe que en $RR$ la relación es de equivalencia
      $ x T y <==> x^3+2y = y^3+2x $
      #proof[
        #list[
          *Reflexividad:* Sea $x in RR$
          $ x=x --> x^3 = x^3 --> x^3+2x = x^3+2x $
          Por lo tanto $x T x$
        ][
          *Simetría:* Sean $x,y in RR$ tal que $x T y$
          $
            x T y --> x^3+2y & = y^3+2x           \
                      y^3+2x & = x^3+2y --> y T x \
          $
        ][
          *Transitividad:* Sean $x,y,z in RR$ tal que $x T y$ y $y T z$
          $
            x T y --> & x^3+2y & = y^3+2x \
            y T z --> & y^3+2z & = z^3+2y \
          $
          Luego
          $
                (x^3+2y) + (y^3+2z) & = (y^3+2x) + (z^3+2y)     \
            x^3+2z + cancel(y^3+2y) & = z^3+2x + cancel(y^3+2y) \
                             x^3+2z & = z^3+2x                  \
          $
          Por lo tanto $x T z$
        ]
        Concluyendo $T$ es una relación de equivalencia
      ]
      #list[
        Halle $[a]_T = {x in RR: x^3+2a=a^3+2x}$

        Resolvemos $x$ en la ecuación
        $
          0 & = x^3 - a^3 + 2a - 2x        \
            & = (x^2+x a+ a^2)(x-a)-2(x-a) \
            & = (x-a)(x^2+x a+ a^2-2)      \
        $
        - $x-a=0 --> x=a$

        - $x^2+x a+ a^2 -2=0$
          $
            x = (-a +- sqrt(a^2-4(1)(a^2-2)))/(2(1)) = (-a +- sqrt(8-3a^2))/2
          $
          En este caso $x$ solo esta definido cuando
          $
            8-3a^2>=0 --> a^2<=8/3 --> a <= +-sqrt(8/3) --> a in [-sqrt(8/3),sqrt(8/3)]
          $
        Por lo tanto $ [a]_T={a,(-a+sqrt(8-3a^2))/2, (-a-sqrt(8-3a^2))/2} $
        #figure(
          image("../assets/figure2.png"),
          caption: text(
            red,
          )[Duda: porque cuando hay intersección entre $f$ y $h$?],
          supplement: none,
        )
      ][
        Halle $[3]_T={3, ?, ?} = {3}$
      ][
        Halle $[5]_T={5, ?, ?} = {5}$
      ]
    ]
  ],
)
