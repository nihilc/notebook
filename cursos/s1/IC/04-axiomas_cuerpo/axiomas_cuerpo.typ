= Axiomas de cuerpo/campo

Sea $RR$ un conjunto. Supongamos que en $RR$ definimos dos operaciones $plus$ y $dot$ que cumplen los siguientes axiomas:

$
  & A_0
  &quad& forall x,y in RR
  &quad& x+y in RR and x y in ZZ
  &quad& "P. Clausurativa" \
  & A_1
  && forall x,y in RR
  && x+y = y+x and x y = y x
  && "P. Conmutativa" \
  & A_2
  && forall x,y,z in RR
  && cases(x+(y+z) = (x+y)+z, and x(y z) = (x y)z, delim: #none)
  && "P. Asociativa" \
  & A_3
  && forall x,y,z in RR
  && x(y+z) = x y + x z
  && "P. Distributiva" \
  & A_4
  && exists 0 in RR and exists 1 in RR
  && x+0 = x and x dot 1 = x
  && "P. Modulativa" \
  & A_5
  && forall x in RR and exists y in RR
  && x+y = 0
  && "P. Inv. Aditivo" \
  & A_6
  && forall x in RR and x != 0 and exists z in RR
  && x z = 1
  && "P. Inv. Multiplicativo" \
$

Decimos que $(RR,+,dot)$ tiene estructura de cuerpo

== Teoremas

- $forall a,b,c in RR and a+b=a+c ==> b=c$
- $forall a,b in RR ==> exists!x in RR and a+x=b$

== Definición Inverso Aditivo

Al numero $x$ solución de la ecuación $a+x=b$ lo notaremos por $b-a$. En particular, si $b=0$ ($A_5$), entonces $a+x=0$ y así $x=0-a=-a$, al cual llamaremos el inverso aditivo de $a$ o el opuesto de $a$.

== Teoremas

- $forall a,b in RR ==> a-b=a+(-b)$
- $forall a in RR ==> -(-a)=a$
- $forall a in RR ==> a dot 0=0$
- $forall a,b in RR ==> -(a b)=(-a)dot b$
- $forall a,b,c in RR ==> (a+b)c=a c+b c$
- $forall a,b,c in RR ==> a(b-c)=a b-a c$
- $forall a,b,c in RR and a!=0 and a b=a c ==> b=c$
- $forall a,b in RR and a!=0 ==> exists!x in RR and a x=b$


== Definición Inverso Multiplicativo

Al numero $x$ solución de la ecuación $a x=b$, $a!=0$ lo notaremos por $b / a$. En particular, si $b=1$ ($A_6$), entonces $a x=1$ y así $x=1 / a$ que notaremos por $a^(-1)$ y lo llamaremos el inverso multiplicativo de $a$ o el reciproco de $a$.

== Teoremas

- $forall a,b in RR and a!=0 ==> b / a=b a^{-1}$
- $forall a in RR and a !=0 and a^(-1) "es inversible" ==> (a^(-1))^(-1)=a$
- $forall a,b in RR and a b=0 ==> a=0 or b=0$
- $forall a,b in RR ==> (-a)(-b)=a b$
- $forall a,b in RR and a b!=0 ==>(a b)^(-1) = a^(-1)b^(-1)$
- $forall a,b,c,d in RR and b!=0 and d!=0 ==> a / b+c / d = (a d + b c) / (b d)$
- $forall a,b,c,d in RR and b!=0 and d!=0 ==> a / b dot c / d = (a c) / (b d)$

// TODO: agregar demostraciones de teoremas

#pagebreak()
= Ejercicios

// TODO: agregar ejercicios
