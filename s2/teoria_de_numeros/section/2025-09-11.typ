#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 9, day: 11).display()
== Quiz

#exercise[
  Calcule el valor exacto de $sum_(n=1)^1023 log_2(1+1/n)$

  $
    sum_(n=1)^1023 log_2(1+1/n) & = sum_(n=1)^1023 log_2((n+1)/n)          \
                                & = sum_(n=1)^1023 (log_2(n+1) - log_2(n)) \
                                & = log_2(1024)-log_2(1)                   \
                                & = 10 -0                                  \
  $
]
#exercise[
  @ej:1.7

  Se definen los números $F_n$ de Fermat por $F_n=2^2^n + 1, quad n ={0,1,2,dots}$

  Demuestre que para todo $n>=1$
  $ F_0 F_1 F_2 dots F_(n-1)+2 = F_n $

  #proof[
    - _CB:_ $n=1$
      $
        cases(F_0+2=(2^2^0+1)+2=5, F_1=2^2^1+1=5, delim: #none) quad ==> F_0+2=F_1
      $
    - _PI:_ Supongamos que $F_0F_1F_2 dots F_(n-1)+2=F_n$
      $
        F_0F_1F_2 dots F_(n-1)F_n + 2 & = (F_n -2)F_n + 2 \
        & = (F_n)^2 - 2F_n + 2 \
        & = (2^2^n + 1)^2 - 2(2^2^n + 1) + 2 \
        & = (2^2^n)^2 +cancel(2 dot 2^2^n) + 1 -cancel(2 dot 2^2^n) -cancel(2) +cancel(2) \
        & = 2^(2^n dot 2) + 1 \
        & = 2^2^(n+1) + 1 \
        & = F_(n+1)
      $
  ]
]
#exercise[
  // TODO: Revisar enunciado original
  Demuestre por que por @def:PBO[PBO] si $x,y in NN$, entonces $x>=y$ o $y>=x$

  #proof[
    Sean $x,y in NN$, entonces ${x,y} subset.eq NN$. Como ${x,y}$ es no vació, entonces existe $m =min({x,y})$

    - Caso 1: $m=x and m=x<=y$
    - Caso 2: $m=y and m=y<=x$
  ]
]
