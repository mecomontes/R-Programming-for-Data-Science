# Read and load file into a data table subseting by date 1/2/2017 - 2/2/2017
Data <- read.table("/home/meco/Desktop/Coursera/datasciencecoursera/4. Exploratory Data Analisys/household_power_consumption.txt", header = TRUE, sep = ";")

# Subsetting the data from 1/2/2007 to 2/2/2007
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the histogram and save as png file
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Create a plot object histogram
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Create a png device
dev.copy(png, width=480, height=480, file = "plot1.png")
dev.off()
