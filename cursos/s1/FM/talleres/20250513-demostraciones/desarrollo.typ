#set enum(numbering: "A.1.", spacing: 15pt)
#set list(spacing: 10pt)
#let box_center(content) = align(center, box(
  [#content],
  outset: 3pt,
  stroke: gray,
))
#let box_yellow(content) = box([#content], stroke: yellow, outset: 3pt)
#let box_gray(content) = box([#content], stroke: gray, outset: 3pt)

= Demostraciones Directas

#enum(enum.item[
  Demuestre por método directo
  #enum(
    enum.item[
      Si $x$ es un entero par, entonces $x^2$ es par.

      *Demostración Directa:*

      Supongamos $x$ es entero par \
      Entonces $x$ es de la forma $x=2n$ donde $n in ZZ$ \
      Remplazando
      $ x^2 = (2n)^2 = 4n^2 = 2(2n^2) $
      LLamemos $m=2n^2$, como $n in ZZ$ entonces $m in ZZ$ \
      Por lo tanto $x^2=2m$ \
      $therefore x^2 "es par"$
    ],

    enum.item[
      Si $x$ es un entero impar, entonces $x^3$ es impar.

      *Demostración Directa:*

      Supongamos $x$ es entero impar \
      Entonces $x$ es de la forma $x=2n+1$ donde $n in ZZ$ \
      Remplazando
      $
        x^3 & = (2n+1)^3                                             \
            & #box_yellow[$(x+y)^3= x^3 + 3x^2y + 3x y^2 + y^3$]     \
            & = (2n)^3 + 3 dot (2n)^2 dot 1 + 3 dot 2n dot 1^2 + 1^3 \
            & = 8n^3 + 12n^2 + 6n + 1                                \
            & = 2 ( 4n^3 + 6n^2 + 3n ) + 1                           \
      $
      LLamemos $m=4n^3+6n^2+3n$, como $n in ZZ$ entonces $m in ZZ$ \
      Por lo tanto $x^3=2m+1$ \
      $therefore x^3 "es impar"$
    ],

    enum.item[
      Si $a$ es un entero impar, entonces $a^2 + 3a + 5$ es impar.

      *Demostración Directa:*

      Supongamos $a$ es entero impar \
      Entonces $a$ es de la forma $a=2n+1$ donde $n in ZZ$ \
      Remplazando
      $
        a^2 + 3a + 5 & = (2n+1)^2 + 3(2n+1) + 5                  \
                     & #box_yellow[$(x+y)^2 = x^2 + 2x y + y^2$] \
                     & = 4n^2 + 4n + 1 + 6n + 3 + 5              \
                     & = 4n^2 + 10n + 8 + 1                      \
                     & = 2( 2n^2 + 5n + 4 ) + 1                  \
      $
      Llamemos $m = 2n^2 + 5n + 4$, como $n in ZZ$ entonces $m in ZZ$ \
      Por lo tanto $a^2+3a+5 = 2m+1$ \
      $therefore a^2+3a+5 "es impar"$
    ],

    enum.item[
      Suponga $x,y in ZZ$. Si $x$ y $y$ son impares, entonces $x y$ es impar.

      *Demostración Directa:*

      Supongamos $x$ y $y$ son enteros impares \
      Por lo tanto son de la forma $x=2n+1$ y $y=2m+1$ con $n,m in ZZ$\
      Remplazando
      $
        x y & = (2n+1)(2m+1)          \
            & = 4 n m + 2n + 2m + 1   \
            & = 2( 2 n m + n + m) + 1 \
      $
      Llamemos $p = 2 n m + n + m$, como $n,m in ZZ$ entonces $p in ZZ$ \
      Por lo tanto $x y = 2p + 1$ \
      $therefore x y "es impar"$
    ],

    enum.item(16)[
      Si dos enteros tienen la misma paridad, entonces su suma es par.

      *Demostración Directa:*

      - Tomemos $x,y in ZZ$ son pares \
        Por lo tanto son de la forma $x=2n$ y $y=2m$ con $n,m in ZZ$ \
        Remplazando
        $ x+y=2n+2m=2(n+m) $
        Llamemos $p=n+m$, como $n,m in ZZ$ entonces $p in ZZ$ \
        Por lo tanto $x+y=2p$ \
        $therefore x+y "es par"$

      - Tomemos $x,y in ZZ$ son impares \
        Por lo tanto son de la forma $x=2n+1$ y $y=2m+1$ con $n,m in ZZ$\
        Remplazando
        $
          x+y & = (2n+1)+(2m+1) \
              & = 2n + 2m + 2   \
              & = 2(n+m+1)      \
        $
        Llamemos $p=n+m+1$, como $n,m in ZZ$ entonces $p in ZZ$ \
        Por lo tanto $x+y=2p$ \
        $therefore x+y "es par"$
    ],

    enum.item[
      Si dos enteros tienen paridad opuesta, entonces su producto es par.

      *Demostración Directa:*

      Tomemos $x in ZZ$ par y $y in ZZ$ impar \
      Por lo tanto son la de forma $x=2n$ y $y=2m+1$ con $n,m in ZZ$ \
      Remplazando
      $ x y = (2n)(2m+1) = 4n m + 2n = 2(2n m + n) $
      Llamemos $p=2n m + n$, como $n,m in ZZ$ entonces $p in ZZ$ \
      Por lo tanto $x y =2p$ \
      $therefore x y "es par"$
    ],

    enum.item[
      Suponga $x,y in RR^+$. Si $x<y$, entonces $x^2<y^2$

      *Demostración Directa:*

      Supongamos que $0<x<y$ \
      Tomemos $x<y$ multiplicamos por $x$ tenemos $x^2 < x y$ \
      Tomemos $x<y$ multiplicamos por $y$ tenemos $x y < y^2$ \
      $therefore x^2 < y^2 "Por transitividad"$
    ],
  )
])


