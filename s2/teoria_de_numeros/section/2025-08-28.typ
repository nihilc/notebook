#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 08, day: 28).display()

== PBO $<==>$ PIM(D)

#theorem[
  El #link(<def:PBO>)[Principio del buen orden] es equivalente al #link(<def:PIM_D>)[Principio de inducción matemática]
]<teo:PBO-PIM_D>

#proof[@teo:PBO-PIM_D][
  $"PBO" <==> "PIM(D)"$
  #enum[
    $"PBO" ==> "PIM(D)"$: Sea $S subset.eq NN$, tal que
    #enum()[
      $0 in S$
    ][
      Si $n in S$, entonces $n+1 in S$.
    ]
    Supongamos que $S subset.neq NN$. Como $S$ es no vació y $S subset.neq NN$, $S^c$ no es vació, luego por PBO, $S_c$ tiene mínimo, Sea $m=min(S)$. Veamos que $m-1 in S$. Si $m-1 in.not S ==> m-1 in S^c$. Como $m-1<m$, entonces $m$ no seria el minimo de $S_c$. Luego $m-1 in S$.

    Por _2._ Se tiene que $(m-1)+1=m in S$ lo cual es una contradiccion $-><-$
  ][
    $"PIM(D)"==> "PBO"$: Sea $S subset.eq NN$ no vacio.

    Caso 1 ($0 in S$): Entonces $min(S)=0$

    Caso 2 ($0 in.not S$): Sea $T={x in NN : forall s in S, quad x<s}subset.eq S^c$. Como $0$ es cota inferior de $S$ y $0 in.not S$, entonces $0 in T$, ademas $T!=NN$, para $T$ se satifase _1._ ($0 in T$), si _2._ es satisfecho por $T$, entoncecs por el PIM(D) se concluye que $T=NN$ lo cual es una contradiccion $-><-$
  ]
  Por lo tanto $"PBO" <==> "PIM(D)"$
]

== Principio de inducción matemática (general) | PIM(G)

#definition[PIM(G)][
  Sea $S subset.eq {x in NN: x>= k}= NN>=k$ que satisface
  + $k in S$
  + Si $n in S$, entonces $n+1 in S$
  Entonces $S=NN_k={k,k+1,k+2,dots}$
]<def:PIM_G>

#example[#link(<def:PIM_G>)[PIM(G)]][
  Demuestre que $(4/3)^n>n$

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    table(
      columns: 2,
      align: center + horizon,
      $ n $, $ (4/3)^n>0 $,
      $0$, $1>0$,
      $1$, $1.33 gt 1$,
      $2$, $1.71 gt.not 2$,
      $3$, $2.37 gt.not 3$,
      $4$, $3.16 gt.not 4$,
      $5$, $4.21 gt.not 5$,
      $6$, $5.62 gt.not 6$,
      $7$, $7.49 gt 7$,
      $8$, $9.99 gt 8$,
    ),
    box()[
      #image("../images/figure1.svg", fit: "contain")
    ],
  )
  #proof[

    Caso Base: $n=7$, $(4/3)^7 approx 7.49 > 7$

    Paso Inductivo: Supongamos que $(4/3)^k>k$ para $k>=7$ (HI)
    $
           (4/3)^k & > k          \
      (4/3)(4/3)^k & > 4/3k       \
       (4/3)^(k+1) & > (1 + 1/3)k \
       (4/3)^(k+1) & > k + k/3    \
    $
    Como $k>=7$, entonces $k/3>=7/3>1$, ahora $k+k/3>k+1$ por lo tanto
    $
      (4/3)^(k+1) & > k + 1
    $
  ]
]

== Principio de inducción matemática (fuerte) | PIM(F)

#definition[PIM(F)][
  Sea $S subset.eq NN_(>=k) = {k,k+1,k+2,dots}$ tal que
  + $k in S$
  + Cada vez que $m in S$, entonces $m+1 in S$ para $m>=k$
  Entonces $S=NN$
]<def:PIM_F>
