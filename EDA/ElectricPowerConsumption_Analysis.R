#Step-1 : Load and clean measurement data
#----------------------------------------------------------
fileData = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric',
                               'numeric','numeric','numeric'))
head(fileData)

fileData$Date = as.Date(fileData$Date, "%d/%m/%Y")

# Filter for relevant period of data
filteredData = subset(fileData,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
completeCases = filteredData[complete.cases(t),]

## Combine Date and Time column
dateTimeField = paste(completeCases$Date, completeCases$Time)

## Name the vector
dateTimeField = setNames(dateTime, "DateTime")

## Remove Date, Time individual columns
completeCases <- completeCases[ ,!(names(completeCases) %in% c("Date","Time"))]

## Add combined DateTime field to completed cases table
completeCases <- cbind(dateTimeField, completeCases)

## Format dateTime Column
completeCases$dateTime <- as.POSIXct(dateTimeField)

# Plot-1: Creating the histogram
hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (KW)", col="blue")
