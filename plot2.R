source("read.R")

png(file = "plot2.png", width = 480, height = 480)
plot(consumption$timestamp, consumption$Global_active_power, type="l", xlab = "datetime", ylab = "Global Active Power (kilowatts) ")
dev.off()