## R file for Reproducible_research1

#Code for reading in the dataset and/or processing the data

#set working directory where the csv file is located

# Load relevant R libraries
library("data.table")
library(ggplot2)

# Extract data from CSV into a data table
activitydata = read.csv("activity.csv", header=TRUE, sep=",")
str(activitydata)

## Tidy data
activitydata$date = as.Date(activitydata$date, format="%Y-%m-%d")
activitydata$interval = as.factor(activitydata$interval)
str(activitydata)
head(activitydata,10)

#total number of steps taken per day
totalStepsPerDay = activitydata[, c(lapply(.SD, sum, na.rm = FALSE)), .SDcols = c("steps"), 
                                by = .(date)] 

head(totalStepsPerDay, 10)

# Plotting a histogram of the total number of steps taken on each day

g = ggplot(totalStepsPerDay, aes(x = steps)) +
  geom_histogram(color="black", fill="white", binwidth = 1000) +
  labs(title = "Histogram for Steps per Day", x = "Steps", y = "Frequency")
print(g)

#Calculate and report the mean and median of the total number of steps taken per day

