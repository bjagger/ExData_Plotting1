# plot2.R

# use for testing/cleanup
# if(file.exists("plot2.png"))  {
#       file.remove("plot2.png")
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

# dat[1,1:2]
#         Date     Time
# 1 16/12/2006 17:24:00

# subset of two days
dat <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

# convert and add new column

dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# View(dat)

png("plot2.png", bg = "transparent")
plot(x = dat$DateTime,
     y = dat$Global_active_power,
     type = 'l',
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()