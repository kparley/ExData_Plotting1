setwd("~/Work/Professional development/Data Science course/Exploratory Data Analysis")
library(data.table)
file <- fread("household_power_consumption.txt", na.strings="?")
date_time <- strptime(paste(file[,Date], file[,Time], sep = " "), format = "%d/%m/%Y %H:%M:%S")
file$date_time <- as.POSIXct(date_time)
data <-subset(file, date_time >= as.POSIXct ('2007-02-01') & date_time < as.POSIXct ('2007-02-03'))
hist(data[, Global_active_power], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.copy (png, file = ("plot1.png"))
dev.off()