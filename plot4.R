EPowerDat$Date <- as.Date(EPowerDat$Date, "%d/%m/%Y")

# Filter Subset data from 2007-02-01 and 2007-02-02
EP_SubDate <- EPowerDat[EPowerDat$Date == "2007/02/01" | EPowerDat$Date == "2007/02/02", ]

# Assigned Subset date & time data for x-axis from 2007-02-01 and 2007-02-02
EP_SubDateTime <- strptime(paste(EP_SubDate$Date, EP_SubDate$Time), "%Y-%m-%d %H:%M:%S")

# Active graphics device 
dev.cur()

## Assigned plot dimension & type
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## Plotting 2 x 2 plots in one frame
x <- EP_SubDateTime

## Plot 1: Time series plot for Global Active Power
plot(x, y = EP_SubDate$Global_active_power, type = "l",  xlab ="", ylab="Global Active Power (kilowatts)")

## Plot 2: Time series plot for Valtage
plot(x, y = EP_SubDate$Voltage, type = "l", xlab="datatime", ylab="Valtage")


## Plot 3: Time Series plot for Sub metering
plot(x, EP_SubDate$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(x, EP_SubDate$Sub_metering_2, col = "red")
lines(x, EP_SubDate$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4: Time Series plot for Global Reactive Power
plot(x, y = EP_SubDate$Global_reactive_power, type = "l", xlab="datatime", ylab="Global Reactive Power")

# Close the device.
dev.off()
