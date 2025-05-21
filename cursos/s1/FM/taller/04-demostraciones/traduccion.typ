#set enum(numbering: "A.1.")

#align(center, [
  == Demostración Directa
  #box(
    $
      & bold("Proposicion:") && P ==> Q     \
      & bold("Prueba:")      && "Suponga" P \
      &                      && dots.v      \
      &                      && therefore Q \
    $,
    stroke: gray,
    inset: 5pt,
  )
])

+ Usar el método de demostración directa para demostrar los siguientes enunciados

  + Si $x$ es un entero par, entonces $x^2$ es par.
  + Si $x$ es un entero impar, entonces $x^3$ es impar.
  + Si $a$ es un entero impar, entonces $a^2 + 3a + 5$ es impar.
  + Suponga $x,y in ZZ$. Si $x$ y $y$ son impares, entonces $x y$ es impar.
  16. Si dos enteros tienen la misma paridad, entonces su suma es par. (Intente casos)
  + Si dos enteros tienen paridad opuesta, entonces su producto es par.
  + Suponga $x,y in RR^+$. Si $x<y$, entonces $x^2<y^2$

#align(center, [
  == Demostración Contra-reciproca
  #box(
    $
      & bold("Proposicion:") && P ==> Q         \
      & bold("Prueba:")      && "Suponga" not Q \
      &                      && dots.v          \
      &                      && therefore not P \
    $,
    stroke: gray,
    inset: 5pt,
  )
])

+ Usar método de demostración contra-reciproca para demostrar los siguientes enunciados. (En cada caso debe también pensar como demostraría por directa. Se encontrara que en la mayoría de casos la contra-reciproca es mas fácil).

  + Suponga $n in ZZ$. Si $n^2$ es par, entonces $n$ es par.
  + Suponga $n in ZZ$. Si $n^2$ es impar, entonces $n$ es impar.
  + Suponga $a,b in ZZ$. Si $a^2(b^2-2b)$ es impar, entonces $a$ y $b$ son impares.
  + Suponga $a,b,c in ZZ$. Si $a$ no divide a $b c$, entonces $a$ no divide a $b$.
  + Suponga $x in RR$. Si $x^2+5x<0$ entonces $x<0$
  + Suponga $x in RR$. Si $x^3-x>0$ entonces $x>-1$

+ Demuestre los siguientes enunciados usando método directo o contra-reciproca. A veces un método es mucho mas fácil que el otro.

  + Si $a,b in ZZ$ y $a$ y $b$ tienen la misma paridad, entonces $3a + 7$ y $7b-4$ no.
  + Suponga $x in ZZ$. Si $x^3-1$ es par, entonces $x$ es par.
  + Suponga $x in ZZ$. Si $x+y$ es par, entonces $x$ y $y$ tienen la misma paridad.
  + Si $n$ es par, entonces $8|(n^2-1)$

#align(center, [
  = Prueba por Contradicción
  #box(
    $
      & bold("Proposicion:") && P                     \
      & bold("Prueba:")      && "Suponga" not P       \
      &                      && dots.v                \
      &                      && therefore C and not C \
    $,
    stroke: gray,
    inset: 5pt,
  )
])

#align(center, [
  = Prueba de condicional por Contradicción
  #box(
    $
      & bold("Proposicion:") && P ==> Q               \
      & bold("Prueba:")      && "Suponga" P and not Q \
      &                      && dots.v                \
      &                      && therefore C and not C \
    $,
    stroke: gray,
    inset: 5pt,
  )
])

+ Use el método de prueba por contradicción para probar los siguientes enunciados. (En cada caso, debe pensar como funcionaria una demostración directa y contra-reciproca. Encontrara que en la mayoría de casos la demostración por contradicción es mas fácil)

  + Suponga $n in ZZ$, Si $n$ es impar, entonces $n^2$ es impar.
  + Suponga $n in ZZ$, Si $n^2$ es impar, entonces $n$ es impar.
  + Pruebe que $root(3, 2)$ es irracional.
  + Pruebe que $sqrt(6)$ es irracional.
  + Pruebe que $sqrt(3)$ es irracional.
  + Si $a,b in ZZ$, entonces $a^2-4b-2 != 0$
  + Si $a,b in ZZ$, entonces $a^2-4b-3 != 0$
  + Suponga $a,b,c in ZZ$. Si $a^2+b^2=c^2$, entonces $a$ o $b$ son pares.
