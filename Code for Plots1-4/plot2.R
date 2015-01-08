## Project1.2 Exploratory Data Analysis Plot2 ##
DataPower <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors=FALSE)
Data2Day <- DataPower[DataPower$Date == "1/2/2007" | DataPower$Date == "2/2/2007",]
Data2Day$DT <- paste(Data2Day$Date, Data2Day$Time)
Data2Day$RT <- strptime(Data2Day$DT, "%d/%m/%Y %H:%M:%S")
Data2Day[,3:9] <- lapply(Data2Day[,3:9], as.numeric)
png(filename = "plot2.png", width = 480, height = 480)
plot(Data2Day$RT, Data2Day$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()