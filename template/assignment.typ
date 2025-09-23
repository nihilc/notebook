/// Variables
#let date = datetime.today()
#let lang = "EN"
#let data = (
  title: "Title",
  author: "Author",
  author-id: "Author ID",
  course: "Course",
  professor: "Professor",
  faculty: "Faculty",
  university: "University",
)
#let font = (
  main: "IBM Plex Sans",
  math: "IBM Plex Math",
  mono: "IBM Plex Mono",
  size: 12pt,
)
#let color = (
  fg: rgb("#dcd7ba"), // #000000
  bg: rgb("#1f1f28"), // #ffffff
  bg-raw: rgb("#2a2a37"), // #f0f0f0
)

/// Configuration

// General
#set document(title: data.title, author: data.author, date: auto)
#set page(paper: "a4")

// Numbering
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

// Fonts
#set text(lang: lang, font: font.main, size: font.size)
#show math.equation: set text(font: font.math, size: font.size)
#show raw: set text(font: font.mono)

// Colors
#set page(fill: color.bg)
#set text(fill: color.fg)
#show raw.where(block: false): body => box(
  fill: color.bg-raw,
  inset: (x: 3pt, y: 1pt),
  outset: (x: 0pt, y: 2pt),
  radius: 2pt,
  {
    set par(justify: false)
    body
  },
)
#show raw.where(block: true): body => block(
  width: 100%,
  fill: color.bg-raw,
  outset: (x: 0pt, y: 4pt),
  inset: (x: 8pt, y: 4pt),
  radius: 2pt,
  {
    set par(justify: false)
    body
  },
)
#show link: set text(fill: blue)
#set line(stroke: 1pt + color.fg)
#set rect(stroke: 1pt + color.fg)
#set table(stroke: 1pt + color.fg)

// Style
#set page(header: context {
  if counter(page).get().at(0) > 1 {
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [#data.title - #data.course],
      // WARN: Solución visual al contador, buscar mejor solución
      [#(counter(page).get().at(0) - 1)],
    )
    line(length: 100%)
  }
})
#show heading: set block(spacing: 1em)
#set list(spacing: 10pt, indent: 2pt, marker: "•")
#set enum(spacing: 10pt, indent: 2pt, numbering: n => emph[#n.], full: false)

/// Content

// Title
#align(center + top, {
  v(25%)
  text(2em, weight: 500)[#data.title - #data.course]
  v(4em, weak: true)
  par[#data.author]
  par[#data.author-id]
  v(40%)
  par(data.professor)
  par(data.faculty)
  par(data.university)
  par(date.display())
})
#pagebreak()

// Content
#lorem(100)
