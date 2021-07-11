

#https://bookdown.org/matiasandina/R-intro/exploracion-de-datos.html#caso-de-estudio


# Crear un vector que contiene 10 datos con distriucuion normal
xn <- rnorm(10)
#Crear un vector que contiene 10 datos con distribucion binomial negativa 
xnb <- rnbinom(10,5,0.49)
#Crear un vector que contiene 10 datos con distribucion binomial negativa
xb <- rbinom(10,5,0.9)
#crear vector que contiene 500 datos con distribucion exponencial
xe <- rexp(500)

#Crear un vector con el comando c
timeLine <- c(1.3,1.5,4.6,2.5)
#GRaficar el vector anterior 
plot(timeLine)
# Lafuncion help permite acceder a la documentacion de un ejemplo
help(plot)
#Demostracion de los tipos de graficos en R
demo(graphics)

#Obtener un lista de los objetos en el espacio de trabajo
ls()
#Eliminar objetos del espacio de trabajo
rm(xnb)#elimina xn
#Conocer el directorio de trabajo, la ruta
getwd()
#Modificar la direccion de ttrabajo
setwd('Ruta')

#CRear un data frame
num_per <-  c(1,1,2,4)
horario <- c('std', 'nuevo', 'std', 'nuevo')
tiempo <- c(1.3, 1.2, 2.1, 3)
df <- data.frame(num_per, horario, tiempo)
df

############ CARGAR DATOS ########################

#cargar un data frame
#Tammbien se puede abrir una ventana ara buscar la ruta con file.choose()
#Con read.table('clipboard') se carga una seccion cipiada de una tabla de excel
df1 <- read.table(file = 'Nombre.txt', header = TRUE)#agregar parámetro sep = ',' o '\t' en archivos csv
df[2,3] #valor en la fila 2 columna 3
df[1,] #todos los valores de la fila 1
df[,2] #todos los valores de la columna 2
df$horario #todos los valores de la columna 2

#cargar un archivo csv
read.csv(file = 'Nombre.csv')

#longitud del objeto xn
length(xn)
#Generar una secuencia desde 1, hasta 12, con paso 2
x1 <- seq(1,12,2)
#Repetir la secuencia x1 3 veces 
x2 <- rep(x1,3)
#Dividexen aproximadamentenintervalos iguales,de modo 
#que los puntos de divisi ́on tengan valoresredondeados.
#Devuelve los puntos de divisi ́on.
x3 <- pretty(x2,4)


#################### GUARADAR #######################

#Guardar alguna variable o dato en un archivo
save(variable, file = 'RUTA')
#Cargar el archivo guardado
load(variable, file = 'RUTA')


#####################   GRAFICOS  #######################

x <- c(1.2, 2.3, 1.4, 3.7, 1.2, 0.6)#crea vector con valores para x
y <- c(2.4, 6.4, 2.8, 10.1, 2.0, 1.0)#Crea vector con valores para y
datos <- data.frame(x,y)#Crear e l data frame
datos$media <- (datos$x + datos$y)/2#Agrega la colmna media usando las columnas anteriores 
datos$criterio10 [datos$media < 10] <- 'Menor'
datos$criterio10 [datos$media == 10] <- 'Igual'
datos$criterio10 [datos$media > 10] <- 'Mayor'
datos[order(x),]#Ordena el data frame respoeccto a los valores de x


plot(datos$x, datos$y, xlab = 'valores de x', ylab = 'valores de y', xlim = c(0, 4), ylim = c(0,12))
abline(lm(data = datos))#linea de tendencia 
title('Grafica Y vs X')

#crear vector que contiene 500 datos con distribucion exponencial
xe <- rexp(500)
par(mfrow = c(2,3))#subplot
plot(xe)
hist(xe)
boxplot(xe)

#############3 CONVERSION DATOS ######################

#Comporbacion 
is.numeric(x)
is.character(x)
is.vector(x)
is.matrix(x)
is.data.frame(x)
is.factor(x)
is.logical(x)

#cenversion
as.numeric(x)
as.character(x)
as.vector(x)
as.matrix(x)
as.data.frame(x)
as.factor(x)
as.logical(x)
#observar cambio sen un vector factor antes y despues de creado
summary()

####################   FOR   ###########################

xi <- c(1, 2, 3, 5, 7, 11)
y <-  numeric(0)
k <-  numeric(0)
for (i in 1:length(x)) {
  y[i] <- i*xi[i]
  k[i] <- y[i] / 2
}

################ MATEMATICAS ############################

