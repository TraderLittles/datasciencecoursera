
rawTbl <- as.data.frame(read.table("household_power_consumption.txt", 
sep=";", header = TRUE, 
colClasses = c("character", "character", "numeric", 
    "numeric", "numeric", "numeric", "numeric", 
    "numeric", "numeric"), na.strings = c("?")))
TblDateRange <- subset( rawTbl, 
						as.Date(rawTbl$Date, "%d/%m/%Y") >= "2007-02-01"
						& as.Date(rawTbl$Date, "%d/%m/%Y") <= "2007-02-02"
					   )
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

x <- strptime(paste(TblDateRange$Date, TblDateRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- TblDateRange$Global_active_power
plot(x, y, type="l", xlab="", ylab="Global Active Power")

x <- strptime(paste(TblDateRange$Date, TblDateRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- TblDateRange$Voltage
plot(x, y, type="l", xlab="datetime", ylab="Voltage")


x <- strptime(paste(TblDateRange$Date, TblDateRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
yOne <- TblDateRange$Sub_metering_1
yTwo <- TblDateRange$Sub_metering_2
yThree <- TblDateRange$Sub_metering_3
plot(x,yOne, type="l", xlab="", ylab="Energy sub metering")
points(x,yTwo,type="l", col = "red")
points(x,yThree,type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5), col=c("black","red","blue"), bty = "n")


x <- strptime(paste(TblDateRange$Date, TblDateRange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- TblDateRange$Global_reactive_power
plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

