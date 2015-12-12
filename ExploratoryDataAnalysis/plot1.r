rawTbl <- as.data.frame(read.table("household_power_consumption.txt", 
sep=";", header = TRUE, 
colClasses = c("character", "character", "numeric", 
    "numeric", "numeric", "numeric", "numeric", 
    "numeric", "numeric"), na.strings = c("?")))
TblDateRange <- subset( rawTbl, 
						as.Date(rawTbl$Date, "%d/%m/%Y") >= "2007-02-01"
						& as.Date(rawTbl$Date, "%d/%m/%Y") <= "2007-02-02"
					   )

x <- TblDateRange$Global_active_power
png("plot1.png", width=480, height=480)
hist(x, freq = TRUE, col = "red", breaks =  11, main = "Global Active Power", xlab = "Global Acvtive Power (kilowatts)")
dev.off()