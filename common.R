###############################################################################
# Common functionality used by all of the plotting code.
###############################################################################
library(dplyr)
library(lubridate)

# Disable the default 'stringAsFactors' behavior for the read.* functions.
options(stringsAsFactors = FALSE)

Load.Data <- function(location, sep = ";", na.strings = "?") {
  # Loads and prepares the data for the plotting functions. The following transformations
  # are preformed:
  # 
  # 1. The file is fully loaded into memory.
  # 2. The data is filtered for the target dates (2/1/2007-2/2/2007)
  # 3. The columns are changed to friendlier names.
  # 4. The datetime column is created from the Date/Time columns.
  #
  # Args:
  #    location: The file name/location
  #
  # Returns:
  #    A prepared dataframe
  #
  if (!file.exists(location)) stop("the file location is invalid")
  
  tbl_df(read.delim(location, 
                    sep = sep,
                    na.strings = na.strings,
                    colClasses = c("character", "character", "numeric",
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"))) %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    rename(date = Date, 
           time = Time, 
           global.active.power = Global_active_power,
           global.reactive.power = Global_reactive_power,
           voltage = Voltage, 
           global.intensity = Global_intensity,
           sub.metering.1 = Sub_metering_1,
           sub.metering.2 = Sub_metering_2,
           sub.metering.3 = Sub_metering_3) %>%
    mutate(datetime = paste(date, time),
           datetime = dmy_hms(datetime))

}