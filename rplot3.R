# Rcode3: read in data and plot line plots of energy sub metering 1,2 and 3

#read in data 
datafull <- fread(file="household_power_consumption.txt")

#convert column 1 to dates

datafull$Date <- as.Date(datafull$Date,format="%d/%m/%Y")

#select date range
dataselect <- datafull[datafull$Date>='2007/02/01'& datafull$Date <= '2007/02/02',]

#remove full data set from memory
rm(datafull)

#convert to date time data
date_col <- dataselect$Date
time_col <- dataselect$Time

#combine date and time into date time column
daytime <- as.POSIXct(paste(date_col,time_col),format="%Y-%m-%d %H:%M:%S")

#convert character columns to numeric
dataselect[,7:9] <- lapply(dataselect[,7:9],as.numeric)

#open png file 
png("rplot3.png")

#plot datA
plot(daytime,dataselect$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(daytime,dataselect$Sub_metering_2,type="l",col="red")
lines(daytime,dataselect$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

#Close graphics device
dev.off()

