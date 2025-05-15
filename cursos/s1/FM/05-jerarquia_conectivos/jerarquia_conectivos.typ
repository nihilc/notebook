= Jerarquía de conectivos

// TODO: Revisar esto e intentar explicarlo mas claro

#enum(
  enum.item[
    Implicación $==>$ es el conectivo mas fuerte
    - $p==>q and r$ Es una implicación, como sabemos que $==>$ tiene prioridad es lo mismo que decir $p ==> (q and r)$ \
    - $(p==>q) and r$ es una conjunción
    Doble implicación también se podría decir que esta al mismo nivel pero como se puede ver como $(p==>q) and (q==>p)$ no es necesario
  ],
  enum.item[
    Conjunción y Disyunción $and, or$ son igual de fuertes
    - $p and q or r$ No es una FBF.
    - $(p and q) or r$ Es una Disyunción.
    - $p and (q or r)$ Es una Conjunción.
  ],
  enum.item[
    La negación $not$ es el termino de enlace mas débil, actúa solamente sobra la mas cercana
    - $not (p and q)$ Es una negación
    - $not p and q$ Es una conjunción
  ],
)