#pagebreak()
= Demostraciones por Contra-Reciproca

#enum(
  enum.item[
    Demuestre por método Contra-Reciproca
    #enum(
      enum.item[
        Suponga $n in ZZ$. Si $n^2$ es par, entonces $n$ es par.

        *Demostración Contra-Reciproca:*
        #box_center[
          $
                p: n^2 "es par" & ==> q: n "es par"         \
            not q: n "es impar" & ==> not p: n^2 "es impar" \
          $
        ]
        Supongamos que $n$ es impar \
        Por lo tanto $n$ es de la forma $n=2a+1$ con $a in ZZ$ \
        Remplazando
        $
          n^2 & = (2a+1)^2             \
              & = (2a)^2 + 2(2a) + 1^2 \
              & = 4a^2 + 4a + 1        \
              & = 2( 2a^2 + 2a ) + 1   \
        $
        Llamemos $b = 2a^2 + 2a$, como $a in ZZ$ entonces $b in ZZ$ \
        Por lo tanto $x^2 = 2b+1$ \
        $therefore x^2 "es impar"$
      ],

      enum.item[
        Suponga $n in ZZ$. Si $n^2$ es impar, entonces $n$ es impar.

        *Demostración Contra-Reciproca:*
        #box_center[
          $
            p: n^2 "es impar" & ==> q: n "es impar"     \
            not q: n "es par" & ==> not p: n^2 "es par" \
          $
        ]
        Supongamos que $n$ es par \
        Por lo tanto $n$ es de la forma $n=2a$ con $a in ZZ$ \
        Remplazando
        $
          n^2 = (2k)^2 = 4k^2 = 2(2k^2)
        $
        Llamemos $b= 2k^2$, como $a in ZZ$ entonces $b in ZZ$ \
        Por lo tanto $n^2=2b$ \
        $therefore n^2 "es par"$
      ],

      enum.item[
        Suponga $a,b in ZZ$. Si $a^2(b^2-2b)$ es impar, entonces $a$ y $b$ son impares.

        *Demostración Contra-Reciproca:*
        #box_center[
          #grid(
            columns: 3,
            column-gutter: 10pt,
            $
              p:a^2(b^2-2b) "es impar" \
              q: a "es impar" \
              r: b "es impar"
            $,
            $
              p ==> (q and r) \
              not (q and r) ==> not p \
              (not q or not r) ==> not p
            $,
            $
              not p:a^2(b^2-2b) "es par" \
              not q: a "es par" \
              not r: b "es par"
            $,
          )
        ]
        Supongamos que $a$ es par o $b$ es par, tenemos los siguientes casos: \
        #list(
          list.item[
            Caso $a$ y $b$ son pares \
            Por lo tanto son de la forma $a=2n$ y $b=2m$ con $n,m in ZZ$ \
            Remplazando
            $
              a^2(b^2-2b) & = (2n)^2 ((2m)^2-2(2m)) \
                          & = 4n^2 (4m^2 - 4m)      \
                          & = 16n^2m^2 - 16n^2m     \
                          & = 2 ( 8n^2m^2 - 8 n^2m) \
            $
            Llamemos $k=8n^2m^2 - 8 n^2m$, como $n,m in ZZ$ entonces $k in ZZ$ \
            Por lo tanto $a^2(b^2-2b)=2k$ \
            $therefore a^2(b^2-2b) "es par"$
          ],

          list.item[
            Caso $a$ impar y $b$ par \
            Por lo tanto son de la forma $a=2n+1$ y $b=2m$ con $n,m in ZZ$ \
            Remplazando
            $
              a^2(b^2-2b) & = (2n+1)^2 ( (2m)^2 - 2(2m) )                       \
                          & = (4n^2 + 4n + 1) (4m^2 - 4m)                       \
                          & = 4m^2(4n^2 + 4n + 1) - 4m(4n^2 + 4n + 1)           \
                          & = 16n^2m^2 + 16n m^2 + 4m^2 - 16n^2m - 4n m - 4m    \
                          & = 2 ( 8n^2m^2 + 8n m^2 + 2m^2 - 8n^2m - 2n m - 2m ) \
            $
            Llamemos $k = 8n^2m^2 + 8n m^2 + 2m^2 - 8n^2m - 2n m - 2m$ \
            Como $n,m in ZZ$ entonces $k in ZZ$
            Por lo tanto $a^2(b^2-2b)=2k$ \
            $therefore a^2(b^2-2b) "es par"$
          ],

          list.item[
            Caso $a$ par y $b$ impar \
            Por lo tanto son de la forma $a=2n$ y $b=2m+1$ con $n,m in ZZ$ \
            Remplazando
            $
              a^2(b^2-2b) & = (2n)^2 ( (2m+1)^2 - 2(2m+1) )  \
                          & = 4n^2 ( 4m^2 + 4m + 1 -4m - 2 ) \
                          & = 4n^2 (4m^2 - 1)                \
                          & = 16n^2m^2 - 4n^2                \
                          & = 2 ( 8n^2m^2 - 2n^2 )           \
            $
            Llamemos $k=8n^2m^2 - 2n^2$, como $n,m in ZZ$ entonces $k in ZZ$ \
            Por lo tanto $a^2(b^2-2b)= 2k$ \
            $therefore a^2(b^2-2b) "es par"$
          ],
        )
      ],

      enum.item[
        Suponga $a,b,c in ZZ$. Si $a$ no divide a $b c$, entonces $a$ no divide a $b$.

        *Demostración Contra-Reciproca:*
        #box_center[
          $
            p: a divides.not b c & ==> q: a divides.not b \
                      not q: a|b & ==> a|b c              \
          $
        ]
        Supongamos que $a|b$ entonces existe $n in ZZ$ tal que $b=a n$ \
        Multiplicando termino a termino
        $
            b & = a n   \
          b c & = a n c \
        $
        Llamemos $m = n c$, como $n,c in ZZ$ entonces $m in ZZ$ \
        Por lo tanto $b c = a m$ \
        $therefore a|b c "por definicion"$
      ],

      enum.item[
        Suponga $x in RR$. Si $x^2+5x<0$ entonces $x<0$

        *Demostración Contra-Reciproca:*
        #box_center[
          $
            p:x^2+ 5x < 0 & ==> q: x < 0           \
              not q: x>=0 & ==> not p: x^2+5x >= 0 \
          $
        ]
        Supongamos $x>=0$ por lo tanto $x in PP or x=0$, analizamos los casos:
        - Caso $x>0$ \
          Como $x in PP$ entonces $x^2 in PP$ y $5x in PP$ también $x^2 + 5x$ \
          Por definición $x^2+ 5x> 0$ \
          $therefore x>0 ==> x^2+5x>=0$
        - Caso $x=0$
          $
                x^2+5x & >= 0 \
            0^0 + 5(0) & >= 0 \
                0 >= 0        \
          $
          $therefore x=0 ==> x^2+5x>=0$
      ],

      enum.item[
        Suponga $x in RR$. Si $x^3-x>0$ entonces $x > -1$

        *Demostración Contra-Reciproca:* *INCOMPLETO*
        #box_center[
          $
            p: x^3-x > 0 & ==> q: x>= 0          \
            not q: x < 0 & ==> not p: x^3-x <= 0 \
          $
        ]
        Supongamos $x < 0$ entonces $-x in PP$ \

        *Demostración Directa*

        Factorizamos $x^3-x<=0$ como $x(x-1)(x+1)<=0$ \
        Utilizamos
        $
          a b c&<=0 \
          (a b >=0 and c <= 0) & or (a b <= 0 and c >= 0) \
          (((a>=0 and b>=0) or (a<=0 and b<=0)) and c<=0) & or (((a>=0 and b<=0) or (a<=0 and b>=0)) and c>=0) \
        $
        Remplazando
        $
          x(x-1)(x+1) &<= 0 \
          ( x(x-1)>=0 and x+1<=0 )
          &or ( x(x-1)<=0 and x+1>=0 ) \
          (((x>=0 and x-1>=0) or (x<=0 and x-1<=0)) and x+1<=0 )
          &or ((( x>=0 and x-1<=0 ) or ( x<=0 and x-1>=0)) and x+1>=0) \
          (((x>=0 and x>=1) or (x<=0 and x<=1)) and x<=-1 )
          &or ((( x>=0 and x<=1 ) or ( x<=0 and x>=1)) and x>=-1) \
          x in{{ [1,infinity) union (-infinity,0] } inter (-infinity,-1] }
          &union {{ [0,1] union emptyset } inter [-1,infinity) }\
          x in (-infinity,-1] &union [0,1] \
          x <= -1 &or 0<=x<=1
        $
      ],
    )
  ],

  enum.item[
    Demuestre por Directa o Contra-Reciproca
    #enum(
      enum.item[
        Si $a,b in ZZ$ y $a$ y $b$ tienen la misma paridad, entonces $3a + 7$ y $7b-4$ no.

        *Demostración Directa:*

        Supongamos que $a,b$ comparten paridad, entonces tenemos los casos:

        - $a,b$ son pares \
          Por lo tanto son de la forma $a=2n$ y $b=2m$ con $n,m in ZZ$ \
          Remplazando
          $
            3a+7 = 3(2n)+7 = 6n + 6 + 1 = #box_gray[$2(3n + 3) + 1$] \
            7b-4 = 7(2m)-4 = 14m - 4 = #box_gray[$2(7m - 2)$]
          $
          Como $n,m in ZZ$ entonces $p=3n+3 in ZZ$ y $q=7m-2 in ZZ$ \
          Remplazando $3a+7=2p+1$ y $7b-4=2q$ \
          Por lo tanto $3a+7$ es impar y $7b-4$ es par \
          $therefore$ Si $a$ y $b$ comparten paridad $3a+7$ y $7b-4$ no.

        - $a,b$ son impares \
          Por lo tanto son de la forma $a=2n+1$ y $b=2m+1$ con $n,m in ZZ$ \
          Remplazando
          $
            3a+7 = 3(2n+1)+7 = 6n+3+7 = 6n+10 = #box_gray[$2(3n+5)$] \
            7b-4 = 7(2m+1)-4 = 14m+7-4 = 14m+2+1 = #box_gray[$2(7m+1)+1$]
          $
          Como $n,m in ZZ$ entonces $p=3n+5 in ZZ$ y $q=7m+1 in ZZ$ \
          Remplazando $3a+7=2p$ y $7b-4=2q+1$ \
          Por lo tanto $3a+7$ es par y $7b-4$ es impar \
          $therefore$ Si $a$ y $b$ comparten paridad $3a+7$ y $7b-4$ no.
      ],

      enum.item[
        Suponga $x in ZZ$. Si $x^3-1$ es par, entonces $x$ es par.

        *Demostración Contra-Reciproca:*

        #box_center[
          $
              p: x^3-1 "es par" & ==> q: x "es par"           \
            not q: x "es impar" & ==> not p: x^3-1 "es impar" \
          $
        ]

        Supongamos que $x$ es impar \
        Por lo tanto es de la forma $x=2n+1$ con $n in ZZ$ \
        Remplazando
        $
          x^3-1 & = (2n+1)^3-1                       \
                & = (2n)^3 + 3(2n)^2 + 3(2n) + 1 - 1 \
                & = 8n^3 + 12n^2 + 6n                \
                & = 2 ( 4n^3 + 6n^2 + 3n )           \
        $
        Sea $m = 4n^3 + 6n^2 + 3n$, como $n in ZZ$ entonces $m in ZZ$ \
        Por lo tanto $x^3-1 = 2m$ es par \
        $therefore$ No se cumple la contra-reciproca por lo tanto la premisa es falsa
      ],

      enum.item[
        Suponga $x in ZZ$. Si $x+y$ es par, entonces $x$ y $y$ tienen la misma paridad.

        *Demostración Contra-Reciproca:*

        #box_center[
          $
                              p: x+y "es par" & ==> q: x,y "comparten paridad" \
            not q: x,y "no comparten paridad" & ==> not p: x+y "es impar"      \
          $
        ]

        Supongamos que $x,y$ no comparten paridad entonces tenemos los casos:\

        - $x$ es par y $y$ es impar \
          Por lo tanto son de la forma $x=2n$ y $y=2m+1$ con $n,m in ZZ$ \
          Remplazando
          $
            x + y = 2n + 2m + 1 = 2(n+m) + 1
          $
          Sea $k=n+m$, como $n,m in ZZ$ entonces $k in ZZ$ \
          Por lo tanto $x+y = 2k+1$ \
          $therefore x+y "es impar"$

        - $x$ es impar y $y$ es par
          Por lo tanto son de la forma $x=2n+1$ y $y=2m$ con $n,m in ZZ$ \
          Remplazando
          $
            x + y = 2n + 1 + 2m = 2(n+m) + 1
          $
          Sea $k=n+m$, como $n,m in ZZ$ entonces $k in ZZ$ \
          Por lo tanto $x+y = 2k+1$ \
          $therefore x+y "es impar"$
      ],

      enum.item[
        Si $n$ es par, entonces $8|(n^2-1)$

        *Demostración Directa:*

        Supongamos que $n$ es par \
        Por lo tanto $n$ es de la forma $n=2k$ con $k in ZZ$ \
        Por definición $8|(n^2-1)$ implica $n^2-1=8m$ con $m in ZZ$
        Remplazando
        $
              n^2-1 & = 8m \
           (2k)^2-1 & = 8m \
             4k^2-1 & = 8m \
             4k^2-1 & = 8m \
          2(2k^2)-1 & = 8m \
        $
        Vemos que $2(2k^2)-1$ siempre sera impar, por lo que es imposible que sea múltiplo de $8$
        $therefore$ La proposición es falsa
      ],
    )
  ],
)


