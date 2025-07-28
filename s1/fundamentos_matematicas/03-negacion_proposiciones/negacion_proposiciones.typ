#set table(stroke: 0.5pt)
#let T = text(green)[T]
#let F = text(red)[F]

= Negación de proposiciones

#align(center, box(
  inset: 5pt,
  stroke: black,
  $
       not (not p) & <==> p                              \
      not (p or q) & <==> not p and not q                \
     not (p and q) & <==> not p or not q                 \
     not (p ==> q) & <==> p and not q                    \
    not (p <==> q) & <==> (p and not q) or (not p and q) \
  $,
))

== Tablas de verdad de negaciones

#list(
  list.item[
    $not (not p) <==> p$
    #table(
      align: center,
      columns: 3,
      $p$, $not p$, $not (not p)$,
      [#T], [#F], [#T],
      [#F], [#T], [#F],
    )
  ],
  list.item[
    $not (p or q) <==> not p and not q$
    #table(
      align: center,
      columns: 8,
      $p$,
      $q$,
      $p or q$,
      $not (p or q)$,
      $not p$,
      $not q$,
      $not p and not q$,
      $not (p or q)<==>not p and not q$,

      [#T], [#T], [#T], [#F], [#F], [#F], [#F], [#T],
      [#T], [#F], [#T], [#F], [#F], [#T], [#F], [#T],
      [#F], [#T], [#T], [#F], [#T], [#F], [#F], [#T],
      [#F], [#F], [#F], [#T], [#T], [#T], [#T], [#T],
    )
  ],
  list.item[
    $not (p and q) <==> not p or not q$
    #table(
      align: center,
      columns: 8,
      $p$,
      $q$,
      $p and q$,
      $not (p and q)$,
      $not p$,
      $not q$,
      $not p or not q$,
      $not (p and q)<==>not p or not q$,

      [#T], [#T], [#T], [#F], [#F], [#F], [#F], [#T],
      [#T], [#F], [#F], [#T], [#F], [#T], [#T], [#T],
      [#F], [#T], [#F], [#T], [#T], [#F], [#T], [#T],
      [#F], [#F], [#F], [#T], [#T], [#T], [#T], [#T],
    )
  ],
  list.item[
    $not (p ==> q) <==> p and not q$
    #table(
      align: center,
      columns: 7,
      $p$,
      $q$,
      $p ==> q$,
      $not (p ==> q)$,
      $not q$,
      $p and not q$,
      $not (p ==> q)<==>p and not q$,

      [#T], [#T], [#T], [#F], [#F], [#F], [#T],
      [#T], [#F], [#F], [#T], [#T], [#T], [#T],
      [#F], [#T], [#T], [#F], [#F], [#F], [#T],
      [#F], [#F], [#T], [#F], [#T], [#F], [#T],
    )
  ],
  list.item[
    $not (p <==> q) <==> (p and not q) or (not p and q)$
    #table(
      align: center,
      columns: 10,
      $p$,
      $q$,
      $p <=> q$,
      $not (p<=>q)$,
      $not p$,
      $not q$,
      $p and not q$,
      $not p and q$,
      $(p and not q) or (not p and q)$,
      $not (p<=>q) <=> (p and not q) or (not p and q)$,

      [#T], [#T], [#T], [#F], [#F], [#F], [#F], [#F], [#F], [#T],
      [#T], [#F], [#F], [#T], [#F], [#T], [#T], [#F], [#T], [#T],
      [#F], [#T], [#F], [#T], [#T], [#F], [#F], [#T], [#T], [#T],
      [#F], [#F], [#T], [#F], [#T], [#T], [#F], [#F], [#F], [#T],
    )
  ],
)
