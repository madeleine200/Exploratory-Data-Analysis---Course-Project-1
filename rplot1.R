  # Rcode1: read in data and plot histogram of global active power
  
  #read in data 
  datafull <- fread(file="household_power_consumption.txt")
  #convert column1 to dates
  
  datafull$Date <- as.Date(datafull$Date,format="%d/%m/%Y")
  #remove full data set from memory
  
  
  #select date range
  dataselect <- datafull[datafull$Date>='2007/02/01'& datafull$Date <= '2007/02/02',]
  
  #remove full data set from memory (free up space)
  rm(datafull)
  
  #convert character variable to numeric
  dataselect$Global_active_power <- as.numeric(dataselect$Global_active_power)
  
  
  
  #open png file 
  png("rplot1.png")
  
  #make plot
  hist(dataselect$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  
  #Close graphics device
  dev.off()
