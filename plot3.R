datafile1 = "./data/household_power_consumption.txt"
if (!file.exists(datafile1))
{
    print(paste("Please place data file here: ", datafile1))
}
print("Reading data file")
d = read.csv(datafile1, sep=";") #,stringsAsFactors=FALSE)
print("Subsetting data")
d2 <- d[d$Date %in% c('1/2/2007', '2/2/2007'),]

print("Converting columns to numbers")
d2[, "Sub_metering_1"]  <- as.numeric(as.character(d2[, "Sub_metering_1"]))
d2[, "Sub_metering_2"]  <- as.numeric(as.character(d2[, "Sub_metering_2"]))
d2[, "Sub_metering_3"]  <- as.numeric(as.character(d2[, "Sub_metering_3"]))
d2$Date <- as.POSIXct(paste(d2$Date,d2$Time), format="%d/%m/%Y %H:%M:%S")
print("Plotting")
png(filename="plot3.png",width=480,height=480,units='px')
plot(d2$Date, d2$Sub_metering_1, col="black", type="n", ylim=c(-1,39), xlab="", ylab="Energy sub metering", yaxs="i")
lines(d2$Date, d2$Sub_metering_1, col="black")#, ylim=c(0,30))
lines(d2$Date, d2$Sub_metering_2, col="red")#, ylim=c(0,30))
lines(d2$Date, d2$Sub_metering_3, col="blue")#, ylim=c(0,30))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()