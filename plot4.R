source("read.R")

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(consumption$timestamp, consumption$Global_active_power, type="l", xlab = "datetime", ylab = "Global Active Power")

plot(consumption$timestamp, consumption$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(consumption$timestamp, consumption$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering  ", xlab = NA)
lines(consumption$timestamp, consumption$Sub_metering_2, type="l", col = "red")
lines(consumption$timestamp, consumption$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 0.5, col = c("black", "red", "blue"), box.lwd = 0)

plot(consumption$timestamp, consumption$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
