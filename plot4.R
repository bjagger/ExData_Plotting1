# plot4.R

# use for testing/cleanup
# if(file.exists("plot4.png"))  {
#       file.remove("plot4.png")
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

png("plot4.png", bg = "transparent")
par(mfrow = c(2, 2))
plot(x = dat$DateTime,
     y = dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
plot(x = dat$DateTime,
     y = dat$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(x = dat$DateTime,
     y = dat$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering",
     type = "l")
lines(x = dat$DateTime,
      y = dat$Sub_metering_2,
      type = "l", col = "red")
lines(x = dat$DateTime,
      y = dat$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", c("Sub_metering_1",
                     "Sub_metering_2",
                     "Sub_metering_3"),
       bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue"))
plot(x = dat$DateTime,
     y = dat$Global_reactive_power,
     type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
par(mfrow = c(1,1))
dev.off()