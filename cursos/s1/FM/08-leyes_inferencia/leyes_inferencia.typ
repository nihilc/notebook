#set page(columns: 2)
#let L = line()

= Leyes de Inferencia

#enum(spacing: 10pt)[
  MPP (Modus Ponendo Ponens)
  $
    & p==>q & quad & P_1 \
    & p     &      & P_2 \
    & #L                 \
    & q     &      & C   \
  $
  Implicación Tautológica:
  $ \(underbrace((p==>q), P_1) and underbrace(p, P_2) \) ==> underbrace(q, C) $
][
  MTT (Modus Tolendo Tolens)
  $
    & p==>q & quad & P_1 \
    & not q &      & P_2 \
    & #L                 \
    & not p &      & C   \
  $
  Implicación Tautológica:
  $
    \(underbrace((p=>q), P_1) and underbrace(not q, P_2)\) ==> underbrace(not p, C)
  $
][
  MTP (Modus Tolendo Ponens)
  $
    & p or q & quad & p or q & quad & P_1 \
    & not q  &      & not p  &      & P_2 \
    & #L     &      & #L                  \
    & p      &      & q      &      & C   \
  $
  Implicación Tautológica:
  $
    \( underbrace((p or q), P_1) and underbrace(cases(not q, not p), P_2) \) ==> underbrace(cases(p, q), C)
  $
][
  Simplificación
  $
    & p and q & quad & p and q & quad & P_1 \
    & #L      &      & #L                   \
    & p       &      & q       &      & C   \
  $
  Implicación Tautológica;
  $ \( underbrace((p and q), P_1) \) ==> underbrace(cases(p, q), C) $
][
  Doble Negación
  $
    & not (not p) & quad & p           & quad & P_1 \
    & #L          &      & #L                       \
    & p           &      & not (not p) &      & C   \
  $
  Tautología: $p <==> not (not p)$ \ \
][
  Silogismo Hipotético
  $
    & p ==> q & quad & P_1 \
    & q ==> r &      & P_2 \
    & #L                   \
    & p ==> r &      & C   \
  $
][
  Ley de la adición
  $
    & p      & quad & P_1 \
    & #L                  \
    & p or q &      & C   \
  $
  #quote([Si tengo un proposición $p$ le puedo adicionar cualquier cosa])
][
  Ley de la adjunción
  $
    & p       & quad & P_1 \
    & #L                   \
    & q       &      & P_2 \
    & #L                   \
    & p and q &      & C   \
  $
  #quote([Si de una proposición $p$ puedo concluir $q$ puedo adjuntarlas y concluir $p and q$])
][
  Ley Bi-condicional
  $
    & p<==>q & quad & p<==>q & quad & P_1 \
    & #L     &      & #L     &      &     \
    & p==>q  &      & q==>p  &      & C   \
  $
][
  Silogismo Disyuntivo
  $
    & p or q  & quad & P_1 \
    & p ==> r &      & P_2 \
    & q ==> s &      & P_3 \
    & #L                   \
    & r or s  &      & C   \
  $
]

\ \ \ \

#align(right, quote(
  block: true,
  [_"Toda implicación tautológica puede ser una inferencia"_],
))
#align(right, quote(
  block: true,
  [_"Cuando se usan las reglas de inferencia se vuelven implicaciones"_],
))
#align(right, quote(
  block: true,
  [_"Cuando se usan tautologías son doble implicaciones"_],
))

#pagebreak()
#set page(columns: 1)

== Ejemplos

#list[
  Ejemplo:

  Pruebe $underbrace(A subset.eq B, p) ==> underbrace(A inter M subset.eq B inter M, q)$ para cualquier $M$

  Por MPP asumimos que $A subset.eq B$ y probaremos que $A inter M subset.eq B inter M$

  $
    x in A inter M & <==> x in A and x in M && "Def. Intersección" \
                   & ==> x in B and x in M  && "Hipótesis"         \
                   & <==> x in B inter M    && "Def. Intersección" \
                                                                   \
  $
][
  Ejemplo:

  $& p ==> q and r       & quad & P_1 \
  & s ==> not r         &      & P_2 \
  & s or t              &      & P_3 \
  & p                   &      & P_4 \
  & #line(length: 50pt)              \
  & t                   &      & C   \ $

  Demostración: $t$

  $& 1. quad && p ==>q and r quad && P_1        \
  & 2.      && s ==> not r       && P_2        \
  & 3.      && s or t            && P_3        \
  & 4.      && p                 && P_4        \
  & 5.      && q and r           && "MPP(1,4)" \
  & 6.      && r                 && "S(5)"     \
  & 7.      && not s             && "MTT(2,6)" \
  & 8.      && t                 && "MTP(3,7)" \ $
]