#pagebreak()
== Demostraciones por Contradicción

#enum(
  enum.item[
    Demuestre por método Contradicción
    #enum(
      enum.item[
        Suponga $n in ZZ$, Si $n$ es impar, entonces $n^2$ es impar.

        *Demostración Contradicción:*

        #box_center[
          $
            p: n "es impar" ==> q:n^2 "es impar" \
            p: n "es impar" and not q:n^2 "es par"
          $
        ]

        Supongamos que $n$ es impar y $n^2$ es par \
        Por lo tanto $n$ es de la forma $n=2k+1$ con $k in ZZ$ \
        Remplazando
        $
          n^2 = (2k+1)^2 = 4k^2+4k+1 = #box_gray[$2(2k^2+2k)+1$]
        $
        Sea $m=2k^2+2k$, como $k in ZZ$ entonces $m in ZZ$ \
        Entonces $n^2=2m+1$ \
        Por lo tanto $n^2$ es impar lo cual contradice nuestra suposición \
        $therefore n "es impar" => n^2 "es impar"$
      ],

      enum.item[
        Suponga $n in ZZ$, Si $n^2$ es impar, entonces $n$ es impar.

        #box_center[
          $
            p: n^2 "es impar" ==> q:n "es impar" \
            p: n^2 "es impar" and not q:n "es par"
          $
        ]

        Supongamos que $n^2$ es impar y $n$ es par \
        Por lo tanto $n$ es de la forma $n=2k$ con $k in ZZ$ \
        Remplazando
        $
          n^2 = (2k)^2 = 4k^2 = #box_gray[$2(2k^2)$]
        $
        Sea $m=2k^2$, como $k in ZZ$ entonces $m in ZZ$ \
        Entonces $n^2=2m$ \
        Por lo tanto $n^2$ es par lo cual contradice nuestra suposición \
        $therefore n^2 "es impar" => n "es impar"$
      ],

      enum.item[
        Pruebe que $root(3, 2)$ es irracional.

        #box_center[$p: root(3, 2) in II quad not p: root(3, 2) in QQ$]

        #align(
          right,
          quote(
            block: true,
          )[$root(3, 2) in.not II <=> root(3, 2) in QQ$ Solamente si $root(3, 2) in RR$],
        )

        Supongamos que $root(3, 2) in QQ$ \
        Por lo tanto existen $p,q in ZZ$ co-primos $op("mcd")(p,q)=1$, Tal que $root(3, 2)=p / q$ \
        Ahora
        $
          root(3, 2) & = p / q     \
                   2 & = p^3 / q^3 \
                2q^3 & = p^3       \
        $
      ],

      enum.item[
        Pruebe que $sqrt(6)$ es irracional.
      ],

      enum.item[
        Pruebe que $sqrt(3)$ es irracional.
      ],

      enum.item[
        Si $a,b in ZZ$, entonces $a^2-4b-2 != 0$
      ],

      enum.item[
        Si $a,b in ZZ$, entonces $a^2-4b-3 != 0$
      ],

      enum.item[
        Suponga $a,b,c in ZZ$. Si $a^2+b^2=c^2$, entonces $a$ o $b$ son pares.
      ],
    )
  ],
)


