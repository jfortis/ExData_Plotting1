data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GAPplot <- as.numeric(data$Global_active_power)
GRPplot <- as.numeric(data$Global_reactive_power)
Vplot <- as.numeric(data$Voltage)
SM1 <- as.numeric(data$Sub_metering_1)
SM2 <- as.numeric(data$Sub_metering_2)
SM3 <- as.numeric(data$Sub_metering_3)
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(datetime, GAPplot, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(datetime, Vplot, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, SM1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, SM2, type = "l", col = "red")
lines(datetime, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty="o")
plot(datetime, GRPplot, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()