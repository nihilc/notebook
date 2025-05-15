#let T = table.cell(fill: green)[T]
#let F = table.cell(fill: red)[F]
#let E = table.cell(stroke: none)[]

= Lista de Tautologías

== Lista Rápida

+ $p and q <==> q and p$
+ $p or q <==> q or p$
+ $p and (q and r) <==> (p and q) and r$
+ $p or (q or r) <==> (p or q) or r$
+ $p and p <==> p$
+ $p or p <==> p$
+ $p and (q or r) <==> (p and q) or (p and r)$
+ $p or (q and r) <==> (p or q) and (p or r)$
+ $not (not p) <==> p$
+ $not (p and q) <==> not p or not q$
+ $not (p or q) <==> not p and not q$
+ $(p ==> q) <==> (not p or q)$
+ $not (p ==> q) <==> (p and not q)$
+ $p ==> (q or r) <==> (p and not q)==>r$
+ $p ==> (q or r) <==> (p and not r)==>q$
+ $p ==> (q and r) <==> (p==>q) and (p==>r)$

== Tablas de verdad

// TODO: Completar tablas de tautologías

- $(p ==> q) <==> (not p or q)$
- $not (p ==> q) <==> (p and not q)$
#table(
  align: center,
  columns: 10,
  $p$,
  $q$,
  $not p$,
  $not q$,
  E,
  $p==>q$,
  $not p or q$,
  E,
  $not (p==>q)$,
  $p and not q$,

  T, T, F, F, E, T, T, E, F, F,
  T, F, F, T, E, F, F, E, T, T,
  F, T, T, F, E, T, T, E, F, F,
  F, F, T, T, E, T, T, E, F, F,
)

- $p ==> (q or r) <==> (p and not q)==>r$
- $p ==> (q or r) <==> (p and not r)==>q$
#table(
  align: center,
  columns: 12,
  $p$,
  $q$,
  $r$,
  E,
  $q or r$,
  $p==>(q or r)$,
  E,
  $p and not q$,
  $(p and not q)==>r$,
  E,
  $p and not r$,
  $(p and not r)==>q$,

  T, T, T, E, T, T, E, F, T, E, F, T,
  T, T, F, E, T, T, E, F, T, E, T, T,
  T, F, T, E, T, T, E, T, T, E, F, T,
  T, F, F, E, F, F, E, T, F, E, T, F,
  F, T, T, E, T, T, E, F, T, E, F, T,
  F, T, F, E, T, T, E, F, T, E, F, T,
  F, F, T, E, T, T, E, F, T, E, F, T,
  F, F, F, E, F, T, E, F, T, E, F, T,
)

- $p ==> (q and r) <==> (p==>q) and (p==>r)$
#table(
  align: center,
  columns: 10,
  $p$,
  $q$,
  $r$,
  E,
  $q and r$,
  $p==>(q and r)$,
  E,
  $p==>q$,
  $p==>r$,
  $(p==>q)and(p==>r)$,

  T, T, T, E, T, T, E, T, T, T,
  T, T, F, E, F, F, E, T, F, F,
  T, F, T, E, F, F, E, F, T, F,
  T, F, F, E, F, F, E, F, F, F,
  F, T, T, E, T, T, E, T, T, T,
  F, T, F, E, F, T, E, T, T, T,
  F, F, T, E, F, T, E, T, T, T,
  F, F, F, E, F, T, E, T, T, T,
)
