# plot1.R

# use for testing/cleanup
# if(file.exists("plot1.png"))  {
#       file.remove("plot1.png")
# }

# The dataset has 2,075,259 rows and 9 columns.

dat <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  as.is = TRUE,
                  na.strings = "?")
# names(dat)
# [1] "Date"                  "Time"                  "Global_active_power"
# [4] "Global_reactive_power" "Voltage"               "Global_intensity"
# [7] "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"

# subset of two days
dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

png("plot1.png", bg = "transparent")
hist(dat$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()