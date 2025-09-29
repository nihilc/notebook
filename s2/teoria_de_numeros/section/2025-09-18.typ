#import "@local/notebook:0.1.0": *

= Clase #datetime(year: 2025, month: 9, day: 18).display()

== Ejemplos Estructuras Algebraicas

#example[Semi-grupos][
  #enum[
    $(NN_(>0),+)$ \
    Sea $x,y,z in NN$
    #list(marker: $checkmark$)[
      Es asociativa $x+(y+z)=(y+x)+z$
    ][
      No existe $e$ tal que $x+e=e+x=x$
    ]
  ][
    $(A,*):$

    $display(
      mat(*, a, b; a, a, a; b, b, b; delim: #none, augment: #(hline: 1, vline: 1))
    )$

    #list(marker: $checkmark$)[
      Es asociativa

      $display(
        a*(a*a) = a = (a*a)*a \
        a*(a*b) = a = (a*a)*b \
        a*(b*a) = a = (a*b)*a \
        b*(a*a) = b = (b*a)*a \
      )$
    ][

      No existe $e in A$ tal que $e*x=x*e=x$

      $display(
        e = a ==> cases(a*e=a=e*a, b*e=b!=a=e*b) & quad ==> a "no es neutro" \
        e = b ==> cases(a*b=a!=b=b*a, b*b=b=b*b) & quad ==> b "no es neutro"
      )$
    ]
  ]
]

#example[Monoides][
  #enum[
    $(NN,+)$\
    Sea $x,y,z in NN$
    #list(marker: $checkmark$)[
      Es asociativa: $x+(y+z)=(y+x)+z$
    ][
      Es modulativa: Existe $0 in NN$ tal que $x+0=0+x=x$
    ][
      No es invertiva: No existe $x'$ tal que $x+x'=0=x'+x$
    ]
  ][
    $(cal(P)(A), union)$ \
    Sea $x,y in cal(P)(A)$
    #list(marker: $checkmark$)[
      Es asociativa: $x union y = y union x$
    ][
      Es modulativa: Existe $emptyset in cal(P)(A)$ tal que $x union emptyset = emptyset union x= x$
    ][
      No es invertiva: No existe $x' in cal(P)(A)$ tal que $x union x' = emptyset = x' union x$
    ]
  ]
]

#example[Grupos][
  #enum[
    // TODO: Demostrar
    $(G L_n (RR), dot )$
  ]
]

#example[Grupos Abelianos][
  #enum[
    $(ZZ,+)$ \
    Sea $x,y,z in ZZ$
    #list(marker: $checkmark$)[
      Es asociativa: $x+(y+z)=(x+y)+z$
    ][
      Es modulativa: Existe $0 in ZZ$ tal que $x+0=0+x=x$
    ][
      Es invertiva: Existe $x'$ tal que $x+x'=0=x'+x$
    ][
      Es conmutativa: $x+y=y+x$
    ]
  ][
    $(RR,+)$
    Sea $x,y,z in RR$
    #list(marker: $checkmark$)[
      Es asociativa: $x+(y+z)=(x+y)+z$
    ][
      Es modulativa: Existe $0 in RR$ tal que $x+0=0+x=x$
    ][
      Es invertiva: Existe $x'$ tal que $x+x'=0=x'+x$
    ][
      Es conmutativa: $x+y=y+x$
    ]
  ]
]

== Anillos

#definition[Anillos][
  Sea $A$ un conjunto y $*_1,*_2$ operaciones binarias sobre $A$ la tripla $(A,*_1,*_2)$ se dice anillo si:

  #enum[
    $(A,*_1)$ es un grupo abeliano.
  ][
    $*_2$ es asociativa.
  ][
    Se cumple:

    $
      (forall x,y in A)(quad
      x *_2(y *_1 z) & = (x *_2 y)*_1(x *_2 z) and   \
      (y *_1 z)*_2 x & = (y *_2 x)*_1(z *_2 x) quad) \
    $
  ]

  La operación $*_1$ se suele llamar *suma* y se suele denotar por $+$. \
  La operación $*_2$ se suele llamar *producto* y se suele denotar por $dot$

  - Si $*_2$ es conmutativa en $A$, se llama *anillo conmutativo*.
  - Si $*_2$ es conmutativa y modulativa en $A$, se llama *anillo conmutativo de identidad*.
  - Si $*_2$ es invertiva en $A\\{e}$, siendo $e$ el modulo de $*_1$, se llama *anillo de division*.
  - A se dice *dominio de integridad (DI)* si cada vez que $a*_2b=e$ se tiene que $a=e or b=e$
]

