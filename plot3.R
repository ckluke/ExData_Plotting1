setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week1Ass")
unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

power2$Date <- as.Date(power2$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power2$Date), power2$Time)
power2$Datetime <- as.POSIXct(datetime)

png(filename = "plot3.png", height = 480, width = 480)

with(power2, plot(Sub_metering_1 ~ Datetime, main = "", xlab = "", ylab = "Energy sub metering", type = "n"))
with(power2, lines(Datetime, Sub_metering_1, col = "black"))
with(power2, lines(Datetime, Sub_metering_2, col = "red"))
with(power2, lines(Datetime, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"), lty = "solid")

dev.off()
