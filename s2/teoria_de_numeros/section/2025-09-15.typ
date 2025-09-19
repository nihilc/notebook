#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 9, day: 16).display()
== Divisibilidad

#definition[Divisibilidad][
  Sean $a,b in ZZ$ con $a!=0$, decimos que $a$ divide a $b$ lo cual se denota por $a|b$, si existe $x in ZZ$ tal que $a x=b$, también decimos que $b$ es múltiplo de $a$. Si lo anterior no se tiene, decimos que $a$ no divide a $b$ lo cual se denota por $a divides.not b$.

  En algunos contextos $a^n||b$ significa que $a^n|b$ pero $a^(n+1) divides.not b$
]<def:divisibilidad>

#example[
  + $4,2: 2(2)=4 ==> 2|4$
  + $2,8: 2|8 and 2^2|8 ==> 2 parallel.not 8$
  + $3,6: 3|6 and 3^2 divides.not 6 ==> 3||6$
]

*Propiedades*

1. $a|b ==> a|b c, quad forall c in ZZ$
2. $a|b and b|c ==> a|c$
3. $a|b and a|c ==> a|(b x + c y), quad forall x,y in ZZ$
4. $a|b and b|a ==> a=+-b$

#definition[Sean $a,b in ZZ$, decimos $a<=b$ si existe $k in ZZ_(>=0)$ tal que $a+k=b$]

5. $a|b and a>0 and b>0 ==> a<=b$
6. $a|b <==> a m|b m, quad m in ZZ and m!=0:$

*Demostración de propiedades:*

1. #proof[
    Por hipótesis $b=a x, quad x in ZZ$
    $ b c = a x c ==> a|b c $
  ]
2. #proof[
    Por hipótesis $b=a x and c =b y, quad x,y in ZZ$
    $ c = b y = a x y ==>a|c $
  ]
3. #proof[
    Por hipótesis $b=a n and c = a m, quad n,m in ZZ$
    $ b x+ c y = a n x + a m y = a(n x + m y) ==> a | (b x = c y) $
  ]
4. #proof[
    Por hipótesis $b=a x and a=b y, quad x,y in ZZ$

    $
      a=b y = a x y & ==> a x y - a = 0                                 \
                    & ==> a(x y - 1) = 0                                \
                    & ==> cases(a&=0, x y &=1 ==> cases(x=1=y, x=-1=y)) \
    $
    + $b=a(1) ==> b=a$
    + $b=a(-1) ==> b=-a$
  ]
5. #proof[
    Por hipótesis $b=a x and a>0 and b>0, quad x in ZZ$

    $a>0 and b>0 ==> x>0$
    + $x=1 ==> b=a$
    + $x>=2 ==> b=a x = underbracket(a+a+dots+a, "x veces") = a + (k-1)a$, donde $(k-1)>0$, entonces $a<b$
    Por lo tanto $a<=b$
  ]
6. #proof[
    #list[
      $a|b==>a m|b m: quad$ Por hipótesis $b=a x, quad x in ZZ$
      $ b m = a x m = (a m) x ==> a m | b m $
    ][
      $a m|b m==>a|b: quad$ Por hipótesis $b m = a m x, quad x in ZZ$

      Como $m!=0$
      $ b m = a m x ==> b = a x ==> a|b $
    ]
  ]

== Estructuras algebraicas

#definition[
  Dado un conjunto no vació $A$, una *operación binaría* $*$ sobre $A$, es una función
  $
    *: A times A & --> A     \
           (a,b) & -->*(a,b) \
  $
  *Notación:* $*(a,b)=a*b$
]

#example[
  #enum[
    Suma en naturales es una operación binaria

    $+: NN times NN & --> NN  \
             (x,y) & --> x+y \ $
  ][
    Multiplicación en enteros es una operación binaria

    $dot: ZZ times ZZ & --> ZZ      \
               (x,y) & --> x dot y \ $
  ][
    La suma en $ZZ_3={0,1,2}$ es una operación binaria

    #grid(columns: 2, column-gutter: 10pt)[
      $display(
        mat(
          +_3, 0, 1, 2;
          0, 0, 1, 2;
          1, 1, 2, 0;
          2, 2, 0, 1;
          delim: #none,
          augment: #(hline: 1, vline: 1)
        )
      )$
    ][
      $
        +_3: ZZ_3 times ZZ_3 & --> ZZ_3        \
                       (2,1) & --> 2 +_3 1 = 0 \
      $
    ]
  ][
    La resta en $NN$ no es una operación binaria

    $(NN,-) quad 5-7=-2$
  ][
    La division en $RR$ no es una operación binaria

    $(RR,div) quad 5/0 "no esta definido"$
  ][
    La division en $RR\\{0}$ es una operación binaria

    $(RR\\{0}, div)$

    $div: RR times RR & --> RR  \
               (x,y) & --> x/y \ $
  ]
]

#definition[
  Sea $A$ un conjunto no vació y $*$ una operación binaria sobre $A$. Decimos que:
  + $*$ es asociativa si:
    $ (forall x,y,z in A)( (x*y)*z=x*(y*z) ) $
  + $*$ es modulativa si:
    $ (exists e in A )(forall x in A)(e*x = x*e = x) $
  + $*$ es invertiva si:
    $ (forall x in A)(exists x' in A)(x * x'=e=x'*x) $
  + $*$ es conmutativa si:
    $ (forall x,y in A)(x*y=y*x) $

  Una pareja $(A,*)$ se dice:
  + *Semi-grupo* si $*$ es asociativa.
  + *Monoide* si $*$ es asociativa y modulativa.
  + *Grupo* si $*$ es asociativa, modulativa e invertiva.
  + *Grupo Abeliano* si $*$ es asociativa, modulativa, invertiva y conmutativa.
]
