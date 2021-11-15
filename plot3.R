# Project Name: Conduct a preliminary graphic analysis on individual household electric power consumption.
# Data: Data set from the UC Irvine Machine Learning Repository. 
# The data measurements of electric power consumption in one household with a one-minute sampling 
# rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

# Construct Plot 3

#setwd working directory
setwd("C:/Users/small/Documents/R_GitHub/EDA/EDA Project 1")

#Reads in data from the working directory
EPowerDat <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# convert Date variable to Date class
EPowerDat$Date <- as.Date(EPowerDat$Date, "%d/%m/%Y")

# Filter Subset data from 2007-02-01 and 2007-02-02
EP_SubDate <- EPowerDat[EPowerDat$Date == "2007/02/01" | EPowerDat$Date == "2007/02/02", ]

# Assigned Subset date & time data for x-axis from 2007-02-01 and 2007-02-02
EP_SubDateTime <- strptime(paste(EP_SubDate$Date, EP_SubDate$Time), "%Y-%m-%d %H:%M:%S")

# Active graphics device 
dev.cur()

## Assigned plot dimension
png("plot3.png", width=480, height=480)

## Plotting Sub Metering Time Series plots
x <- EP_SubDateTime

plot(x, EP_SubDate$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(x, EP_SubDate$Sub_metering_2, col = "red")
lines(x, EP_SubDate$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the device.
dev.off()

