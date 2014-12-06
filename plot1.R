
#get full data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#plot
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
