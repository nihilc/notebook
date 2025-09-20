#import "@local/notebook:0.1.0": *

== Ejercicios

// TODO: Demostrar
#exercise[
  Demuestre que dadas $a,b in ZZ$ con $b!=0$, existen $q,r in ZZ$ unicos tal que
  $ a=b q + r, quad 0<=r<b $
  #proof[
    #list[
      Si $a>=0 and$
    ]
  ]
]<ej:1.4>

#exercise[
  Porque no es posible dividir por $0$ en $ZZ$?

  #proof[
    _(Por contradicción)_

    Supongamos que $0|a$, para cualquier $a in ZZ$, entonces existe un único $b in ZZ$ tal que $a = 0 dot b$

    - Caso $a!=0$: entonces $a=0 dot b$, pero $0dot b = 0$, entonces $a=0$ '$-><-$'.
    - Caso $a=0$: entonces $0=0 dot b$ implica que $b$ podría ser cualquier entero, entonces $b$ no seria único '$-><-$'.

    Por lo tanto $0 divides.not a$
  ]
]<ej:1.5>

#exercise[
  Demuestre que no hay enteros entre $0$ y $1$

  #proof[
    Sea $S={m in ZZ: m>0}$, por PBO $S$ tiene mínimo, sea $r=min(S)$

    Si $r>1$, entonces $r-1>=1$, por lo que $r-1>=1>0$, Luego $r-1 in S$. Pero esto contradice que $r$ sea el minimo de $S$, por lo tanto $r>1$ es falsa y debemos tener $r<=1$, pero como $r in S$ implica $r>0$, concluyendo $0<r<=1$. Esto fuerza a $r=1$

    Asi $1$ es el menor elemento de $S$; Por lo tanto no existe $n in ZZ$ con $0<n<1$.
  ]
]<ej:1.6>

#exercise[
  Se definen los números $F_n$ de Fermat por $F_n=2^2^n + 1, n ={0,1,2,dots}$

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
]<ej:1.7>

#exercise[
  Demuestre que $54|2^(2n+1)-9n^2+3n-2$

  #proof[
    Sea $S={n in ZZ : 54|2^(2n+1)-9n^2+3n-2}$
    #list[
      _Caso Base:_ $n=0$
      $ 2^(2(0)+1)-9(0)^2+3(0)-2 = 2-2 = 0 $
      $54|0 ==> 0 in S$
    ][
      _Paso Inductivo:_ Supongamos que $54|2^(2n+1)-9n^2+3n-2$

      $
          & 2^(2(n+1)+1) -9(n+1)^2 +3(n+1) - 2 \
        = & 2^(2n+2+1) -9(n^2+2n+1) +3n +3 -2  \
        = & 2^(2n+3) - 9n^2 -18n -9 +3n +1     \
        = & 4 dot 2^(2n+1) - 9n^2 -15n -8      \
      $
      Por hipótesis de inducción: $2^(2n+1) = 54m +9n^2 -3n +2, quad m in ZZ$
      $
          & 4 dot 2^(2n+1) - 9n^2 -15n -8     \
        = & 4(54m +9n^2 -3n +2) -9n^2 -15n -8 \
        = & 216m +36n^2 -12n +8 -9n^2 -15n -8 \
        = & 216m +27n^2 -27n                  \
        = & 216m +27(n^2 -n)                  \
      $
      Como $n^2-n=n(n-1)$ es par ya que es producto de dos enteros consecutivos podemos llamarlo $2k=n(n-1)$

      $
          & 216m +27(n^2 -n) \
        = & 216m +27(2k)     \
        = & 216m +54k        \
        = & 54(4m +k)        \
      $
      $54|2^(2(n+1)+1) -9(n+1)^2 +3(n+1) - 2 ==> n+1 in S$
    ]
    Por lo tanto $S=NN$
  ]
]<ej:1.8>