abs(-4)
sqrt(9)
ceiling(7)#entero mas pequeño no menor que 7
floor(7)#entero mas grande no mayor que 7
trunc(5)#entero formado truncando a 0 los decimiales
round(4.54234,3)#redondear
signif(5.234, digits = 2)#redondea a las cifras significativas
sin(4)#asin() sinh() asinh()
cos(4)#acos() cosh() acosh()
tan(4)#atan() tanh() atanh()
log(4)#log10() log(x, base = n)
exp(4)
pi #numero pi

#################### FUNCIONES #########################

Nombre <- function(arg1, arg2, arg3, .....){
  sentencia
  return(objeto)
}

#################### ESTADISTICA #####################

############### ANALISIS UNIVARIADO ##################

##########Distribucion de frecuencias

cuadro <- table(datos)#Crear una tabla de distribucion de freceuncias
cumsum(cuadro)# Frecujencia Absoluta cumulada
cuadro/margin.table(cuadro)#tabla de frecuencia relativa
round((cuadro/margin.table(cuadro))*100, 2)#tabla de frecuencia relativa porcentual
cumsum(round((cuadro/margin.table(cuadro))*100, 2))#tabla de frecuencia relativa porcentual acumulada

########Medidas de tendencia central
xe <- rexp(500)
mean(xe) #Media
median(xe) #Mediana
quantile(xe, probs = c(0.25, 0.5, 0.75)) #Cuantiles

######Medidias de dsipersion
range(xe)#rango
sd(xe) #Desviacion estandar
var(xe) #Varianza
min(xe) #Minimo
max(xe) #Maximo

###Medidias de posicion
install.packages('e1071')
skewness(xe)#sesgo
kurtosis(xe)#Curtosis
summary(xe) #Resumir medidas esetadisticas de una variable


################# ANALISIS BIVARIADO ##################

#######Tablas cruzadas
totPercents()
colPercents()
rowPercents()

####### Test Chi_Cuadrado
chisq.test(xx, yy)

###### Prueba t para muestras independeintes
#http://epp.eurostat.ec.europa.eu/portal/page/portal/eurostat/home/

euro1 <- read.table(file = 'EUROC.csv', header = TRUE, sep =',')

#Evaluacion de la distribucion normal
#Evaluar si se acerca auna distribucion normal:
#######Grafico comparacion de cuartiles


#######PRueba de Shapiro - Wilk
shapiro.test(euro1$V4)

#Evaluaciond e la igualdad de varianzas
#######Test  de Levene
euro1 <- transform(euro1, enterUE = factor(V11_record, labels = c('Siglo XX', 'Siglo XXI')))
table(euro1$enterEU)
leveneTest(euro1$V4, euro1$enterEU, center = mean)

##########Preuba t
t.test(V4~enterEU, alternative = 'two.sided', conf.level = 0.95,
        var.equal = FALSE, data = euro1) #var.equal = FALSE porque se rechazo la prueba de levene

#Prueba t para muestras relacionadas
#mide si la diferencia de las medias de dos variables es 0

shapiro.test(euro1$V5)
t.test(euro1$V4, euro1$V5, alternative = 'tow.sided', 
       conf.level = 0.95, paired = TRUE)

###prueba t para una variable
t.test(euro1$V5, alternative = 'two.sided', 
       conf.level = 0.95, mu = 76.16)

#Correlacion bivariada
cor(euro1$V6, euro1$V2)
cor.test(euro1$V6, euro1$V2, alternative = 'two sided', method = 'pearson')

# d: Densidad
# p: Funcion de Dsitribucion
# q: Funcion cuantil
# d: Generacion aleatoria de observaciones

# El nombre de la funcion de probabilidad debe 
# comenzar con una de las letras anteriores

beta(a,b) #Beta
binom() #Binomial
nbinom() #Binomial negativa
cauchy() #Cauchy
chisq() #Chi-Cuadrada
exp() #Exponencial
gamma() #Gamma
geom() #Geometrica
lnorm() #Lognormal
norm() #Normal
pois() #Poisson
t() #T
unif() #Uniforme
weibull() #Weibull


# Densidad de Probabilidad de Distribucion Normal

x <- pretty(c(-3,3),60)
y <- dnorm(x)
plot(x, y, type = "l", xlab = "x", ylab = "f(x)", 
     yaxs = "i", main = "Densidad de probabilidad N(0,1)")

pnorm(2)#Are ala izquierda de z = 2

qnorm(0.9, mean = 50, sd = 20) #valor del percentil 90 de la distribuci ́on N(50,10)
set.seed(1234)# en caso de desear especificar la semilla
rnorm(6, mean=50, sd=20) #Generar 6 observaciones independientes de ladistribuci ́on

######################################################
################# GRAFICOS ###########################
######################################################

