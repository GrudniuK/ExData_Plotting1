
#get full data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

## Converting dates
datetime <- paste(as.Date(data$Date, "%d/%m/%Y"), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plot
png(file="plot3.png", height=480, width=480)
plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(data$Sub_metering_2~data$Datetime, col="red")
lines(data$Sub_metering_3~data$Datetime, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)
dev.off()
