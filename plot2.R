#
# Exploratory Data Analysis
# Course project 1
#
# Plot 2
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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
par(mar = c(4, 5, 4, 2))

plot(data.subset$datetime, data.subset$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "o", pch = "")

dev.off()