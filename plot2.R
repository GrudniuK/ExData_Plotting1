
#get full data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

## Converting dates
datetime <- paste(as.Date(data$Date, "%d/%m/%Y"), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plot
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()