#pagebreak()
= Demostraciones Extra

#enum(
  enum.item[
    Suponga $x,n in ZZ$. $x "es impar" <==> x^n "es impar"$ askdfj

    *Demostración:*

    #list(
      list.item[
        $p: x "impar" ==> q: x^n "impar"$ \
        _Por inducción:_

        Supongamos que $x$ es impar \

        #list(
          list.item[
            Base: $n=0$ \
            Como $x$ es impar $x!=0$, $x^0=1$ que es impar
          ],
          list.item[
            Paso Inductivo: $n>=0$ \
            Supongamos que $x^k$ es impar para $k in ZZ$ y $k>=0$ (hipótesis inductiva) \
            Como $x$ es impar, es de la forma $x=2m+1$ con $m in ZZ$
            Entonces
            $
            x^(k+1)=x^k x
            $
          ],
        )


        $therefore x "impar" ==> x^n "impar"$
      ],

      list.item[
        $q: x^n "impar" ==> p: x "impar"$ \
        _Por contra-reciproca:_
        $ not p: x "par" ==> not q: x^n "par" $
        Supongamos que $x$ es par,\
        Por lo tanto es de la forma $x=2k$ con $k in ZZ$ \
        Remplazando $x^n=(2k)^n = 2^n k^n$ \
        Vemos que uno de los factores de $x^n$ siempre es una potencia de $2$ \
        Por lo tanto $x^n$ siempre es par

        $therefore x^n "impar" ==> x "impar"$
      ],
    )


  ],

  enum.item[
    a
  ],
)


