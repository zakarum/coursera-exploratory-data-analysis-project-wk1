require(data.table)
pwc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = NA, na.strings = c(""," ","?"), as.is = TRUE)