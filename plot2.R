setwd("D:/Yanii/JHU Data Science/Exploratory_data_analysis/")

## set data file name
dataFile <- "household_power_consumption.txt"

## read file

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## plot no 2
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()