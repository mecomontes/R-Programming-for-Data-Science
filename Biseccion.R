# Remueve todos los objetos creados con anterioridad (solo por seguridad)
rm(list=ls())

# Función a solucionar
f <- function(x) 2 + sin(x) - x

# Función para el Método de la Bisección 
biseccion <- function(a, b, Tol) {
  Ea <- Tol + 1
  i <- 0
  while (Ea > Tol) {
    x <- (a + b) / 2
    Ea <- abs(b - a) / 2
    cat('i =', i, '\tx =', x, '\tf(x) =', f(x),'\tEa =', Ea, '\n')
    if (f(x) == 0) break
    if (f(x) * f(a) < 0) {
      b <- x
    } else {
      a <- x
    }
    i <- i + 1
  }
}

a <- 2
b <- 3
Tol <- 10 ^ -5
biseccion(a, b, Tol)
