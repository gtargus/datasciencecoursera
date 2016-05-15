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

## Plot 3
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
