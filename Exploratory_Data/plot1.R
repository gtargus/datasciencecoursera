## Get data - common for all plots
#================================================
##  missing values are coded as ?
power <- read.csv("/home/gtr/datasciencecoursera/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## You may find it useful to convert the Date and Time variables to Date/Time classes
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## remove the data we do not want 
rm(power)
#==================================================

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
