setwd("~/Desktop/Coursera/Exploratory Data Analysis/Week1Ass")
unzip("exdata_data_household_power_consumption.zip")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

png(filename = "plot1.png", height = 480, width = 480)

power2$Date <- as.Date(power2$Date, format = "%d/%m/%Y")
active <- as.numeric(as.character(power2$Global_active_power))
hist(active, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()