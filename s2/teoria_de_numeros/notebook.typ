#import "@local/notebook:0.1.0": *

#let dark = true
#show: notebook.with(
  lang: "ES",
  paper: "a4",
  title: "Teoria de Numeros",
  author: "Christian Cardenas",
  theme: if dark { "dark" } else { "light" },
)
#set page(height: auto)

#include "./section/info.typ"
#pagebreak()

// Clase 1
#include "./section/2025-08-25.typ"
#include "./section/2025-08-25-ej.typ"
#pagebreak()

// Clase 2
#include "section/2025-08-28.typ"
#include "section/2025-08-28-ej.typ"
#pagebreak()

// Clase 3
#include "section/2025-09-01.typ"
#include "section/2025-09-01-ej.typ"
#pagebreak()

// Clase 4
#include "section/2025-09-04.typ"
#include "section/2025-09-04-ej.typ"
#pagebreak()

// Clase 5
= Clase #datetime(year: 2025, month: 9, day: 08).display()
Se desarrollaron @ej:4.3 y @ej:4.4
#pagebreak()

// Clase 6
#include "section/2025-09-11.typ"
#pagebreak()

// Clase 7
#include "section/2025-09-15.typ"
#pagebreak()

// Clase 8
#include "section/2025-09-18.typ"
#pagebreak()

// Clase 9
= Clase #datetime(year: 2025, month: 9, day: 22).display()
Se hizo demostración de @teo:8.4

// Clase 10
= Clase #datetime(year: 2025, month: 9, day: 25).display()
No clase por evento

// Clase 11
= Clase #datetime(year: 2025, month: 9, day: 29).display()
Se hizo demostración de Ejercicios 1,3,4 del Taller 1
#pagebreak()

// Clase 12
#include "section/2025-10-02.typ"
#pagebreak()

// Clase 13
= Clase #datetime(year: 2025, month: 10, day: 6).display()
Corrección parcial
#pagebreak()

// Clase 14
= Clase #datetime(year: 2025, month: 10, day: 9).display()

== Parcial 1 Parte 2

#exercise[
  + Defina MCM de dos números y explique la importancia de la necesidad de las hipótesis.
  + Ejemplifique y demuestre el método usado.
  + Extienda la definición de MCM a un conjunto de $n$ números finito.
  + Realice una lista de 10 propiedades del MCM.
  + Demuestre cada una de las propiedades anteriores.
]
Resuelto en anexo "assignments/parcial-1.2.pdf"
#pagebreak()

// Clase 15, 16, 17
= Clase #datetime(year: 2025, month: 10, day: 13).display()
Festivo no clase

= Clase #datetime(year: 2025, month: 10, day: 16).display()
Clase cancelada

= Clase #datetime(year: 2025, month: 10, day: 20).display()
Entrega Parcial,Taller,Quiz

// TODO:
*Actividad*: Demostrar $[a,b]=(|a b|)/((a,b))$ por casos

#proof[
  #list[
    Caso 1: $(a,b)=1, quad [a,b]=|a b|$
    + $|a b| > 0$
    + $|a b|$ es múltiplo común de $a$ y $b$
    + $n in ZZ^+$ y $a|n$ y $b|n$
    Por (3) $n=a k = b t, quad k,t in ZZ$
  ][
    Caso 2: $(a,b)>1$
  ]
]
#pagebreak()

// Clase 18
= Clase #datetime(year: 2025, month: 10, day: 23).display()

== Relaciones
*Apuntes pendientes*

= Clase #datetime(year: 2025, month: 10, day: 27).display()

#pagebreak()

= Clase #datetime(year: 2025, month: 10, day: 30).display()

== Ejercicios
Resolución ejercicios 3,5,6 pagina 115 Muñoz
#include "section/2025-10-30.typ"
