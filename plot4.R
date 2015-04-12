setwd("./development/coursera/expl_data_analysis/")

dataset = read.table(file = "household_power_consumption.txt", sep = ";")
                     
dataToUse = dataset[dataset$V1 == "1/2/2007" | dataset$V1 == "2/2/2007" ,]
colnames(dataToUse) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#convert the timeformat 
dataToUse$Date <- as.Date(dataToUse$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
dataToUse$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataToUse,{
  #figure1
  plot(x = dataToUse$Datetime, y = as.character(dataToUse$Global_active_power), col = "black", type ="l", xlab = "", ylab = "Energy sub metering")
  #figure2
  plot(x = dataToUse$Datetime, y = as.character(dataToUse$Voltage), col = "black", type ="l", xlab = "datetime", ylab = "Voltage")
  #figure3
  {
    plot(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_1), col = "black", type ="l", xlab = "", ylab = "Energy sub metering")
    lines(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_2), col = "red")
    lines(x = dataToUse$Datetime, y = as.character(dataToUse$Sub_metering_3), col = "blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n",
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
  }
  #figure4
  plot(x = dataToUse$Datetime, y = as.character(dataToUse$Global_reactive_power), col = "black", type ="l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

                     
                     
                     