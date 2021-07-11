# Remueve todos los objetos creados con anterioridad (solo por seguridad)
rm(list=ls())

# operaciones suma +, resta -, multiplicación *, división /, potenciación ^
# math operations: e^x exp(x), Ln(x) log(x), sen(x) sin(x), cos(x), |x| abs(x)

# Función y su derivada 
f <- function(x) 1000000 * exp(x) + 435000 * (exp(x) - 1) / x - 1564000
df <- function(x) 1000000 * exp(x) + (435000 * exp(x) * x - 435000 * (exp(x) - 1)) / x ^ 2

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

x0 <- 1
Tol <- 10 ^ -4
newton(x0, Tol)
