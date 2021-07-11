library("data.table")
library("ggplot2")

# Download and unzip the dataset
path <- '/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/Final Project'
setwd(path)
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = paste(path, "dataset.zip", sep = "/"))
unzip(zipfile = paste(path, "dataset.zip", sep = "/"))

# Obtain the information from the dataset
SCC <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
baltimoreNEI <- NEI[fips=="24510",]

# Create the device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Create a barplot using ggplot
ggplot(baltimoreNEI, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