#example[
  #enum(spacing: 10pt)[
    $(ZZ,+,dot)$
    - $(ZZ,+)$ es un grupo abeliano.
    - $dot$ es distributivo con respecto a $+$.
    - $dot$ es asociativo.
    - $1$ es el modulo multiplicativo.
    - Siempre que $a dot b = 0 ==> a=0 or b=0$

    $(ZZ,+,dot)$ es *Anillo conmutativo con identidad que es dominio de integridad*.
  ][
    $(2ZZ,+,dot), quad 2ZZ="enteros pares"$
    - $(2ZZ,+)$ es grupo abeliano.
    - $dot$ distribuye con respecto a $+$.
    - $dot$ es asociativo.
    - No hay modulo multiplicativo.
    - Siempre que $a dot b = 0 ==> a=0 or b=0$.

    $(2ZZ,+,dot)$ es *Anillo conmutativo sin identidad que es dominio de integridad*
  ][
    $(RR,+,dot)$
    - $(RR,+)$ es grupo abeliano.
    - $dot$ distribuye con respecto a $+$.
    - $dot$ es asociativo.
    - $1$ es modulo multiplicativo.
    - $dot$ es invertiva en $RR\\{0}$ siendo $0$ modulo de $+$
    - Siempre que $a dot b = 0 ==> a=0 or b=0$.

    $(RR,+,dot)$ es *Anillo conmutativo con identidad que es de division y dominio de integridad*
  ][
    $(ZZ_4,+,dot)$

    #set math.mat(delim: none, augment: (hline: 1, vline: 1))
    $display(
      ZZ_4 = {0,1,2,3} \
      mat(
        +, 0, 1, 2, 3;
        0, 0, 1, 2, 3;
        1, 1, 2, 3, 0;
        2, 2, 3, 0, 1;
        3, 3, 0, 1, 2;
      ) quad
      mat(
        dot, 0, 1, 2, 3;
        0, 0, 0, 0, 0;
        1, 0, 1, 2, 3;
        2, 0, 2, 0, 2;
        3, 0, 3, 2, 1;
      )
    )$

    - $(ZZ_4,+)$ es grupo abeliano.
    - $dot$ es conmutativo.
    - No hay modulo multiplicativo.
    - No se cumple que $a dot b = e ==> a=e or b=e$ ya que $2 dot 2 = 0$

    $(ZZ_4,+,dot)$ es *Anillo conmutativo sin identidad (no es DI)*.
  ]
]

== Algoritmo de la division

#definition[Algoritmo de la division][
  Sean $a,b in ZZ$ con $b!=0$, entonces existen $q,r in ZZ$ únicos tal que:
  $ a= b q + r, quad 0<= r < |b| $
]

#example[
  $-7,3: quad -7 & = 3(-3) + 2, quad && 0<=2<3    \
              3 & =-7(0) + 3,       && 0<=3<|-7| \ $
]

== Máximo Común Divisor

#definition[
  Sean $a,b in ZZ$ no nulos simultáneamente, el *máximo común divisor* de $a$ y $b$, denotado por $(a,b)$ o $mcd(a, b)$ es el mas grande de los divisores comunes de $a$ y $b$. Si $(a,b)=1$, decimos que $a$ y $b$ son co-primos o primos relativos.
]

#example[
  $14,42: quad op("div")(14) & = {+-1,+-2,+-7,+-14}                   \
              op("div")(42) & = {+-1,+-2,+-3,+-6,+-7,+-14,+-21,+-42} \ $

  Divisores comunes de $14$ y $42$ son ${+-1,+-2,+-7,+-14}$

  $max{+-1,+-2,+-7,+-14}=14 ==> (14,42)=14$
]

#note[
  #enum[
    $a|0$ si existe $x in ZZ$ tal que $0=a x$

    Entonces $op("div")(0)=ZZ$, $a|0$ porque $a dot underbrace(0, x) = 0$

    Por ello no se puede considerar $(0,0)$ porque los divisores comunes de $0$ y $0$ es $ZZ$
  ][
    $a!=0, quad (a,0)=|a|$
  ]
]

#theorem[
  Sea $a,b in ZZ$ no nulos simultáneamente, entonces existen $x_0,y_0 in ZZ$ tal que:
  $ (a,b)= a x_0 + b y_0 $

  #proof[
    Sea $S={a x + b y: x,y in ZZ and a x + b y > 0} subset.eq NN$

    #enum[
      Si $a<=b$ entonces:
      - $a=b and a>0 --> a(1)+b(1) in S$
      - $a=b and a<0 --> a(-1)+b(-1) in S$
      - $a<b --> b-a>0 --> a(-1)+b(1) in S$\

      _"El razonamiento para $a>=b$ es análogo."_

      Entonces $S$ es no vació, por PBO tiene mínimo
    ][

      Como $min(S) in S$, existe $x_0,y_0 in ZZ$ tal que

      $ min(S)=a x_0 + b y_0 $

      $(a,b)|a and (a,b)|b ==> (a,b)|min(S)$ #h(1fr)

      Como $(a,b)|min(S) and (a,b)>0 and min(S)>0 ==> #rect[$(a,b)<=min(S)$]$

      Por algoritmo de Euclídes existen $q,r$ únicos tal que
      $ a=min(S) q + r, quad 0<=r<min(S) $
      $
        r & = a - min(S) q             \
          & = a - q(a x_0 + b y_0)     \
          & = a - a x_0 q - b y_0 q    \
          & = a(1 - x_0 q) + b(-y_0 q) \
      $
      Si $r>0$, entonces $r in S ==> r>= min(S)$ Lo cual es una contradicción, por lo tanto $r=0 ==> a= min(S) q ==> min(S)|a$

      _"El razonamiento para $min(S)|b$ es análogo"_

      #text(red)[Duda:]
      Como $min(S)|a and min(S)|b ==> min(S)|(a,b) ==> min(S)<=(a,b)$

      Por lo tanto $min(S)<=(a,b) and min(S)>=(a,b) ==> min(S)=(a,b)$
    ]
  ]
]<teo:8.4>
#example[
  $(42,105)=21$

  #set math.mat(delim: none, augment: (vline: 1))
  $ mat(42, 2; 21, 3; 7, 7; 1) quad mat(105, 3; 35, 5; 7, 7; 1) $

  $21=42(-2)+105(1) \ 21=42(3)+105(-1)$
]
