#
# Course project 1
#
# Plot 4
#

setwd("~/git/ExData_Plotting1")

unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric"))
data.subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data.subset$datetime <- strptime(paste(data.subset$Date, data.subset$Time),
                                 "%d/%m/%Y %H:%M:%S")

# The instructions ask for a plot that is 480 x 480 pixels, but the examples are
# 504 x 504. Going with the instructions.
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 5, 4, 2))

plot(data.subset$datetime, data.subset$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "o", pch = "")

plot(data.subset$datetime, data.subset$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "o", pch = "")

plot(data.subset$datetime, data.subset$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "o", pch = "")
points(data.subset$datetime, data.subset$Sub_metering_2,
       type = "o", pch = "", col = "red")
points(data.subset$datetime, data.subset$Sub_metering_3,
       type = "o", pch = "", col = "blue")
legend("topright", lwd = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data.subset$datetime, data.subset$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "o", pch = "")

dev.off()