#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *

// Defaults
#set text(lang: "es")
#set page(width: 15cm, height: auto)
#set heading(numbering: "1.1.")
// #set math.equation(numbering: "(1.1)")

// Custom commands
#let Box(content) = box(baseline: 1.5pt, rect(
  inset: 1.5pt,
  stroke: 0.5pt,
  content,
))
#let mcd = math.op("mcd", limits: true)
#let mcm = math.op("mcm", limits: true)

// Plugins
// great-theorems
#show: great-theorems-init
#let mathcounter = rich-counter(identifier: "mathblocks", inherited_levels: 1)

#let Definicion = mathblock(blocktitle: "Definicion", counter: mathcounter)
#let Teorema = mathblock(blocktitle: "Teorema", counter: mathcounter)
#let Lema = mathblock(blocktitle: "Lema", counter: mathcounter)
#let Prueba = mathblock(
  blocktitle: "Prueba",
  prefix: [_Prueba:_],
  suffix: [#h(1fr)$square$],
  inset: 5pt,
)
#let Pregunta = mathblock(blocktitle: "Pregunta", prefix: [_*Pregunta:*_])
#let Respuesta = mathblock(
  blocktitle: "Respuesta",
  prefix: [_Respuesta:_],
  inset: 5pt,
)
#let Ejemplo = mathblock(
  blocktitle: "Ejemplo",
  prefix: [_*Ejemplo*:_],
  inset: 5pt,
)

= Aritmética Modular

#Definicion[
  Sean $a$ y $b$ enteros y $m$ un entero positivo. Decimos que $a$ es congruente con $b$ modulo $m$ y se representa por $a equiv b (mod m)$. Si $m$ divide a $a-b$, es decir $m|(a-b)$. Si $a$ no es congruente con $b$ modulo $m$ es decir $a equiv.not b (mod m)$
]

#Ejemplo[
  $8 equiv 2(mod 3)$?

  Veamos si $3|(8-2)$ es decir $3|6$ \
  Es cierto que $3|6$ porque $6=3 dot 2$ \
  $therefore 8 equiv 2(mod 3)$
]

#Ejemplo[
  $10 equiv 4(mod 8)$?
  $
    10 equiv.not 4(mod 8) & <==> 8|(10-4)   \
                          & <==> 8|6        \
                          & <==> 6=8 dot c  \
                          & ==> c in.not ZZ \
  $
  $therefore 10 equiv.not 4(mod 8)$
]

#Teorema[
  $a,b in ZZ and m in ZZ^+ and a equiv b(mod m) <==> a mod m = b mod m$

  #Prueba[
    #enum[
      $a equiv b(mod m) ==> a mod m = b mod m$

      Supongamos que $a equiv b(mod m)$, es decir $m|(a-b)$, es decir
      $ a-b =m k; quad k in ZZ $

      Ahora expresamos $a$ y $b$ en términos de division en $m$

      $a = m q + r; quad q in ZZ; quad 0<=r<m$ \
      $b = m p + s; quad p in ZZ; quad 0<=s<m$

      Restamos $a$ y $b$
      $
        a-b & = (m q + r) - (m p + s) \
            & = m q + r - m p - s     \
            & = m q - m p + r - s     \
            & = m(q - p) + (r - s)    \
      $

      Por hipótesis $a-b=m k$, entonces
      $
        m(q-p) + (r-s) & = m k          \
                   r-s & = m k - m(q-p) \
                   r-s & = m(k - q + p) \
      $

      Como $0<=r<m and 0<=s<m$, entonces $-m<r-s<m$

      Como $r-s$ debe ser múltiplo de $m$ entonces $r-s=0$. Ya que $0$ es el único múltiplo de $m$ ente $-m$ y $m$

      Ahora $r-s=0 ==> r=s$

      $therefore a mod m = r = s = b mod m$
    ][
      $a mod m = b mod m ==> a equiv b(mod m)$

      Si $a mod m = b mod m$ entonces $a$ y $b$ darán el mismo resto al dividirlos por $m$. Por lo tanto
      $a=q_1 m + r and b=q_2 m + r$

      Restamos $a$ y $b$
      $
        a-b & = (q_1m + r) - (q_2m + r) \
            & = q_1m + r - q_2m - r     \
            & = q_1m - q_2m             \
            & = (q_1 - q_2)m            \
      $
      Por lo tanto $m|(a-b)$ \
      $therefore a equiv b (mod m)$
    ]
  ]

  #Ejemplo[
    $8 equiv 2(mod 3)$

    $8 mod 3 = #Box[2]$ porque $8=3 dot 2 + #Box[2]$ \
    $2 mod 3 = #Box[2]$ porque $2=3 dot 0 + #Box[2]$

    En efecto $8 mod 3 = 2 mod 3$
  ]
]

