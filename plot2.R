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
plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Plot and save as plot2.png
png("plot2.png", width = 480, height = 480)
plot(as.POSIXct(time_stamp), pwr_consump_2days$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()