#pagebreak()
= Dudas

- Casi Siempre se obvia o ignora la pertenencia y simplemente se trabaja con las otras premisas
  #set math.equation(numbering: "(1)")

  *Ejemplo:*\
  "Supongamos $x,y in ZZ$. Si $x y=0$ entonces $x=0$ o $y=0$"

  Casi siempre se toma solamente
  $
    underbrace(x y=0, "P") ==> "(" underbrace(x=0, "Q") or underbrace(y=0, "R") ")"
  $ <d_p_invalid>

  Pero se debería tomar
  $
    "(" underbrace(x in ZZ, "P") and underbrace(y in ZZ, "Q") and underbrace(x y=0, "R") ")" ==> "(" underbrace(x=0, "S") or underbrace(y=0, "T") ")"
  $ <d_p_valid>

  - Negación \
    Si negamos @d_p_invalid
    $
      not (x y=0 ==> (x=0 or y=0)) \
      x y=0 and not (x=0 or y=0) \
      x y=0 and not x=0 and not y=0 \
      x y=0 and x!=0 and y!=0 \
    $ <not-d_p_invalid>
    Si negamos @d_p_valid
    $
      not ( (x in ZZ and y in ZZ and x y=0) ==> (x=0 or y=0) ) \
      (x in ZZ and y in ZZ and x y=0) and not (x=0 or y=0) \
      x in ZZ and y in ZZ and x y=0 and not x=0 and not y=0 \
      x in ZZ and y in ZZ and x y=0 and x!=0 and y!=0 \
    $<not-d_p_valid>
    Vemos que @not-d_p_invalid y @not-d_p_valid Son parecidas, simplemente se ignoran las pertenencias.

  - Contra-Reciproca \
    Si sacamos la contra-reciproca de @d_p_invalid
    $
           not (x=0 or y=0) & ==> not x y=0 \
      (not x=0 and not y=0) & ==> not x y=0 \
            (x!=0 and y!=0) & ==> x y!=0    \
    $ <cr-d_p_invalid>
    Si sacamos la contra-reciproca de @d_p_valid
    $
           not (x=0 or y=0) & ==> not (x in ZZ and y in ZZ and x y=0)       \
      (not x=0 and not y=0) & ==> (not x in ZZ or not y in ZZ or not x y=0) \
            (x!=0 and y!=0) & ==> (x in.not ZZ or y in.not ZZ or x y!=0)    \
    $ <cr-d_p_valid>
    Vemos que @cr-d_p_invalid y @cr-d_p_valid vuelven a ser muy parecidas \
    Como $x in.not ZZ or y in.not ZZ or x y!=0$ esta relacionado por $or$ podemos simplificar los $in.not$

  *Preguntas:*
  - Es realmente necesario ser estricto?
  - Una demostración puede quedar mal si no se es estricto?
