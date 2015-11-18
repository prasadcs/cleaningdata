## Getting and Cleaning Data: Course Project

### Introduction
This is project work done for the coursera getting and cleaning data course. The input data provided is cleaned and only the required fields are filtered out and an output tiday dataset is created.  

### Data source
The data for the project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The data is collected from the accelerometers from the Samsung Galaxy S smartphone.

There are two sets of data: Train and Test. Both the sets have the following files

* x_test(train).txt: Has 561 columns for each row
* y_test(train).txt file: Has the activity labels
* subject_test(train).txt file: Has the information on subject identifier

### Data transformation script
The script run_analysis.R performs the transformation steps and creates the output tidy.txt file.The script follows the below sequence to create the tidy file:

* Load the activity labels and features files
* Extract only the data on mean and standard deviation
* Load the train and test datasets with only the required columns
* Append the two datasets and add column names
* change activity and subject to factors
* convert the data to a lean and lengthy file
* calculate the means of the variables
* Create the tidy text file as an output

### Tidy output file
The output file has 81 columns
The first column is the subject identifier and the second is the activity
The rest 79 are the average values of mean and standard deviation 





