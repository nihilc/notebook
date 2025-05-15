#import "@preview/cetz:0.3.4"
#import "@preview/cetz-venn:0.1.3"

= Conjuntos

== Operaciones

#list(
  list.item[
    Union\
    $A union B = {x|x in A or x in B}$
  ],
  list.item[
    Intersección\
    $A inter B = {x|x in A and x in B}$
  ],
  list.item[
    Complemento\
    $A^C = {x|x in.not A} \ C_U (A)= {x in U|x in.not A}$
  ],
  list.item[
    Diferencia\
    $A-B = {x|x in A and x in.not B}$
  ],
  list.item[
    Diferencia Simétrica\
    $A triangle B = {x|x in A or x in B}$
  ],
)

== Diagramas de Venn

Los diagramas de Venn nos ayudan a visualizar las operaciones entre conjuntos de una forma visual e intuitiva

#grid(
  columns: 2,
  column-gutter: 5pt,
  cetz.canvas({
    cetz-venn.venn2(a-fill: red)
    cetz.draw.content((0, 1.4), $A-B$)
  }),
  cetz.canvas({
    cetz-venn.venn2(not-ab-fill: red)
    cetz.draw.content((0, 1.4), $C_U (A)$)
  }),
)

== Igualdad de conjuntos

$
  A=B & <==> (forall x)(x in A <==> x in B)                      \
      & <==> (forall x)(x in A ==> x in B and x in B ==> x in A) \
$

#list[
  Ejemplo

  $A union (B inter C) = (A union B) inter (A union C)$
  #grid(
    columns: 3,
    column-gutter: 5pt,
    cetz.canvas({
      cetz-venn.venn3(abc-fill: blue, bc-fill: blue)

      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
      cetz.draw.content((0, 1.8), $B inter C$)
    }),
    cetz.canvas({
      cetz-venn.venn3(
        a-fill: yellow,
        ab-fill: yellow,
        ac-fill: yellow,
        abc-fill: yellow,
        bc-fill: yellow,
      )

      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
      cetz.draw.content((0, 1.8), $A union (B inter C)$)
    }),
    [],

    cetz.canvas({
      cetz-venn.venn3(
        a-fill: blue,
        ab-fill: blue,
        ac-fill: blue,
        abc-fill: blue,
        b-fill: blue,
        bc-fill: blue,
      )

      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
      cetz.draw.content((0, 1.8), $A union B$)
    }),
    cetz.canvas({
      cetz-venn.venn3(
        a-fill: red,
        ab-fill: red,
        ac-fill: red,
        abc-fill: red,
        c-fill: red,
        bc-fill: red,
      )

      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
      cetz.draw.content((0, 1.8), $A union C$)
    }),
    cetz.canvas({
      cetz-venn.venn3(
        a-fill: yellow,
        ab-fill: yellow,
        ac-fill: yellow,
        abc-fill: yellow,
        bc-fill: yellow,
      )

      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
      cetz.draw.content((0, 1.8), $(A union B) inter (A union C)$)
    }),
  )

  *Demostración:*

  $
    x in AA union (B inter C)
    & <==> x in A or x in B union C && "Def. Union"\
    & <==> x in A or (x in B and x in C) && "Def. Intersección" \
    & <==> (x in A or x in B) and (x in A or x in C) && "Tautologia" \
    & <==> x in A union B and x in A union C && "Def. Union"\
    & <==> x in (A union B) inter (A union C) && "Def. Intersección" \
  $
][
  Ejemplo:

  $A inter (B union C) = (A inter B) union (A inter C)$

  #grid(
    columns: 3,
    column-gutter: 5pt,
    cetz.canvas({
      cetz-venn.venn3(
        ab-fill: blue,
        ac-fill: blue,
        abc-fill: blue,
        b-fill: blue,
        bc-fill: blue,
        c-fill: blue,
      )

      cetz.draw.content((0, 1.8), $B union C$)
      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
    }),
    cetz.canvas({
      cetz-venn.venn3(ab-fill: yellow, ac-fill: yellow, abc-fill: yellow)

      cetz.draw.content((0, 1.8), $A inter (B union C)$)
      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
    }),
    [],

    cetz.canvas({
      cetz-venn.venn3(ab-fill: blue, abc-fill: blue)

      cetz.draw.content((0, 1.8), $A inter B$)
      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
    }),
    cetz.canvas({
      cetz-venn.venn3(ac-fill: red, abc-fill: red)

      cetz.draw.content((0, 1.8), $A inter C$)
      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
    }),
    cetz.canvas({
      cetz-venn.venn3(ab-fill: yellow, ac-fill: yellow, abc-fill: yellow)

      cetz.draw.content((0, 1.8), $(A inter B) union (A inter C)$)
      cetz.draw.content((-2, 1), $A$)
      cetz.draw.content((2, 1), $B$)
      cetz.draw.content((0, -2.2), $C$)
    }),
  )

  *Demostración:*

  $
    x in A inter (B union C)
    & <==> x in A and x in B union C && "Def. Intersección" \
    & <==> x in A and (x in B or x in C) && "Def. Union" \
    & <==> (x in A and x in B) or (x in A and x in C) && "Tautologia" \
    & <==> x in A inter B or x in A inter C && "Def. Intersección" \
    & <==> x in (A inter B) union (A inter C) && "Def. Union" \
  $
]

// TODO: Averiguar si se vieron otros temas como tipos de demostraciones

== Leyes de Morgan en conjuntos

#list[
  $(A union B)^C = A^C inter B^C$

  *Demostración:*

  $
    x in (A union B)^C & <==> x in.not A union B        && "Def. Complemento"     \
                       & <==> not (x in A union B)      && "Negación Pertinencia" \
                       & <==> not (x in A or x in B)    && "Def. Union"           \
                       & <==> not x in A and not x in B && "Tautologia"           \
                       & <==> x in.not A and x in.not B && "Negación Pertinencia" \
                       & <==> x in A^C and x in B^C     && "Def. Complemento"     \
                       & <==> x in A^C inter B^C        && "Def. Intersección"    \
  $
][

]

// TODO: Investigar otras leyes de Morgan para conjuntos y apuntarlas
