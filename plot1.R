setwd("./development/coursera/expl_data_analysis/")

dataset = read.table(file = 'household_power_consumption.txt',sep = ";")
                     
dataToUse = dataset[dataset$V1 == "1/2/2007" | dataset$V1 == "2/2/2007" ,]
colnames(dataToUse) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
 
hist(as.numeric(as.character(dataToUse$Global_active_power)), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
