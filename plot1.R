###############################################################################
# Script used to generate plot 1 for assignment 1
###############################################################################

# Load the common functions
source('./common.R')

# Load the data - modify the location as needed.
household.data <- Load.Data("../household_power_consumption.txt")

# Create and save a histogram with the global.active.power data.
png("plot1.png", width = 480, height = 480, units = "px")

# Make sure there is only one plot shown on the device.
par(mfrow = c(1,1))

with(household.data, hist(global.active.power, 
                          col = "red",
                          main = "Global Active Power",
                          xlab = "Global Active Power (kilowatts)"))

dev.off()
