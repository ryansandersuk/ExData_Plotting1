#
# Exploratory Data Analysis
# Course project 1
#
# Plot 1
#

setwd("~/git/ExData_Plotting1")

unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric"))
data.subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# The instructions ask for a plot that is 480 x 480 pixels, but the examples are
# 504 x 504. Going with the instructions.
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
par(mar = c(4, 5, 4, 2))

hist(data.subset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()