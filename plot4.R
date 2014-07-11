##setwd("~/Documents/Data Science and Statistics/Coursera/Exploratory Data Analysis 4/Project1")
## Load full dataset
##pwr_consump <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", , na.strings = "?", stringsAsFactor = FALSE)
                             
pwr_consump_2days        <- subset(pwr_consump, ((Date == "1/2/2007") | (Date == "2/2/2007")))

time_stamp  <- paste(pwr_consump_2days$Date, pwr_consump_2days$Time, sep = " ")
time_stamp <- strptime(time_stamp, format = "%d/%m/%Y %H:%M:%S")

## Plot to screen
if(1){
par(mfrow = c(2,2))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(as.POSIXct(time_stamp), pwr_consump_2days$Voltage, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

ylim <- range(c(pwr_consump_2days$Sub_metering_1,pwr_consump_2days$Sub_metering_2, pwr_consump_2days$Sub_metering_3))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_1, type = "l", ylim = ylim, ylab = "Energy sub metering", xlab = "", col = "black")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid"), col = c("black", "red", "blue"))

plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
}

# Plot and save as plot3.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(as.POSIXct(time_stamp), pwr_consump_2days$Voltage, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "datetime")

ylim <- range(c(pwr_consump_2days$Sub_metering_1,pwr_consump_2days$Sub_metering_2, pwr_consump_2days$Sub_metering_3))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_1, type = "l", ylim = ylim, ylab = "Energy sub metering", xlab = "", col = "black")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid"), col = c("black", "red", "blue"))

plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "datetime")
dev.off()


