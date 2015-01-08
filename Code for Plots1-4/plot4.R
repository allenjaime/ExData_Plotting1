## Project1.4 Exploratory Data Analysis Plot4 ##
DataPower <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors=FALSE)
Data2Day <- DataPower[DataPower$Date == "1/2/2007" | DataPower$Date == "2/2/2007",]
Data2Day$DT <- paste(Data2Day$Date, Data2Day$Time)
Data2Day$RT <- strptime(Data2Day$DT, "%d/%m/%Y %H:%M:%S")
Data2Day[,3:9] <- lapply(Data2Day[,3:9], as.numeric)

## 4 plots ##
## 1 2 ##
## 3 4 ##
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(Data2Day$RT, Data2Day$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(Data2Day$RT, Data2Day$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(Data2Day$RT, Data2Day$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")

lines(Data2Day$RT, Data2Day$Sub_metering_2, col="red")

lines(Data2Day$RT, Data2Day$Sub_metering_3, col="blue")
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), bty = "n", merge = FALSE, xjust = 0, yjust = 0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Data2Day$RT, Data2Day$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()