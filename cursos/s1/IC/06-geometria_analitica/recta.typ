== Recta

Uno de los axiomas en los cuales se fundamenta la geometría euclidiana afirma que por dos puntos distintos del plano pasa una única recta. Utilizaremos este hecho para caracterizar los puntos de una recta en el plano cartesiano, de modo que podamos determinar si un punto est´a o no en una recta dada.

La ecuación general de una recta es $a x + b y + c = 0$ con $a,b,c in RR and (a!=0 or b!=0 or c!=0)$

#list[
  Ejemplo:

  $2x+y-5=0$

  Por tabulación:
  #table(
    columns: 6,
    align: right,
    $x$, $-2$, $-1$, $0$, $1$, $2$,
    $y$, $9$, $7$, $5$, $3$, $1$,
  )
  #image("recta1.png")
]

=== Ecuación General

$ a x + b y + c = 0 $

=== Pendiente

Tengamos $(x_1,y_1)$ y $(x_2,y_2)$ puntos en el plano, decimos que su pendiente es
$ m=(y_2-y_1) / (x_2-x_1) $

Observemos que la pendiente de una recta no esta definida cuando $x_1 = x_2$, es decir, cuando la recta es vertical.


=== Ecuación punto pendiente

$ y - y_1 = m(x - x_1) $

=== Ecuación pendiente ordenada al origen

$ y = m x + b $

Donde $b$ es la Ordenada al origen

=== Notación Vectorial

- $arrow(V)$: Vector directa
- $P$: punto recta
- $t$: Un escalar

$
  (x,y) & = P + t arrow(V)         \
  (x,y) & = (x_1,y_1) + t(a,b)     \
        & = (x_1,y_1) + (t a,t b)  \
        & = (x_1 + t a, y_1 + t b) \
$
Igualando $x=x_1+t a$ y $y=y_1+t b$

#align(center, table(
  columns: 2,
  column-gutter: 30pt,
  stroke: none,
  $
                x & = x_1 + t a \
          x - x_1 & = t a       \
    (x - x_1) / a & = t         \
  $,
  $
              y & = y_1 + t b \
          y-y_1 & = t b       \
    (y-y_1) / b & = t         \
  $,
))

Si igualamos los términos obtenemos

=== Ecuación paramétrica de la recta

$ (x-x_1) / a = (y-y_1) / b $
