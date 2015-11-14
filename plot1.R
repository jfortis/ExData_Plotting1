data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
GAPplot <- as.numeric(data[data$Date %in% c("1/2/2007","2/2/2007") ,]$Global_active_power)

png("plot1.png", width = 480, height = 480, units = "px")
hist(GAPplot, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()