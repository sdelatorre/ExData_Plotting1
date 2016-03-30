###############################################################################
# Script used to generate plot 4 for assignment 1
###############################################################################

# Load the common functions
source('./common.R')

# Load the data - modify the location as needed.
household.data <- Load.Data("../household_power_consumption.txt")

# Create and save the four charts required by the assignment.
png("plot4.png", width = 480, height = 480, units = "px")

# Change the plot so that a 2x2 grid is output to the graphics device.
# The margin is also adjusted to match the example provided in the 
# assignment instructions.
par(mfrow = c(2,2), mar = c(5, 4, 4, 2))

# Plot 1 (upper left) - Global Active Power by Date/Time
with(household.data, plot(datetime, global.active.power, 
                          type="l", 
                          ylab = "Global Active Power",
                          xlab = ""))

# Plot 2 (upper right) - Voltage by Date/Time
with(household.data, plot(datetime, voltage, 
                          type="l", 
                          ylab = "Voltage",
                          xlab = "datetime"))

# Plot 3 (lower left) - Energy Sub Metering by Date/Time
with(household.data, plot(datetime, sub.metering.1, 
                          type="n", 
                          ylab = "Energy sub metering",
                          xlab = ""))
with(household.data, lines(datetime, sub.metering.1, col = "black"))
with(household.data, lines(datetime, sub.metering.2, col = "red"))
with(household.data, lines(datetime, sub.metering.3, col = "blue"))

legend("topright",
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 (lower right) - Global Reactive Power by Date/Time
with(household.data, plot(datetime, global.reactive.power, 
                          type="l", 
                          ylab = "Global_reactive_power",
                          xlab = "datetime"))

dev.off()