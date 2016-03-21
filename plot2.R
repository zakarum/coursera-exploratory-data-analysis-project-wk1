require(data.table)
require(lubridate)
Sys.setlocale("LC_ALL","English")

pwc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = NA, na.strings = c(""," ","?"), as.is = TRUE)
pwc <- pwc[pwc$Date %in% c("1/2/2007","2/2/2007"),]
pwc$datetime <- dmy_hms(paste(pwc$Date,pwc$Time))

png(filename = "plot2.png", width = 480, height = 480)
plot(pwc$datetime, pwc$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
dev.off()