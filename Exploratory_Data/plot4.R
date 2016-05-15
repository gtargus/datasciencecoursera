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

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_rective_power (kilowatts)",xlab="datetime")
})

## Save to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()