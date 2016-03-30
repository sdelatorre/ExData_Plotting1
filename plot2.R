###############################################################################
# Script used to generate plot 2 for assignment 1
###############################################################################

# Load the common functions
source('./common.R')

# Load the data - modify the location as needed.
household.data <- Load.Data("../household_power_consumption.txt")

# Create and save a line chart with the datetime data on the x-axis
# and the global.active.power data on the y-axis.
png("plot2.png", width = 480, height = 480, units = "px")

# Make sure there is only one plot shown on the device.
par(mfrow = c(1,1))

with(household.data, plot(datetime, global.active.power, 
                          type="l", 
                          ylab = "Global Active Power (kilowatts)",
                          xlab = ""))

dev.off()