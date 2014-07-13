
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
png('plot2.png')

	plot(Dataset$Date,Dataset$GlobalActivePower, type ="l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()




