#set quote(block: true)
= Racionales

$
  QQ = {p / q | p in ZZ and q in ZZ and q != 0}
$

Expresión decimal
- Exacta
- Periódica pura
- Periódica mixta

#quote[Si una fracción no se puede escribir de la forma anterior es un irracional]

== Fracciones generatriz

La fracción generatriz es una fracción que representa un número decimal, ya sea exacto o periódico. Por ejemplo, el número decimal $0.overline(3)$ se puede expresar como la fracción $1 / 3$. Esta fracción irreductible es la que da como resultado el número decimal correspondiente.

== Expresión decimal exacta

$
  a.b_1 b_2 dots b_n = (a.b_1b_2...b_n dot 10^n) / (10^n) = (a b_1b_2...b_n) / (10^n)
$

#list[
  Ejemplo:
]

== Expresión decimal periódica pura

$
  a.overline(b_1 b_2 dots b_n) = (a. overline(b_1 b_2 dots b_n) dot (10^n-1)) / (10^n - 1)
$

#list[
  Ejemplo:
]

== Expresión decimal periódica mixta

$
  #let n1 = $a.b_1 b_2 dots b_n overline(c_1 c_2 dots c_m)$
  n1 = (n1 dot 10^n dot (10^m-1)) / (10^n dot (10^m-1)) = (n1 dot ( 10^(n+m) - 10^n)) / (10^(n+m) - 10^n)
$

#list[
  Ejemplo:
]
