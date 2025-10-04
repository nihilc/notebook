#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 10, day: 2).display()

== Parcial

#exercise[
  Realizar los siguientes cálculos:

  #enum[
    $sum_(j=1)^5 sum_(i=1)^4 (i^2-j+1)$

    $
      sum_(j=1)^5 sum_(i=1)^4 (i^2-j+1) & = sum_(j=1)^5 (2-j + 5-j + 10-j + 17-j) \
                                        & = sum_(j=1)^5 (34-4j)                   \
                                        & = sum_(j=1)^5 34 - sum_(j=1)^5 4j       \
                                        & = 5 dot 34 - (4+8+12+16+20)             \
                                        & = 170 - 60                              \
                                        & = 110                                   \
    $
  ][
    $product_(d>=1 \ d|12) (12/d)$

    $d in {1,2,3,4,6,12}$
    $
      product_(d>=1 \ d|12) (12/d) & = 12/1 dot 12/2 dot 12/3 dot 12/4 dot 12/6 dot 12/12 \
      & = 12 dot 6 dot 4 dot 3 dot 2 dot 1 \
      & = 12^3 \
      & = 1728
    $
  ][
    $(963,657)$

    #set math.mat(delim: none, augment: (vline: 1), align: right)
    $
      mat(963, 3; 321, 3; 107, 107; 1) quad quad mat(657, 3; 219, 3; 73, 73; 1)
    $
    $
            963 & = 3^2 dot 73^0 dot 107^1     \
            657 & = 3^2 dot 73^1 dot 107^0     \
      (963,657) & = 3^2 dot 73^0 dot 107^0 = 9 \
    $
  ][
    Exprese $(36,63)$ como combinación lineal entera de $36$ y $63$.

    #set math.mat(delim: none, augment: (vline: 1), align: right)
    $
      mat(36, 2; 18, 2; 9, 3; 3, 3; 1) quad quad mat(63, 3; 21, 3; 7, 7; 1)
    $
    $
           36 & = 2^2 dot 3^2 dot 7^0     \
           63 & = 2^0 dot 3^2 dot 7^1     \
      (36,63) & = 2^0 dot 3^2 dot 7^0 = 9 \
    $
    $(36,63)=36(2)+63(-1)=72-63=9$
  ]
]
#exercise[
  Demuestra que si $m>0$, entonces $(m a,m b)=m(a,b)$

  #proof[
    Sea $S_1={m a x + m b y: x,y in ZZ and m a x + m b y > 0}$
    $
      (m a,m b)=min(S_1)= m a x_0 + m b y_0 = m(a x_0 + b y_0)
    $
    Como $m(a x_0 + b y_0) > 0$ y $m>0$, entonces $a x_0 + b y_0 >0$

    Sea $S_2={a x + b y: x,y in ZZ and a x + b y > 0}$
    $
      m(a x_0 + b y_0) = m dot min(S_2) = m(a,b)
    $
    Por lo tanto $(m a,m b)=m(a,b)$
  ]
]
#exercise[
  Considere la sucesión de números reales $(x_n)$, la cual se define por
  $ x_1=3, quad x_(n+1)=2-1/x_n, quad n>=1 $

  #enum[
    Explicite los primeros $6$ términos de la sucesión.

    $
      & x_1          && = 3                     \
      & x_2 = 2-1/3  && = 5/3   && = 1.dash(6)  \
      & x_3 = 2-3/5  && = 7/5   && = 1.4        \
      & x_4 = 2-5/7  && = 9/7   && approx 1.285 \
      & x_5 = 2-7/9  && = 11/9  && = 1.dash(2)  \
      & x_6 = 2-9/11 && = 13/11 && = 1.dash(18) \
    $
    #set math.mat(
      delim: none,
      augment: (hline: 1, vline: (1, 2, 3, 4, 5, 6)),
      align: right,
      gap: 10pt,
    )
    $
      mat(
        n, 1, 2, 3, 4, 5, 6;
        x_n, 3, 5/3, 7/5, 9/7, 11/9, 13/11
      )
    $
  ][
    Demuestre por inducción que $1<=x_n<=3$

    #proof[
      #list[
        Caso base: $n=1, quad x_1=3, quad 1<=x_1<=3$
      ][
        Paso inductivo: Supongamos que $1<=x_n<=3$.

        Por HI $ 1<=x_n ==> 1/x_n<=1 ==> -1/x_n>=-1 ==> 2-1/x_n >= 1 ==> x_(n+1) >=1 $

        Por HI $ x_n<=3 ==> 1/3<=1/x_n ==> -1/3>=-1/x_n ==> 2-1/3>=2-1/x_n ==> 5/3 >= x_(n+1) $

        Por lo tanto $1<=x_(n+1)<=5/3<3$
      ]
    ]
  ][
    Demuestre por inducción que $(x_n)$ es monótona decreciente

    #proof[
      #list[
        Caso base: $n=2,quad x_1=3, quad x_2=5/3, quad x_1>x_2$
      ][
        Paso inductivo: Supongamos $x_n>x_(n+1)$

        Por HI
        $
          x_n > x_(n+1) & ==> 1/x_(n+1) > 1/x_n
                          ==> -1/x_(n+1) < -1/x_n
                          ==> 2-1/x_(n+1) < 2-1/x_n \
                        & ==> x_(n+2) < x_(n+1)     \
        $
      ]
    ]
  ]
]
