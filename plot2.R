setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week1Ass")
unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

png(filename = "plot2.png", height = 480, width = 480)

power2$Date <- as.Date(power2$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power2$Date), power2$Time)
power2$Datetime <- as.POSIXct(datetime)

with(power2, plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))

dev.off()


