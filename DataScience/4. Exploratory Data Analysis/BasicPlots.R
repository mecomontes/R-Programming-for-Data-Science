# Base plotting Demostration

x <- rnorm(100)
hist(x)

y <- rnorm(100)
hist(x, y)

z <- rnorm(100)
plot(x, z)

# Adding margin c(bottom, left, top, right)
par(mar = c(4, 4, 2, 2))
plot(x, z)

# Changing plotting symbol
plot(x, y, pch = 20)
plot(x, y, pch = 19)
plot(x, y, pch = 18)
plot(x, y, pch = 17)
example(points)

# Margin color for symbol
plot(x, y, pch = 16, col = 'blue', bg = 'white')

# Add title, text and legend, labels
title('hello')
text(-1, -1, 'bye')
legend('topleft', legend = 'data', pch = 15)
plot(y, z, xlab = 'This is the x', ylab = 'This is the y', main = 'New title')

# Add a linear regression with line width
fit <- lm(y ~ x)
abline(fit, lwd = 5, col = 'magenta')

# Subplots in rows or cols with mfrow or mfcol
z <- rpois(100, 2)
par(mfrow = c(2, 2))
plot(x, y, pch = 12)
plot(x, z, pch = 11)

par(mfcol = c(2, 2))
plot(x, y, pch = 12)
plot(x, z, pch = 11)

# Plotting points as a factor variable
par(mfrow = c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50) # generate factors levels
g <- gl(2, 50, labels = c('Male', 'Female'))
str(g)
plot(x, y, type = 'n')
points(x[g == 'Male'], y[g == 'Female'], col = 'green')
points(x[g == 'Female'], y[g == 'Male'], col = 'blue', pch = 5)

# Graphic Device in windows = windows(), mac = quartz(), linux = x11()
# pdf (Most portable format), svg ( XML based scalable), 
# win.metafile (only for windows OS), postscript
# png (bitmapped format), jpeg (good for photographs)
# tiff (support lossless compresion), bmp(native bitmapped windows format)
?Devices
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')

pdf(file = 'myplot.pdf') # Open PDF file in your wd
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')
dev.off() # Close the PDF file device

#shows the current opened device
dev.cur()
#set the device that you want to manipulat > 2
dev.set(4)
dev.copy(png, file = 'newgeyser.png')
dev.off()

# Using ggplot2 
library(ggplot2)
library(jpeg)
data(mpg)
str(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, color = drv, geom = c('point', 'smooth'))
qplot(y = hwy, data = mpg, color = drv)
qplot(drv, hwy, data = mpg, geom = 'boxplot')
qplot(drv, hwy, data = mpg, geom = 'boxplot', color = manufacturer)
qplot(hwy, data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = .~ drv)
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)

# customized plots with ggplot2
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'), facets = .~drv)
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'), facets = drv~.)
g <- ggplot(mpg, aes(displ,hwy))
summary(g)

# adding layers
g + geom_point()
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method = 'lm')
g + geom_point() + geom_smooth(method = 'lm') + facet_grid(.~drv)
g + geom_point(color = 'pink', size = 4, alpha = 1/2)
g + geom_point(size = 4, alpha = 1/2, aes(color = drv))
g + geom_point(aes(color = drv)) + labs(title = "Swirl Rules!") + labs(x = "Displacement", y = "Hwy Mileage")
g + geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = 'lm', se = FALSE)
x <- rnorm(100)
y <- rnorm(100)
plot(myx, myy, type = "l", ylim = c(-3,3))

g <- ggplot(mpg,aes(x=displ,y=hwy,color=factor(year)))
g + geom_point() + facet_grid(drv~cyl,margins=TRUE)
g + geom_point() + facet_grid(drv~cyl,margins=TRUE) + geom_smooth(method = 'lm', se = FALSE, size = 2, color = 'black')
g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")+labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")

# ggplot2 extras
data(diamonds)
str(diamonds)
qplot(price, data = diamonds)
range(diamonds$price)
qplot(price, data = diamonds, binwidth = 18497/30)
qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)
qplot(price, data = diamonds, geom = 'density')
qplot(price, data = diamonds, geom = 'density', color = cut)

qplot(carat, price, data = diamonds)
qplot(carat, price, data = diamonds, shape = cut)
qplot(carat, price, data = diamonds, color = cut)
qplot(carat,price,data=diamonds, color=cut) + geom_smooth(method="lm")
qplot(carat,price,data=diamonds, color=cut, facets=.~cut) + geom_smooth(method="lm")

g <- ggplot(diamonds,aes(depth,price))
summary(g)
g+geom_point(alpha=1/3)
cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
diamonds$car2 <- cut(diamonds$carat,cutpoints); stageVariable("diamonds$car2",diamonds$car2)
g <- ggplot(diamonds,aes(depth,price))
g+geom_point(alpha=1/3)+facet_grid(cut~car2)
diamonds[myd,]
g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")
ggplot(diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)

# Dendrogram plot
library(fields)
df <- data.frame(matrix(nrow=12, ncol=2, data=rnorm(24)))
distxy <- dist(df)
hc <- hclust(distxy)
plot(hc)
plot(as.dendrogram(hc))
abline(h=1.5,col="blue")
abline(h=0.4,col="red")

# Heatmaps http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering 
# http://arxiv.org/pdf/1404.1100.pdf
heatmap(matrix(nrow=12, ncol=2, data=rnorm(24)), col=cm.colors(25))
mt <- data("mtcars")
heat(mt)
heatmap(mt)

# Clustering http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones















