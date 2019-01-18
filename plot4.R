setwd("D:/Yanii/JHU Data Science/Exploratory_data_analysis/")

## set data file name
dataFile <- "household_power_consumption.txt"

## read file

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data
dataSubset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTime, voltage, type="l", xlab="dateTime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactivePower, type="l", xlab="dateTime", ylab="Global_reactive_power")

dev.off()