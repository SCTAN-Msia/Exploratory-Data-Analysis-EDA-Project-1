# Project Name: Conduct a preliminary graphic analysis on individual household electric power consumption.
# Data: Data set from the UC Irvine Machine Learning Repository. 
# The data measurements of electric power consumption in one household with a one-minute sampling 
# rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


# Construct Plot 1

#setwd working directory
setwd("C:/Users/small/Documents/R_GitHub/EDA/EDA Project 1")

#Reads in data from the working directory
EPowerDat <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# convert Date variable to Date class
EPowerDat$Date <- as.Date(EPowerDat$Date, "%d/%m/%Y")

# Filter Subset data from 2007-02-01 and 2007-02-02
EP_SubDate <- EPowerDat[EPowerDat$Date == "2007/02/01" | EPowerDat$Date == "2007/02/02", ]

# Active graphics device 
dev.cur()

## Assigned plot dimension
png("plot1.png", width=480, height=480)

## Plotting Histrogram for Global Active Power
hist(EP_SubDate$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close the device.
dev.off()


