# Read and load file into a data table subseting by date 1/2/2017 - 2/2/2017
Data <- read.table("/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting the data from 1/2/2007 to 2/2/2007
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the graph and save as png file
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert Sub_metering variables as numeric representation
SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Create a png device
png("plot3.png", width=480, height=480)
plot(datetime, SubMetering1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SubMetering2, type="l", col = "red")
lines(datetime, SubMetering3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))
dev.off()
