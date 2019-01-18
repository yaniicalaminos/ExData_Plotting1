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


## plot no. 1
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()