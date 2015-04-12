setwd("./development/coursera/expl_data_analysis/")

dataset = read.table(file = "household_power_consumption.txt", sep = ";")
                     
dataToUse = dataset[dataset$V1 == "1/2/2007" | dataset$V1 == "2/2/2007" ,]
colnames(dataToUse) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#convert the timeformat 
dataToUse$Date <- as.Date(dataToUse$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
dataToUse$Datetime <- as.POSIXct(datetime)

plot(x = dataToUse$Datetime, y = as.character(dataToUse$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
                     