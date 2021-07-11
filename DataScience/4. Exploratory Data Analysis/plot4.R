# Read and load file into a data table subseting by date 1/2/2017 - 2/2/2017
Data <- read.table("/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting the data from 1/2/2007 to 2/2/2007
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the graph and save as png file
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert Global_active_power, Voltage and Sub_metering variables as numeric representation
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)
SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Create a png device and set general plot parameter
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot 1
plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(datetime, SubMetering1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SubMetering2, type="l", col = "red")
lines(datetime, SubMetering3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

# Plot 4 that contains all the plots
plot(datetime, GlobalReactivePower, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
