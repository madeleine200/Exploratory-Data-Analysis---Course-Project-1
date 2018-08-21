# Rcode2: read in data and plot line graph global active power vs day and time

#read in data 
datafull <- fread(file="household_power_consumption.txt")
#convert column1 to dates

datafull$Date <- as.Date(datafull$Date,format="%d/%m/%Y")

#select date range
dataselect <- datafull[datafull$Date>='2007/02/01'& datafull$Date <= '2007/02/02',]
#remove full data set from memory
rm(datafull)

#convert character variable to numeric
dataselect$Global_active_power <- as.numeric(dataselect$Global_active_power)

date_col <- dataselect$Date
time_col <- dataselect$Time

daytime <- as.POSIXct(paste(date_col,time_col),format="%Y-%m-%d %H:%M:%S")

#open png file 
png("rplot2.png")

#make plot
plot(daytime, dataselect$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()
