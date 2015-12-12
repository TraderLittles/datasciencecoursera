
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
yOne <- TblDateRange$Sub_metering_1
yTwo <- TblDateRange$Sub_metering_2
yThree <- TblDateRange$Sub_metering_3
png("plot3.png", width=480, height=480)
plot(x,yOne, type="l", xlab="", ylab="Energy sub metering")
points(x,yTwo,type="l", col = "red")
points(x,yThree,type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"))
dev.off()