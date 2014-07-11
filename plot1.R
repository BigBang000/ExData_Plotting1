##setwd("~/Documents/Data Science and Statistics/Coursera/Exploratory Data Analysis 4/Project1")
## Load full dataset
pwr_consump <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", , na.strings = "?", stringsAsFactor = FALSE) ##nrows = 10)
                             
pwr_consump_2days        <- subset(pwr_consump, ((Date == "1/2/2007") | (Date == "2/2/2007")))
pwr_consump_2days$Date   <- as.Date(pwr_consump_2days$Date, format = "%d/%m/%Y")  ## Note the order of m and d

## This makes plot on screen
hist(pwr_consump_2days$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
##dev.copy(png, file = "plot1.png")

## Following cretaes the png file: plot1.png
png("plot1.png", width = 480, height = 480)
hist(pwr_consump_2days$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()