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
d2[, "Global_active_power"]  <- as.numeric(d2[, "Global_active_power"])/500
d2$Date <- as.POSIXct(paste(d2$Date,d2$Time), format="%d/%m/%Y %H:%M:%S")
print("Plotting")
png(filename="plot2.png",width=480,height=480,units='px')
plot(d2$Date, d2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()