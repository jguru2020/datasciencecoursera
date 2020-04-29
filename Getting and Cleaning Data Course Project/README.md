<html>
<h1>Course Project for Getting and Cleaning Data </h1>
<p> This assignment downloads the details from a website for expermenting the concepts of data cleaning. R scripts does the following activities to extract, transform and load from an archived file. <b> run_analysis.R </b> file performs the following steps as instructed in the course:
</p>
* Prepare the setup by loading the relevant packages(dplyr)
* Check if the file is already existing
* Download data sets archive file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract the data sets to pre-defined folder
* Several data frames are created by reading various data sets
* Merged training and test data sets into one
* Extracted only the measurements based on the mean and standard deviation for each measurement
* Re-named variables to have meaningful descriptive names
* Since variables are renamed, created another tidy data set
* Resulted are written to a output text file
* new tidy dataset printed onto the console
</html>
