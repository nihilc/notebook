#import "@local/notebook:0.1.0": *

#let con(n) = math.attach(math.equiv, br: n) // Congruencia
#let conn(n) = math.attach(math.equiv.not, br: n) // Congruencia
#let res = math.op("res")

== Relación de congruencia modulo $m$

#definition[
  Sea $n in ZZ^+$. Sobre $ZZ$ se define la relación $con(n)$, como
  $ a con(n) b <==> n|(a-b) $
  #text(red)[Nota:]
  #par(hanging-indent: 5pt, first-line-indent: 5pt)[
    $a con(n) b$ se lee "$a$ es congruente con $b$ modulo $n$" \
    $a con(n) b$ también se denota por $a equiv b (n)$
  ]
]

#example[
  - $7 con(2) 9$, porque $2|7-9 --> 2|-2$
  - $25 con(3) 7$, porque $3|25-7--> 3|18$
  - $9 conn(6) 25$, porque $6divides.not 9-25 --> 6 divides.not -16$
]

#theorem[
  La relación de congruencia modulo $n$ sobre $ZZ$ es de equivalencia

  #proof[
    #enum[
      *Reflexiva:* Sea $k in ZZ$. \
      Como $k-k=0$, luego $n|0$, entonces $k con(n) k$
    ][
      *Simetría:* Sean $a,b in ZZ$ tal que $a con(n) b$. \
      Que $a con(n) b$ implica $n|a-b$, entonces $n|b-a$, por tanto $b con(n) a$
    ][
      *Transitiva:* Sean $a,b,c in ZZ$ tal que $a con(n) b$ y $b con(n) c$. \
      $
        cases(
          delim: #none,
          a con(n) b & --> n & |a-b,
          b con(n) c & --> n & |b-c
        ) --> n|a-b+b-c --> n|a-c
      $
      Por lo tanto $a con(n) c$
    ]
  ]
]

#lemma[
  $a con(n) b <==> res_n (a) = res_n (b)$

  #proof[
    #list[
      $==>$
      - Por hipótesis $a con(n) b$, entonces $n|a-b$, existe $k in ZZ$ tal que $a-b=n k$, se sigue $a=n k + b$
      - Por algoritmo de la division $a=n q+r, quad q,r in ZZ$
      Igualando
      $
        n k + b & = n q + r     \
              b & = n q-n k + r \
              b & = n(q-k) + r  \
      $
      Por unicidad del algoritmo de la division
      $ res_n (a) = res_n (b) $


    ][
      $<==$
      $
        res_n (a) = res_n (b)
        --> cases(
          delim: #none,
          a = n q+r\, quad q in ZZ,
          b = n p+r\, quad p in ZZ
        )
        --> cases(
          delim: #none,
          r=a-n q,
          r=b-n p
        )
      $
      Igualando
      $
        a-n q = b-n p --> a-b = n (q-p) --> n|(a-b)
      $
      Por lo tanto $a con(n) b$
    ]
  ]
]

== Contracción de los $ZZ_n$ con congruencia modulo $n$

#[
  *Estudiemos* $ZZ\/con(n)$, $a in ZZ$

  $
    &[a]_con(n)={x in ZZ: x con(n) a}; quad x con(n) a ==> n|x-a ==> x-a = n k, quad k in ZZ ==> x=a+n k \
    &[a]_con(n)={a+n k: k in ZZ}
  $

  Miremos algunos ejemplos
  #let custom_rect(n, color) = {
    h(2pt)
    rect(stroke: color, inset: 3pt, outset: 0pt, n)
    h(2pt)
  }
  #let rr(n) = custom_rect(n, red)
  #let rb(n) = custom_rect(n, blue)
  #let rg(n) = custom_rect(n, green)
  #list[
    Para $n=2$
    $
      ZZ: {dots, rr(4),rb(-3),rr(-2),rb(-1),rr(0),rb(1),rr(2),rb(3),rr(4), dots}
    $
    Conjunto cociente $ZZ\/con(2) = {[a]: a in ZZ}$,

    Clases de equivalencia
    $
       #text($[0]$, red) & ={0+2k:k in ZZ}={2k: k in ZZ} = 2ZZ \
      #text($[1]$, blue) & ={1+2k: k in ZZ}=1+2ZZ              \
    $
    $ ZZ\/con(2)={[0],[1]};quad ZZ_2={dash(0),dash(1)}={0,1} $
  ][
    Para $n=3$
    $
      ZZ: {dots, rg(-4),rr(-3),rb(-2),rg(-1),rr(0),rb(1),rg(2),rr(3),rb(4), dots}
    $
    Conjunto cociente $ZZ\/con(3)={[a]: a in ZZ}$

    Clases de equivalencia
    $
        #text($[0]$, red) & ={0+3k: k in ZZ}= 3 ZZ  \
       #text($[1]$, blue) & ={1+3k: k in ZZ}= 1+3ZZ \
      #text($[2]$, green) & ={2+3k: k in ZZ}= 2+3ZZ \
    $
    $ ZZ\/con(3)={[0],[1].[2]};quad ZZ_2={dash(0),dash(1),dash(2)}={0,1,2} $
  ]
  Concluyendo en general
  $ ZZ\/con(n) = {[0],[1],[2],dots,[n-1]}; quad ZZ_n={0,1,2,dots,n-1} $
]

