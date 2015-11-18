# Load required library and set the working directory
# The required raw data files are already downloaded to the working directory
library(reshape2)
setwd("D:/ReadPlease/CourseraDataScience/Gettingandcleaning/Dataset/UCI HAR Dataset")

# Load the activity labels and features files
activity <- read.table("activity_labels.txt")
activity[,2] <- as.character(activity[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

# Extract only the columns related to mean and standard deviation
featuresReq <- grep(".*mean.*|.*std.*", features[,2])
featuresReq.name <- grep(".*mean.*|.*std.*", features[,2],value=TRUE)
featuresReq.name = gsub('-mean', 'Mean', featuresReq.name)
featuresReq.name = gsub('-std', 'Std', featuresReq.name)
featuresReq.name <- gsub('[-()]', '', featuresReq.name)

# Load the train and test datasets with only the required columns
train <- read.table("train/X_train.txt")[featuresReq]
trainActivity <- read.table("train/Y_train.txt")
trainSubject <- read.table("train/subject_train.txt")
traindata <- cbind(trainSubject, trainActivity, train)

test <- read.table("test/X_test.txt")[featuresReq]
testActivity <- read.table("test/Y_test.txt")
testSubject <- read.table("test/subject_test.txt")
testdata <- cbind(testSubject, testActivity, test)

# rbind the two datasets and add column names
mergedata <- rbind(traindata, testdata)
colnames(mergedata) <- c("subject", "activity", featuresReq.name)

# change activity and subject to factors
mergedata$activity <- factor(mergedata$activity, levels = activity[,1], labels = activity[,2])
mergedata$subject <- as.factor(mergedata$subject)

# merge and dcast to get the mean values for each column
mergedata.melted <- melt(mergedata, id = c("subject", "activity"))
mergedata.mean <- dcast(mergedata.melted, subject + activity ~ variable, mean)

# Create a text output file with the tidy dataset
write.table(mergedata.mean, "tidy.txt", row.names = FALSE, quote = FALSE)




