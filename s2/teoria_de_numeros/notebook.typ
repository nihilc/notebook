#import "@local/notebook:0.1.0": *

#show: notebook.with(
  lang: "ES",
  paper: "a4",
  title: "Teoria de Numeros",
  author: "Christian Cardenas",
  theme: "dark",
)

#include "./section/info.typ"

#pagebreak()

#include "./section/2025-08-25.typ"
#include "./section/2025-08-25-ej.typ"

#pagebreak()

#include "section/2025-08-28.typ"
#include "section/2025-08-28-ej.typ"
