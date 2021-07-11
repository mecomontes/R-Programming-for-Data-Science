# Remueve todos los objetos creados con anterioridad (solo por seguridad)
rm(list=ls())

# Función a solucionar y su derivada
f <- function(x) 2 + sin(x) - x
df <- function(x) cos(x) - 1

# Función para el Método de Newton 
newton <- function(x0, Tol) {
  Ea <- Tol + 1
  i <- 0
  while (Ea > Tol) {
    x <- x0 - f(x0) / df(x0)
    Ea <- abs(x - x0)
    cat('i =', i, '\tx =', x, '\tf(x) =', f(x),'\tEa =', Ea, '\n')
    if (f(x) == 0) break
    x0 <- x
    i <- i + 1
  }
}

x0 <- 2.5
Tol <- 10 ^ -5
newton(x0, Tol)
