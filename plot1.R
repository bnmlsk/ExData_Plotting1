source("read.R")

png(file = "plot1.png", width = 480, height = 480)
hist(consumption$Global_active_power, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()