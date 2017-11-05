library(data.table)
library(lubridate)
quickRead <- fread(file = "household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings = "?")
twoDaysData <- subset(quickRead,Date=='1/2/2007'| Date=='2/2/2007')
twoDaysData$Date <- dmy_hms(paste(twoDaysData$Date,twoDaysData$Time))
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2),mar=c(4,4,1,1))
#plot1  - start
plot(twoDaysData$Date, twoDaysData$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(twoDaysData$Date,twoDaysData$Global_active_power)
#plot1 - end

#plot2  - start
plot(twoDaysData$Date, twoDaysData$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(twoDaysData$Date,twoDaysData$Voltage)
#plot2 - end

#plot3 - start
plot(twoDaysData$Date, twoDaysData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(twoDaysData$Date,twoDaysData$Sub_metering_1)
lines(twoDaysData$Date,twoDaysData$Sub_metering_2,col="red")
lines(twoDaysData$Date,twoDaysData$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
#plot3 - end

#plot4  - start
plot(twoDaysData$Date, twoDaysData$Global_reactive_powe,type="n", xlab="datetime",ylab="Global_reactive_power")
lines(twoDaysData$Date,twoDaysData$Global_reactive_power)
#plot4 - end

dev.off()
dev.set(2)

rm(quickRead,twoDaysData)

