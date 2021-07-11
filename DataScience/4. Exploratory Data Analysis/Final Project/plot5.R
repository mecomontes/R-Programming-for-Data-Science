library("data.table")
library("ggplot2")

# Download and unzip the dataset
path <- '/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/Final Project'
setwd(path)
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = paste(path, "dataset.zip", sep = "/"))
unzip(zipfile = paste(path, "dataset.zip", sep = "/"))

# Obtain the information from the dataset
NEI <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
SCC <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))
x <- SCC$SCC.Level.Two
vehiclesSCC <- SCC[grepl("vehicle", x, ignore.case=TRUE), SCC]
vehiclesNEI <- NEI[NEI[, SCC] %in% vehiclesSCC,]

# Subsetting vehicles NEI data Baltimore
baltimoreVehiclesNEI <- vehiclesNEI[fips=="24510",]

# Create the device
png(filename = "plot5.png", width = 480, height = 480, units = "px")

# Create a barplot using ggplot
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
