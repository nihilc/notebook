#set page(width: 15cm, height: auto)

= Divisibilidad

Sea $a,b in ZZ$ $a,b != 0$ decimos que $a$ divide a $b$ si existe un numero entero $c$ tal que $b=a dot c$ y se representa por $a / b$

También se dice que:

- $b$ es divisible por $a$
- $b$ es múltiplo de $a$
- $a$ es un factor de $b$
- $a$ es divisor de $b$

*Ejemplo:*

Determine si es verdadero o falso y justifique

#list(spacing: 10pt)[
  $3$ divide a $15$? $3|15$ \
  Verdadero porque $exists 5 in ZZ$ tal que $15=3 dot 5$
][
  $6$ es divisor de $100$? $6|100$ \
  Falso porque $not exists c in ZZ$ tal que $100=6 dot c$
][
  $8$ es divisible por $3$? $3|8$ \
  Falso porque $not exists c in ZZ$ tal que $8=3 dot c$
][
  $7$ es factor de $63$? $7|63$ \
  Verdadero porque $exists 9 in ZZ$ tal que $63=7 dot 9$
][
  $2$ divide a $1000$? $2|1000$ \
  Verdadero porque $exists 500 in ZZ$ tal que $1000=2 dot 500$
][
  $500$ es divisor de $12$? $500|12$ \
  Falso porque $not exists c in ZZ$ tal que $12=500 dot c$
]

== Enteros divisibilidad y multiplicidad

+ Escriba todos los divisores de $100$: \
  ${1,2,3,4,5,10,20,25,50,100}$

+ Escriba los $10$ primeros múltiplos de $4$: \
  ${0,4,8,12,16,20,24,28,32,36}$

+ Determine si $6|120, 120|6, 3|12, 12|3$ \
  $
    & V: 6|120 && ==> 120=6 dot 20                \
    & F: 120|6 && ==> 6=120 dot c and c in.not ZZ \
    & V: 3|12  && ==> 12=3 dot 4                  \
    & F: 12|3  && ==> 3=12 dot c and c in.not ZZ  \
  $

Observe:

#list(spacing: 10pt)[
  Un divisor de un entero $n$ siempre es menor o igual que $n$. Ademas $1$ es divisor de cualquier entero $n$ pues $n=n dot 1$

  $100 = 1 dot 100 = 2 dot 50 = 4 dot 25 = 5 dot 20 = 10 dot 10$
][
  Un múltiplo de un entero $n$ siempre es mayor o igual que $n$ y son de la forma $n,2n,3n,dots$ o también $dots,-3n,-2n,-n$
  #image("ej-multiplos.png")
  Observe que hay una cantidad infinita de múltiplos de un numero. Ademas $0$ es múltiplo de cualquier entero distinto de $0$: Si $n in ZZ ==> 0 = 0 dot n$
]

== Teoremas

#quote(
  block: true,
)[Teorema: Es una afirmación verdadera que debe ser probada por medio de una demostración matemática]

Sean $a,b,c in ZZ$ se cumple que:

#list(spacing: 10pt)[
  $a|b and a|c ==> a|(b+c)$

  $H: a|b and a|c \
  T: a|(b+c) "osea" exists n in ZZ ==> b+c=a dot n$

  Supongamos que $a|b and a|c$

  Es decir, $exists k in ZZ and b=a k$ y también $exists m in ZZ and c=a m$

  Sumando estas igualdades termino a termino obtenemos
  $
    b+c & = a k + a m \
        & = a(k+m)    \
  $

  Como $k in ZZ and m in ZZ$ entonces $k+m in ZZ$. Sea $n=k+m$. Luego:
  $ b+c=a n; quad n in ZZ $

  $therefore a|(b+c)$
][
  $a|b ==> a|b c$

  $H: a|b \
  T: a|b c "osea" exists n in ZZ and b c=a n$

  Supongamos que $a|b$. Es decir, $exists k in ZZ and b=a k$

  Multiplicamos por $c$
  $
    b c & = a k c  \
        & = a(k c) \
  $

  Como $k in ZZ and c in ZZ ==> k c in ZZ$ llamamos $n=k c$. Luego $b c = a n; quad n in ZZ$

  $therefore a|b c$
][
  $a|b and b|c ==> a|c$

  $H: a|b and b|c \
  T:a|c "osea" exists n in ZZ and c=a n$

  Supongamos que $a|b and b|c$

  Es decir $exists x,y in ZZ and b=a x and c=b y$

  Remplazamos $b=a x$ en $c=b y$ tenemos que $c=(a x)y=a(x y)$

  Como $x,y in ZZ ==> x y in ZZ$ llamamos $n=x y$

  Luego $c=a n; quad n in ZZ$

  $therefore a|c$
]

== Corolarios

#quote(
  block: true,
)[Corolario: Es una afirmación que es consecuencia de un teorema]

#list[
  $forall a,b,c in ZZ and a|b and a|c ==> a|(b m+c n) and m,n in ZZ$

  Supongamos que $a|b and a|c$

  Por la parte $2$ del teorema anterior tenemos que $a|b m$ para cualquier entero $m$

  Por la parte $2$ del teorema anterior tenemos que $a|c n$ para cualquier entero $n$

  Luego como $a|b m and a|c n$ por la parte $1$ del teorema anterior se obtiene $a|(b m+c n)$
]
