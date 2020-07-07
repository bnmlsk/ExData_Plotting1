source("read.R")

png(file = "plot3.png", width = 480, height = 480)
plot(consumption$timestamp, consumption$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering", xlab = NA)
lines(consumption$timestamp, consumption$Sub_metering_2, type="l", col = "red")
lines(consumption$timestamp, consumption$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 0.5, col = c("black", "red", "blue"))
dev.off()