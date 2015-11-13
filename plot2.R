data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GPAplot <- as.numeric(data$Global_active_power)

png("plot2.png", width = 480, height = 480, units = "px")
plot(strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S"),
     GPAplot, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
