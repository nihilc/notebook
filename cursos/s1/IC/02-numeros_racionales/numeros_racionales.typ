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
  $
    0.75 = (0,75 dot 10^2) / 10^2 = (0.75 dot 100) / 100 = 75 / 100
  $
  Simplificando
  $ 75 / 100 = 15 / 20 = 3 / 4 $
][
  Ejemplo:
  $
    5.124 = (5.124 dot 10^3) / 10^3 = (5.124 dot 1000) / 1000 = 5124 / 1000
  $
  Simplificando
  $ 5124 / 1000 = 2562 / 500 = 1281 / 250 $
]

== Expresión decimal periódica pura

$
  a.overline(b_1 b_2 dots b_n) = (a. overline(b_1 b_2 dots b_n) dot (10^n-1)) / (10^n - 1)
$

#list[
  Ejemplo:
  $
    #let n1 = $2.overline(75)$
    n1 = (n1 (10^2 -1)) / (10^2 -1) = (275.overline(75) - n1) / (100 -1) = 273 / 99
  $
  Simplificando
  $ 273 / 99 = 91 / 33 $
][
  Ejemplo:
  $
    #let n1 = $0.overline(162)$
    n1 = (n1 (10^3-1)) / (10^3-1) = (162.overline(162)-n1) / (1000-1) = 162 / 999
  $
  Simplificando
  $ 162 / 999 = 54 / 333 = 18 / 111 = 6 / 37 $
]

== Expresión decimal periódica mixta

$
  #let n1 = $a.b_1 b_2 dots b_n overline(c_1 c_2 dots c_m)$
  n1 = (n1 dot 10^n dot (10^m-1)) / (10^n dot (10^m-1)) = (n1 dot ( 10^(n+m) - 10^n)) / (10^(n+m) - 10^n)
$

#list[
  Ejemplo:
  $
    #let n1 = $1.2overline(3)$
    n1 = (n1 dot 10(10-1)) / (10(10-1)) = (n1 (100-10)) / (100-10) = (123.overline(3) - 12.overline(3)) / 90 = 111 / 90
  $
  Simplificando
  $ 111 / 90 = 37 / 30 $
][
  Ejemplo:
  $
    #let n1 = $5.34overline(864)$
    n1 = (n1 dot 10^2(10^3-1)) / (10^2(10^3-1)) = (n1 (10^5-10^2)) / (10^5-10^2) = (534864.overline(864) - 534.overline(864)) / (100000-100) = 534330 / 99900
  $
  Simplificando
  $
    534330 / 99900 = 267165 / 49950 = 89055 / 16650 = 29685 / 5550 = 9895 / 1850 = 1979 / 370
  $
]
