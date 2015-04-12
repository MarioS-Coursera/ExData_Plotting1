
dataset = read.table(file = "household_power_consumption.txt", sep = ";")
                     
dataToUse = dataset[dataset$V1 == "1/2/2007" | dataset$V1 == "2/2/2007" ,]
colnames(dataToUse) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#convert the timeformat 
Sys.setlocale("LC_TIME", "en_US.UTF-8")
dataToUse$Date <- as.Date(dataToUse$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
dataToUse$Datetime <- as.POSIXct(datetime)

{
plot(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_1), col = "black", type ="l", xlab = "", ylab = "Energy sub metering")
lines(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_2), col = "red")
lines(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_3), col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}
dev.copy(png, file="plot3.png", height=480, width=480, bg = "transparent")
dev.off()
