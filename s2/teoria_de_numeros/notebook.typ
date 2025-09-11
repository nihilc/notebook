#import "@local/notebook:0.1.0": *

#show: notebook.with(
  lang: "ES",
  paper: "a4",
  title: "Teoria de Numeros",
  author: "Christian Cardenas",
  theme: "dark",
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
Se desarrollaron Ejercicios #link(<ej:4.3>)[4.3] y #link(<ej:4.4>)[4.4]

#pagebreak()
// Clase 6
= Clase #datetime(year: 2025, month: 9, day: 11).display()