#Teorema[
  $a,b,c,d in ZZ and m in ZZ^+ and a equiv b(mod m) and c equiv d(mod m) ==> a+c equiv (b+d)(mod m) and a c equiv (b d)(mod m)$

  #Prueba[
    Supongamos que $a equiv b(mod m) and c equiv d(mod m)$ entonces $m|(a-b) and m|c-d$ es decir:

    $a-b=m k; quad k in ZZ$\
    $c-d=m p; quad p in ZZ$

    Luego $a=m k+b and c=m p+d$

    #enum[
      Sumando las igualdades
      $
        a+c & = m k + b + m p + d   \
            & = (b + d) + m k + m p \
            & = (b + d) + m(k+p)    \
      $
      Como $k,p in ZZ$ entonces $k+p in ZZ$ llamemos $n=k+p$

      Por lo tanto
      $
                  a+c & = (b+d) + m n \
        (a+c) - (b+d) & = m n         \
      $
      Osea $m|(a+c)-(b+d)$

      $therefore (a+c) equiv (b+d)(mod m)$
    ][
      Multiplicando las igualdades
      $
        a c & = (m k + b)(m p + d)            \
            & = m^2 k p + m k d + m p b + b d \
            & = m(m k p + k d + p b) + b d    \
      $

      Como $m,k,p,d,b in ZZ$ entonces $m k p + k d + p b in ZZ$ llamemos $n=m k p + k d + p b$

      Por lo tanto
      $
              a c & = m n + b d \
        a c - b d & = m n       \
      $
      Osea $m|a c - b d$

      $therefore a c equiv b d(mod m)$
    ]
  ]
]

== Aplicaciones de las convergencias

=== Funciones de dispersion

Memoria de un computador $<-$ Información

Por ejemplo la universidad debe guardar la información de todos los estudiantes, guarda sus datos personales y academes. Como hacer para poder acceder a la información de cada estudiantes de forma efectiva?

Para esto se usan las funciones de dispersion:

La información se almacena en ficheros cada uno de ellos se localiza usando una clave, que identifica de forma única el fichero de cada estudiante. En particular la identificación puede ser el código estudiantil. En particular la identificación puede ser el código estudiantil. Una función de dispersion $h$ asigna una posición de memoria $h(k)$ al fichero que tiene a $k$ como clave. Existen muchas funciones de dispersion, una de ellas es $h(k)=k mod m$ donde $m$ es el numero de posiciones de memoria existentes.

$h(k)=k mod m$. Residuo de dividir $k$ por $m$

#Ejemplo[
  $m=100$ (cantidad maxima de posiciones de memoria)

  #list[
    $k_1=20251167000$ Código estudiantil \
    $h(k_1)=20251167000 mod 100 = #Box[0]$ \
    $therefore$ al estudiante de código $k_1$ se le asigna la posición de memoria $0$
  ][
    $k_2=20251167026$ Código estudiantil \
    $h(k_2)=20251167026 mod 100 = #Box[26]$ \
    $therefore$ al estudiante de código $k_2$ se le asigna la posición de memoria $26$
  ][
    $k_3=20251167100$ Código estudiantil \
    $h(k_3)=20251167100 mod 100 = #Box[0]$ \
    Como la posición de memoria $0$ se encuentra ocupada por $k_1$ se le asigna la siguiente, osea $1$ \
    $therefore$ al estudiante de código $k_3$ se le asigna la posición de memoria $1$
  ]
  #quote[Nota: Puede ocurrir que dos códigos estudiantiles dejen el mismo residuo al dividirse por m. En este caso se dice que ha ocurrido una colisión. Una forma de solucionar esta situación es asignar al código que genera repetición del residuo, la siguiente posición de memoria que esté libre en ese momento.]
]

