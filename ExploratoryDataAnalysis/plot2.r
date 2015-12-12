rawTbl <- as.data.frame(read.table("household_power_consumption.txt", 
sep=";", header = TRUE, 
colClasses = c("character", "character", "numeric", 
    "numeric", "numeric", "numeric", "numeric", 
    "numeric", "numeric"), na.strings = c("?")))
TblDateRange <- subset( rawTbl, 
						as.Date(rawTbl$Date, "%d/%m/%Y") >= "2007-02-01"
						& as.Date(rawTbl$Date, "%d/%m/%Y") <= "2007-02-02"
					   )

x <- strptime(paste(TblDateRange$Date, TblDateRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- TblDateRange$Global_active_power
png("plot2.png", width=480, height=480)
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()