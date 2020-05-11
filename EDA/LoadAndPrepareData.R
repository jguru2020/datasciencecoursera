# This file reads, cleans and prepares relevant data for plotting individual plots

#Download and save household_power_consumption.txt file along with R file(in the same folder)
completeData = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Instead of processing the entire data set for plotting, extract the subset of 
#the data based on the analysis period
subsetData = subset(completeData, Date %in% c("1/2/2007","2/2/2007"))
subsetData$Date = as.Date(subsetData$Date, format="%d/%m/%Y")

#Combine date and time columns into one field called 'DateTime'
datetime = paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime = as.POSIXct(datetime)