euro1 <- transform(euro1, enterUE = factor(V11_record, 
              labels = c('Siglo XX', 'Siglo XXI')))
table(euro1$enterEU)

################ Grafico de barras ##################
barplot(table(euro1$enterEU),
        main = 'Zona Euro2013: Paises Integrantes',
        sub = 'Fuente: EUROSTAT-2013',
        xlab = 'Siglo de integracion a la zona euro',
        ylab = 'Numero de paises',
        ylim = c(0,16),
        col = 'aquamarine')
box()

############ Grafico de torta #######################

cuadro3 <- table(euro1$enterUE)
C3porc <- round((cuadro3/margin.table(cuadro3))*100,1)
etiquetas <- c('Siglo XX', 'Siglo XXI')
etiquetas <- c(etiquetaas, C3porc)
etiquetas <- paste(etiquetas, '%', sep = '')
pie(C3porc, labels = etiquetas, clockwise = TRUE,
    main = 'Zona euro 2013: Paises integrantes', 
    sub = 'Fuente: EUROSTAT-2013')


################### HISTOGRAMA ######################

#Histograma de la tasa de ocupacion femenina en 2006
#permite observar la dispersion de los valores
hist(euro1$V6, main = 'Zona euro-2006: Tasa de ocupacion femenina',
     sub = 'Fuente: EUROSTAT-2013', 
     xlab = 'Tasa de ocupacion femenina',
     ylab = 'Frecuencia', col = 'pink2')


#100 observaciones con distribucion normal, media 10, y desviacion estandar 2
x <- rnorm(100, mean=10, sd=2)
#Con freq = FALSE crea el histograma basandose en la Densidad de Probabilidad
#break = 10 Indica el numero de clases que en este caso es 10
hist(x, freq = FALSE, breaks = 10,
     xlab = "x distribuido N(10,2)", 
     main = "Histograma de 100 observaciones N(10,2)")
#Añade pequeñas lineas bajo el histograma señalando los datos
rug(jitter(x))
#dibja una linea de estimacion de la densidad de probabilidad 
lines(density(x), col="blue", lwd=2)#se emplea line para diujar encima del grafico
box()#Encierra el grafico en un recuadro (Marco del grafico)

################ DIAGRAMA DE CAJA ##################

boxplot(euro1$V6, 
     main = 'Zona euro-2006: Tasa de ocupacion femenina',
     sub = 'Fuente: EUROSTAT-2013', 
     xlab = 'Tasa de ocupacion femenina',
     ylab = 'Frecuencia', col = 'pink2')

#Diagrama de caja de una variable cuantitativa,
#en funcion de una cualitativa

with(euro1, boxplot(V6, enterUE, labels = c('Belgium', 
    'Bulgaria', 'Czech Republic', 'Denmark', 'Germany', 
    'Estonia', 'Ireland', 'Greece', 'Spain', 'France',
    'Croatia', 'Italy', 'Cyprus', 'Latvia', 'Luthuania', 
    'Luxenburg', 'Hungary', 'Malta', 'Netherlands',
    'Austria', 'Poland', 'Portugal', 'Romania', 'Slovenia',
    'Slovakia', 'Finland', 'Sweden', 'United Kingdom'),
    main = 'Zona euro-2006: Tasa de ocupacion femenina',
    sub = 'Fuente: EUROSTAT-2013', 
    xlab = 'Siglo de incorporacion a la Union Europea',
    ylab = 'Tasa de ocupacion femenina', 
    ylim = c(30, 80), col = c('royalblue2', 'aquamarne')))

boxplot(euro1$V6, euro1$enterUE, labels = c('Belgium', 
    'Bulgaria', 'Czech Republic', 'Denmark', 'Germany', 
    'Estonia', 'Ireland', 'Greece', 'Spain', 'France',
    'Croatia', 'Italy', 'Cyprus', 'Latvia', 'Luthuania', 
    'Luxenburg', 'Hungary', 'Malta', 'Netherlands',
    'Austria', 'Poland', 'Portugal', 'Romania', 'Slovenia',
    'Slovakia', 'Finland', 'Sweden', 'United Kingdom'),
    main = 'Zona euro-2006: Tasa de ocupacion femenina',
    sub = 'Fuente: EUROSTAT-2013', 
    xlab = 'Siglo de incorporacion a la Union Europea',
    ylab = 'Tasa de ocupacion femenina', 
    ylim = c(30, 80), col = c('royalblue2', 'aquamarne'))

