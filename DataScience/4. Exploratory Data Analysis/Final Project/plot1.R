library("data.table")

# Download and unzip the dataset
path <- '/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/Final Project'
setwd(path)
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = paste(path, "dataset.zip", sep = "/"))
unzip(zipfile = paste(path, "dataset.zip", sep = "/"))

# Obtain the information from the dataset
SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

# Create the device
png(filename = "plot1.png", width = 600, height = 600, units = "px")

# Create a barplot
barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
dev.off()
