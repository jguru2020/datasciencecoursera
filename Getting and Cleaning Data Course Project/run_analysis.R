
#Preparation by loading the relevant packages
library(dplyr)

#Access the data files by downloading the archive file
  archiveDataFile = "Coursera_DS3_Final.zip"
  if (!file.exists(archiveDataFile))
  {
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, archiveDataFile, method="curl")
  }  

#Unzip to a folder
  if (!file.exists("UCI HAR Dataset")) 
  { 
    unzip(archiveDataFile) 
  }

# Creating data frames by reading appropriate data files
  features = read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
  activities = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  subject_test = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test = read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  subject_train = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  x_train = read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")