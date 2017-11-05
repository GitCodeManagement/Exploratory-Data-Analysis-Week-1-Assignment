library(data.table)
quickRead <- fread(file = "household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings = "?")
twoDaysData <- subset(quickRead,Date=='1/2/2007'| Date=='2/2/2007')
png(filename = "plot1.png",width = 480, height = 480, units = "px")
with(twoDaysData,hist(Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power"))
dev.off()
dev.set(2)
rm(quickRead,twoDaysData)