=== Números pseudoaleatorios (Método de congruencia lineal)

Para generar números pseudoaleatorios usaremos el método de congruencia lineal. Elegimos cuatro números enteros:

- El modulo $m$
- El multiplicador $a$
- El incremento $c$
- La semilla $x_0$

Que satisfaga $2<=1<m$, $0<=c<m$, $0<=x_0<m$

Generamos una sucesión de números pseudoaleatorios $x_n$, $0<=n<m$ así: aplicando reiteradamente la congruencia:

$ x_(n+1) = (a x_n + c) mod m $

#Ejemplo[
  $m=8; quad a=5; quad c=3; quad x_0=2$

  - $x_1=(5x_0+3)mod 8 = (5 dot 2 + 3)mod 8 = 13 mod 8 = #Box[5]$
  - $x_2=(5x_1+3)mod 8 = (5 dot 5+3)mod 8 = 28 mod 8 = #Box[4]$
  - $x_3=(5x_2+3)mod 8 = (5 dot 4+3)mod 8 = 23 mod 8 = #Box[7]$
  - $x_4=(5x_3+3)mod 8 = (5 dot 7+3)mod 8 = 38 mod 8 = #Box[6]$
  - $x_5=(5x_4+3)mod 8 = (5 dot 6+3)mod 8 = 33 mod 8 = #Box[1]$
  - $x_6=(5x_5+3)mod 8 = (5 dot 1+3)mod 8 = 2 mod 8 = #Box[2]$

  Aquí como volvimos a llegar a la semilla $x_0 = x_6$ se repetiría, por lo tanto nuestra sucesión de números aleatorios es: ${5,4,7,6,1,2}$
]

=== Cristología

Las congruencias tienen muchas aplicaciones, en particular en las ciencias de la computación. Una de ellas es la cristología o criptografía, que es el estudio de los mensajes secretos

#Ejemplo[
  #table(align: center, columns: 14)[A \ 0][B \ 1][C \ 2][D \ 3][E \ 4][F \ 5][G \ 6][H \ 7][I \ 8][J \ 9][K \ 10][L \ 11][M \ 12][N \ 13][Ñ \ 14][O \ 15][P \ 16][Q \ 17][R \ 18][S \ 19][T \ 20][U \ 21][V \ 22][W \ 23][X \ 24][Y \ 25][Z \ 26]

  Encriptar el mensaje "La próxima semana tendremos vacaciones" \
  Usando la numeración dada el mensaje es:
  "11 0 16 18 15 24 8 12 0 19 4 12 0 13 0 20 4 13 3 18 4 12 15 19 22 0 2 0 2 8 15 13 4 19"

  Este método de encriptación se basa en reemplazar cada uno de los números del mensaje por:
  $f(p)=(p+3) mod 27$

  Así, el mensaje encriptado es: "14 3 19 21 18 0 11 15 3 22 7 15 3 16 3 23 7 16 6 21 7 15 18 22 25 3 5 3 5 11 18 16 7 22"

  Para recuperar el mensaje original del mensaje encriptado debemos usar la función inversa de $f$

  $f^(-1)(p)=(p-3) mod 27$ donde $0<=p<27$
]

Se puede generalizar este método, se puede desplazar $k$ lugares en lugar de $3$ letras en el alfabeto; es decir $f(p)=(p+k) mod 27$. A este método se le llama cifrado por translación. \
Y se descifra con la función inversa $f^(-1)(p)=(p-k)mod 27$. A este proceso se llama descifrado o decodificación.
