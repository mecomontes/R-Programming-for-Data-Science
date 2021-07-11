# Remove all the elements
rm(list=ls())
# Load the file 
df <- read.csv("/home/meco/Desktop/Coursera/datasciencecoursera/course 2/hw1_data.csv", header=TRUE, sep=",")
# View the dataframe
df
# Show last 2 rows
tail(df, n=2L)
# show row 47th
df[47,]
# Display second column
df[,2]
# How many missing values are in the Ozone column
sum(is.na(df['Ozone']))
# mean of the Ozone column
NA_values <- is.na(df$Ozone)
mean(df$Ozone[!NA_values])
# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
dfOT <- df[df$Ozone > 31 & df$Temp > 90,]
NA_Solar <- is.na(dfOT$Solar.R)
mean(dfOT$Solar.R[!NA_Solar])
# mean of "Temp" when "Month" is equal to 6
dfT <- df[df$Month==6,]
mean(dfT$Temp[!is.na(dfT$Temp)])
# maximum ozone value in the month of May
dfM <- df[df$Month==5,]
max(dfM$Ozone[!is.na(dfM$Ozone)])