attach(euro1)
boxplot(V6, enterUE, labels = c('Belgium', 
    'Bulgaria', 'Czech Republic', 'Denmark', 'Germany', 
    'Estonia', 'Ireland', 'Greece', 'Spain', 'France',
    'Croatia', 'Italy', 'Cyprus', 'Latvia', 'Luthuania', 
    'Luxenburg', 'Hungary', 'Malta', 'Netherlands',
    'Austria', 'Poland', 'Portugal', 'Romania', 'Slovenia',
    'Slovakia', 'Finland', 'Sweden', 'United Kingdom'),
    main = 'Zona euro-2006: Tasa de ocupacion femenina',
    sub = 'Fuente: EUROSTAT-2013', 
    xlab = 'Siglo de incorporacion a la Union Europea',
    ylab = 'Tasa de ocupacion femenina', 
    ylim = c(30, 80), col = c('royalblue2', 'aquamarne'))

################ DIAGRAMA DE DISPERSION ##############
#Se usa para relacionar variables e identificar valores extremos

plot(euro1$V6, euro1$V2,
     main = 'Zona euro 28-2006',
     sub = 'Fuente: EUROSTAT-2013', 
     ylab = '% Nacimientos fuera de matrimonio',
     xlab = 'Tasa de ocupacion femenina')

#Diagrama de dispersion con linea de tendencia, elipse

scatterplot(euro1$V6, euro1$V2, ellipse = TRUE, labels,
      id.n = 2, labels = c('Belgium', 
     'Bulgaria', 'Czech Republic', 'Denmark', 'Germany', 
     'Estonia', 'Ireland', 'Greece', 'Spain', 'France',
     'Croatia', 'Italy', 'Cyprus', 'Latvia', 'Luthuania', 
     'Luxenburg', 'Hungary', 'Malta', 'Netherlands',
     'Austria', 'Poland', 'Portugal', 'Romania', 'Slovenia',
     'Slovakia', 'Finland', 'Sweden', 'United Kingdom'),
     lwd = 1.5, col = 'red',
     main = 'Zona euro 28-2006',
     sub = 'Fuente: EUROSTAT-2013', 
     ylab = '% Nacimientos fuera de matrimonio',
     xlab = 'Tasa de ocupacion femenina')

############### GRAFICA Q-Q ##################
#Esta funcíon dibuja los cuantiles ıricos en el
#eje Y y el eje X contiene losvalores del modelo
#téorico. Se dibuja tambi ́en una l ́ınea recta con u
#una inclinacíonde 45 grados. Si los datos provienen
#de la distribuci ́on te ́orica, lospuntos caeran
#aproximadamente sobre esta l ́ınea. Cuanto mayor sea
#la distanciaentre los datos yla l ́ınea, mayor sera ́
# la evidencia de que los datos no provienen de la 
#distribuci ́onte ́orica en cuesti ́on

qqPlot(euro1$V6, dist = 'norm', id.method = 'y', 
       id.n = 2, labels = rownames(euro1))

qqPlot(euro1$V6, dist = 'norm', id.method = 'y', 
       id.n = 2, labels = c('Belgium', 'Bulgaria', 
           'Czech Republic', 'Denmark', 'Germany', 
           'Estonia', 'Ireland', 'Greece', 'Spain', 'France',
           'Croatia', 'Italy', 'Cyprus', 'Latvia', 'Luthuania', 
           'Luxenburg', 'Hungary', 'Malta', 'Netherlands',
           'Austria', 'Poland', 'Portugal', 'Romania', 'Slovenia',
           'Slovakia', 'Finland', 'Sweden', 'United Kingdom'))

par(mfrow=c(1,3))#Subplot
x <- rnorm(100,20,2)#CRea la distribucion con 100 datos, meadia 20 y sd 2

install.packages('PerformanceAnalytics')
chart.QQPlot(x, envelope = 0.95, main = "NORMAL", 
             distribution = 'norm')#distribucion normal
chart.QQPlot(x, envelope = 0.95, main = "EXPONENCIAL",
             distribution = 'exp')#distribucion exponencial
chart.QQPlot(x, envelope = 0.95, main = "UNIFORME",
             distribution = 'unif')#distribucion uniforme

install.packages('MASS')
# Posibles nombres de la disribucioin a ajustar son:
#"beta","cauchy","chi-squared","exponential","f",
#"gamma","geometric","lognormal","logistic",
#"negative binomial","normal","Poisson","t"y"weibull"

x <- rnorm(500,20,3)
fitdistr(x, "normal")
fitdistr(x, "exponential")

boxplot(x ~ cat, data = datos, varwidth = TRUE,
        main = "Ejemplo boxplots en paralelo",
        xlab = "grupos", ylab = "valor a comparar")

kruskal.test(x ~ cat, data=datos)#Test de Kruskal-Wallis

################# PIRAMIDE DE EDADES #################

install.packages('pyramid')
library('pyramid')
