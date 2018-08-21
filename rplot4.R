# Rcode4: read in data and plot 4 panel plots

#read in data 
datafull <- fread(file="household_power_consumption.txt")

#convert column1 to dates

datafull$Date <- as.Date(datafull$Date,format="%d/%m/%Y")

#select date range
dataselect <- datafull[datafull$Date>='2007/02/01'& datafull$Date <= '2007/02/02',]

#remove full data set from memory (free up space)
rm(datafull)

#convert to date time data
date_col <- dataselect$Date
time_col <- dataselect$Time
#combine date and time into date time column
daytime <- as.POSIXct(paste(date_col,time_col),format="%Y-%m-%d %H:%M:%S")

#convert character columns to numeric
dataselect[,c(3:5,7:9)] <- lapply(dataselect[,c(3:5,7:9)],as.numeric)

#open png file 
png("rplot4.png")
par(mfrow=c(2,2))

#make plot 1
plot(daytime, dataselect$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

#make plot 2
plot(daytime, dataselect$Voltage,ylab="Voltage",xlab="datetime",type="l")

#make plot 3
plot(daytime,dataselect$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(daytime,dataselect$Sub_metering_2,type="l",col="red")
lines(daytime,dataselect$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")

#make plot 4
plot(daytime, dataselect$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")


#Close graphics device

dev.off()
