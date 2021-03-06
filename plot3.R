
##Reads data from txt and selects rows (dates) that we want to analyse
Dataset <- read.table("household_power_consumption.txt",sep=";", skip = 66500, nrows = 3500)
OkDates <- Dataset$V1 == "1/2/2007" | Dataset$V1 == "2/2/2007"
Dataset <- Dataset[OkDates,]

## Merges date and time colums and format the resulting columns as a date
OkDateFormat <- paste(Dataset$V1, Dataset$V2, sep=" ")
OkDateFormat <- strptime(OkDateFormat, format = "%d/%m/%Y %H:%M:%S")
Dataset <- (cbind(OkDateFormat, Dataset[,3:9]))

## Applies Labels to columns
names(Dataset) <- c("Date","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity", "SubMetering1", "SubMetering2","SubMetering3")

##Printing plots to .png file
png('plot3.png',bg = "transparent")

	plot(Dataset$Date,Dataset$SubMetering1, type ="l", main = "", xlab = "", ylab = "Energy sub metering")
	lines(Dataset$Date,Dataset$SubMetering2, col = "red")
	lines(Dataset$Date,Dataset$SubMetering3, col = "blue")
	legend("topright", legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), pch = 95, col = c("black","red","blue"), box.col = "transparent")

dev.off()




