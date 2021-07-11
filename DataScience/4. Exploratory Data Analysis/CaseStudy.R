# https://www.health.ny.gov/environmental/indoors/air/pmq_a.htm
# https://www.epa.gov/enviro/state-fips-code-listing
library(fields)


pm0 <- "download the dataset"
dim(pm0)
head(pm0)
cnames <- names(pm0)
cnames <- strsplit(cnames, '|', fixed=TRUE)
wcol <- c(3, 4, 5, 11, 15)

names(pm0) <- make.names(cnames[[1]][wcol])
head(pm0)
x0 <- pm0$Sample.Value
mean(is.na(x0))
summary(x0)

names(pm1) <- make.names(cnames[[1]][wcol])
dim(pm1)
head(pm1)
x1 <- pm1$Sample.Value
mean(is.na(x1))
summary(x1)
negative <- x1<0
sum(negative, na.rm=TRUE)
mean(negative, na.rm = TRUE)

boxplot(x0, x1)
boxplot(log10(x0), log10(x1))
dates <- pm1$Date
str(Dates)
dates <- as.Date(as.character(dates), "%Y%m%d")
head(dates)
hist(dates[negative], 'month')

