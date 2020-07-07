library(readr)
library(lubridate)
library(dplyr)

if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
  file.remove("household_power_consumption.zip")
}


# as the file is rather big, nly read 
# data for selected range
selectDatesBetween <- function() {
  fromDate <- as.Date("2007-02-01")
  toDate <- as.Date("2007-02-02")
  function(x, pos) subset(x, Date >= fromDate & Date <= toDate)
}

consumption <- read_delim_chunked("household_power_consumption.txt",
                                  delim = ';',
                                  locale= locale(decimal_mark = '.'), 
                                  col_types = cols(col_date(format = '%d/%m/%Y'),
                                                   col_time(),
                                                   col_double(),
                                                   col_double(),
                                                   col_double(),
                                                   col_double(),
                                                   col_double(),
                                                   col_double(),
                                                   col_double()),
                                  callback = DataFrameCallback$new(selectDatesBetween()),
                                  na='?') %>% 
  mutate(timestamp = ymd_hms(paste(Date, Time)))