== Propiedades de las congruencias

#theorem[Propiedades de las congruencias][
  #set enum(numbering: "1)", spacing: 10pt)
  #set list(spacing: 10pt)
  Suponga que $a con(n) b$ y $c con(n) d$. Entonces
  + $a+c con(n) b+d$
  + $a-c con(n) b-d$
  + $a c con(n) b d$
  + $(forall k in ZZ^+)(a^k con(n) b^k)$
  + $(forall r in ZZ)(a+r con(n) b+r)$
  + $(forall r in ZZ)(a r con(n) b r)$
  + Si $p(x)=c_0+c_1 x + c_2 x^2 + dots + c_m x^m$ es un polinomio de grado $m$, con coeficientes en $ZZ$, entonces $p(a) con(n) p(b)$

  #proof[
    #set math.cases(delim: none)
    #enum[
      Por hipótesis
      $
        cases(
          a con(n) b --> n|a-b \
          c con(n) d --> n|c-d
        ) & --> n|(a-b)+(c-d)  \
          & --> n|(a+c)-(b+d)  \
          & --> a+c con(n) b+d \
      $
    ][
      Por hipótesis
      $
        cases(
          a con(n) b --> n|a-b \
          c con(n) d --> n|c-d
        ) & --> n|(a-b)+(d-c)  \
          & --> n|(a-c)-(b-d)  \
          & --> a-c con(n) b-d \
      $
    ][
      Por hipótesis
      $
        a con(n) b --> n|a-b --> a-b & =n k_1, quad k in ZZ \
                                   a & =n k_1 + b           \
                                                            \
        c con(n) d --> n|c-d --> c-d & =n k_2, quad k in ZZ \
                                   c & =n k_2 + d           \
      $
      Luego
      $
              a c & = (n k_1 + b)(n k_2 + d)                \
              a c & = n k_1 n k_2 + n k_1 d + n k_2 b + b d \
        a c - b d & = n( n k_1 k_2 + k_1 d + k_2 b)         \
      $
      Entonces
      $ n|a c - b d --> a c con(n) b d $
    ][
      Demostración por inducción sobre $k>=2$
      - Caso base: $k=2$ \
        Por hipótesis $a con(n) b$, por (3) $a a con(n) b b$, entonces $a^2 con(n) b^2$
      - Paso inductivo: Supongamos $a^k con(n) b^k$.\
        Por hipótesis $a con(n) b$ y por hipótesis de inducción $a^k con(n) b^k$. \
        Por (3) se tiene $a a^k con(n) b b^k$, entonces $a^(k+1) con(n) b^(k+1)$
    ][
      Por hipótesis $a con(n) b$. \
      Como la congruencia es reflexiva entonces $r con(n) r$ para $r in ZZ$ \
      Por (1) se tiene $a+r con(n) b+r$
    ][
      Por hipótesis $a con(n) b$. \
      Como la congruencia es reflexiva entonces $r con(n) r$ para $r in ZZ$ \
      Por (2) se tiene $a r con(n) b r$
    ][
      Demostración por inducción sobre grado del polinomio
      #list[
        Caso base: $m=1, quad p(x)=c_0+c_1 x$

        Como la congruencia es reflexiva $c_0 con(n) c_0$

        Por hipótesis $a con(n) b$, por (3) y (1) se tiene
        $
          c_1 a con(n) c_1 b \ c_0 + c_1 a con(n) c_0 + c_1 b \ p(a) con(n) p(b)
        $
      ][
        Paso Inductivo: \
        Supongamos $p_m (a) con(n) p_m (b)$ para $p_m (x)=c_0 + c_1 x + c_2 x^2 + dots + c_m x^m$

        Por hipótesis $a con(n) b$, por (4) y (3) se tiene $c_(m+1) a^(m+1) con(n) c_(m+1) b^(m+1)$

        Por hipótesis de inducción $p_m (a) con(n) p_m (b)$, entonces
        $
          c_0 + c_1a + c_2a^2 + dots + c_m a^m &con(n)
          c_0 + c_1b + c_2b^2 + dots + c_m b^m \
          c_0 + c_1a + c_2a^2 + dots + c_m a^m + c_(m+1)a^(m+1) &con(n)
          c_0 + c_1b + c_2b^2 + dots + c_m b^m + c_(m+1)b^(m+1) \
          p_(m+1) (a) & con(n) p_(m+1) (b)
        $
      ]
    ]
  ]
]
