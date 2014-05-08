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
d2[, "Global_active_power"]  <- as.numeric(as.character(d2[, "Global_active_power"]))

print("Plotting")
png(filename="plot1.png",width=480,height=480,units='px')
hist(d2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", breaks=12)
dev.off()