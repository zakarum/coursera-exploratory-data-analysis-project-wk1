require(data.table)
require(lubridate)
Sys.setlocale("LC_ALL","English")

pwc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = NA, na.strings = c(""," ","?"), as.is = TRUE)
pwc <- pwc[pwc$Date %in% c("1/2/2007","2/2/2007"),]
pwc$datetime <- dmy_hms(paste(pwc$Date,pwc$Time))

png(filename = "plot3.png", width = 480, height = 480)
plot(pwc$datetime, pwc$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(pwc$datetime, pwc$Sub_metering_2, type = "l", col = "red")
lines(pwc$datetime, pwc$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(rep(1,3)), col = c("black", "red", "blue"))
dev.off()