

## Project 1 Exploratory Data Analysis Plot1 ##
DataPower <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors=FALSE)
Data2Day <- DataPower[DataPower$Date == "1/2/2007" | DataPower$Date == "2/2/2007",]
Data2Day$DT <- paste(Data2Day$Date, Data2Day$Time)
Data2Day$RT <- strptime(Data2Day$DT, "%m/%d/%Y %H:%M:%S")
Data2Day[,3:9] <- lapply(Data2Day[,3:9], as.numeric)
png(filename = "plot1.png", width = 480, height = 480)
hist(Data2Day$Global_active_power, breaks = c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()

