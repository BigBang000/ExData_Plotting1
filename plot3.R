##setwd("~/Documents/Data Science and Statistics/Coursera/Exploratory Data Analysis 4/Project1")
## Load full dataset
pwr_consump <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", , na.strings = "?", stringsAsFactor = FALSE)
                             
pwr_consump_2days        <- subset(pwr_consump, ((Date == "1/2/2007") | (Date == "2/2/2007")))
##small_frame  <- pwr_consump_2days[1:10,]

##timestamp  <- paste(pwr_consump_2days$Date, pwr_consump_2days$Time, sep = " ")
##timestamp  <- paste(small_frame$Date, small_frame$Time, sep = " ")
time_stamp  <- paste(pwr_consump_2days$Date, pwr_consump_2days$Time, sep = " ")
time_stamp <- strptime(time_stamp, format = "%d/%m/%Y %H:%M:%S")

## Plot to screen
if(1){
ylim <- range(c(pwr_consump_2days$Sub_metering_1,pwr_consump_2days$Sub_metering_2, pwr_consump_2days$Sub_metering_3))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_1, type = "l", ylim = ylim, ylab = "Energy sub metering", xlab = "", col = "black")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid"), col = c("black", "red", "blue"))
}

# Plot and save as plot3.png
png("plot3.png", width = 480, height = 480)
ylim <- range(c(pwr_consump_2days$Sub_metering_1,pwr_consump_2days$Sub_metering_2, pwr_consump_2days$Sub_metering_3))
plot(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_1, type = "l", ylim = ylim, ylab = "Energy sub metering", xlab = "", col = "black")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(time_stamp), pwr_consump_2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c("solid"), col = c("black", "red", "blue"))
dev.off()


