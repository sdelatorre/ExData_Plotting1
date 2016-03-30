###############################################################################
# Script used to generate plot 3 for assignment 1
###############################################################################

# Load the common functions
source('./common.R')

# Load the data - modify the location as needed.
household.data <- Load.Data("../household_power_consumption.txt")

# Create and save a line chart with the datetime data on the x-axis
# and the sub metering data on the y-axis.
png("plot3.png", width = 480, height = 480, units = "px")

# Make sure there is only one plot shown on the device.
par(mfrow = c(1,1))

# Create the base of the chart.
with(household.data, plot(datetime, sub.metering.1, 
                          type="n", 
                          ylab = "Energy sub metering",
                          xlab = ""))

# Add the data from each of the sub metering readings. 
with(household.data, lines(datetime, sub.metering.1, col = "black"))
with(household.data, lines(datetime, sub.metering.2, col = "red"))
with(household.data, lines(datetime, sub.metering.3, col = "blue"))

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()