#import "@local/notebook:0.1.0": *

== Ejercicios

#exercise[
  Demostrar que la siguiente sucesión es monótona y acotada

  $ x_1=3, quad x_(n+1)=2-1/x_n, quad n>=1 $

  #proof[monotonía][
    - Caso base: $x_1=3, x_2=2-1/3=1.dash(6) ==> x_1>=x_2$
    - Paso inductivo: Supongamos que $x_n>=x_(n+1)$, Por hipótesis de inducción
      $
                x_n & >= x_(n+1) \
          1/x_(n+1) & >= 1/x_n   \
         -1/x_(n+1) & <= -1/x_n  \
        2-1/x_(n+1) & <= 2-1/x_n \
            x_(n+2) & <= x_(n+1) \
      $
    Por lo tanto ${x_n}$ es monótona decreciente.
  ]

  #proof[acotamiento][
    #grid(columns: 3)[
      Acotamiento inferior:
      - _CB_: $x_1=3, quad x_1>=1$\
      - _PI_: Supongamos que $x_n>=1$, por hipótesis de inducción
        $
          x_n & >=1        \
            1 & >= 1/x_n   \
           -1 & <= -1/x_n  \
          2-1 & <= 2-1/x_n \
            1 & <= x_(n+1) \
        $
    ][
      Acotamiento superior:
      - _CB_: $x_1=3, quad x_1<=3$\
      - _PI_: Supongamos que $x_n<=3$, por hipótesis de inducción
        $
                     x_n & <= 3       \
                     1/3 & <= 1/x_n   \
                    -1/3 & >= -1/x_n  \
                   2-1/3 & >= 2-1/x_n \
          3 >= 1.dash(6) & >= x_(n+1) \
        $
    ]
    Por lo tanto ${x_n}$ es acotada.
  ]
]<ej:4.3>

#exercise[
  Demostrar que la siguiente sucesión es monótona y acotada:

  $ x_1=4, quad x_(n+1)=1+ sqrt(x_n-1), quad n>=1 $

  #proof[monotonía][
    - _CB:_ $x_1=4, quad x_2=1+sqrt(3) approx 2.73$
    - _PI:_ Supongamos que $x_n>=x_(n+1)$, por HI
      $
                  x_n & >= x_(x+1)           \
                x_n-1 & >= x_(x+1)-1         \
          sqrt(x_n-1) & >= sqrt(x_(x+1)-1)   \
        1+sqrt(x_n-1) & >= 1+sqrt(x_(x+1)-1) \
              x_(n+1) & >= x_(n+2)           \
      $
    Por lo tanto la sucesión ${x_n}$ es monótona decreciente
  ]

  #proof[acotamiento][
    - _CB:_ $x_1=4,quad 1<=x_1<=5$
    - _PI:_ Supongamos que $1<=x_n<=5$, por HI.
      $
        1 <= x_n <= 5 \
        0 <= x_n-1 <= 4 \
        0 <= sqrt(x_n-1) <= 2 \
        1 <= 1+sqrt(x_n-1) <= 3 \
        1 <= x_(n+1) <= 3 \
        1 <= x_(n+1) <= 5 \
      $
    Por lo tanto la sucesión ${x_n}$ es acotada.
  ]
]<ej:4.4>

#exercise[
  Demostrar que la siguiente sucesión es monótona y acotada:
  $ x_1=1, quad x_(n+1)=sqrt(2+x_n), quad n>=1 $

  #table(
    columns: 2,
    $n$, $x_n$,
    $1$, $1$,
    $2$, $sqrt(3) approx 1.73$,
    $3$, $sqrt(3.73) approx 1.93$,
    $4$, $sqrt(3.93) approx 1.98$,
    $5$, $sqrt(3.98) approx 1.99$,
  )

  #proof[monotonía][
    - _CB:_ $x_1=1, quad x_2=sqrt(3) approx 1.73 ==> x_1<= x_2$
    - _PI:_ Supongamos que $x_n<=x_(n+1)$, por hipótesis de inducción

      $x_n <= x_(n+1) ==>
      2+x_n <= 2+x_(n+1) ==>
      sqrt(2+x_n) <= sqrt(2+x_(n+1)) ==>
      x_(n+1) <= x_(n+2)$
    Por lo tanto la sucesión ${x_n}$ es monótona creciente
  ]

  #proof[acotamiento][
    - _CB:_ $x_1=1, quad 1<=x_1<=2$
    - _PI:_ Supongamos que $1<=x_n<=2$, Por hipótesis de inducción

      $1 <= x_n <= 2 ==>
      3 <= 2+x_n <= 4 ==>
      sqrt(3) <= sqrt(2+x_n) <= sqrt(4) ==>
      1.73 <= x_(n+1) <= 2 ==>
      1 <= x_(n+1) <= 2$
    Por lo tanto la sucesión ${x_n}$ es acotada
  ]
]

#exercise[
  Demostrar que la siguiente sucesión es monótona y acotada:
  $ x_1=sqrt(5), quad x_(n+1)=sqrt(sqrt(5)+x_n), quad n>=1 $

  #table(
    columns: 2,
    $n$, $x_n$,
    $1$, $2.236$,
    $2$, $2.114$,
    $3$, $2.085$,
    $4$, $2.078$,
    $5$, $2.077$,
  )

  #proof[monotonía][
    - _CB:_ $x_1=sqrt(5) approx 2.23, quad x_2=sqrt(sqrt(5)+x_1) approx 2.11 ==> x_1>=x_2$
    - _PI:_ Supongamos que $x_n>=x_(n+1)$, por hipótesis de inducción

      $x_n >= x_(n+1) ==>
      sqrt(5) + x_n >= sqrt(5) + x_(n+1) ==>
      sqrt(sqrt(5) + x_n) >= sqrt(sqrt(5) + x_(n+1)) ==> x_(n+1) >= x_(n+2)$
    Por lo tanto la sucesión ${x_n}$ es monótona decreciente
  ]

  #proof[acotamiento][
    - _CB:_ $x_1=sqrt(5) ==> 2<=x_1<=3$
    - _PI:_ Supongamos que $2<=x_n<=3$, por hipótesis de inducción

      $
        2 <= x_n <= 3 \
        sqrt(5)+2 <= sqrt(5)+x_n <= sqrt(5)+3 \
        sqrt(sqrt(5)+2) <= sqrt(sqrt(5)+x_n) <= sqrt(sqrt(5)+3) \
        2.05 <= x_(n+1) <= 2.28 \
        2 <= 2.05 <= x_(n+1) <= 2.28 <= 3
      $
    Por lo tanto la sucesión ${x_n}$ es acotada
  ]
]
