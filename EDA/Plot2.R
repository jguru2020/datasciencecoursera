#Load Data
source("LoadAndPrepareData.R")
#Configure plot
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (KW/kilowatts)", xlab="")
})
#Save plot to respective file
dev.copy(png,"Plot2.png", width=480, height=480)
#Close the device
dev.off()