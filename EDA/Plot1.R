#Step-1 : Load Data
source("LoadAndPrepareData.R")
#Configure plot
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (KW/kilowatts)", ylab="Frequency", 
     col="Blue")

#Save plot to respective file
dev.copy(png,"Plot1.png", width=480, height=480)

#Close the device
dev.off()
