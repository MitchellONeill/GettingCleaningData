##1.Merges the training and the test sets to create one data set.
##Downloading the data 
library(data.table)
library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip"
if(!file.exists("./UCI HAR Dataset")){unzip(download.file(fileURL))}
##Reading the data files into tables
TrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
TestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
TrainAct <- read.table("./UCI HAR Dataset/train/y_train.txt")
TestAct <- read.table("./UCI HAR Dataset/test/y_test.txt")
TrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
TestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
##Reading the general labelling information into tables
ActLabels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
ColNames <- read.table("./UCI HAR Dataset/features.txt")
##may delete: ColNames[,"V2"]<- gsub("\\()", "", ColNames[,"V2"]) ##removing the () from our ColNames data.table for tidyness
##Grouping the subject and variable labelling information with the data sets
FullTrain <- cbind(TrainSubject, TrainAct, TrainData) 
FullTest <- cbind(TestSubject, TestAct, TestData)
##This formatting corresponds to part (4.) I am adding the column names to the data table.
ColNames[,"V2"]<- gsub("\\()", "", ColNames[,"V2"]) ##removing the () from our ColNames data.table for tidyness
ColNames <- t(c("Subject", "Activity", as.character(ColNames[,-1])))
names(FullTrain) <- ColNames
names(FullTest) <- ColNames
##Combining the Test and Train datasets
FullData <- rbind(FullTrain, FullTest)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
index <- grep(c("Subject|Activity|\\mean|\\-std"), names(FullData)) ##makes an index for the column rows we want to keep
MeanStdData <- FullData[,index]
MeanStdData <- MeanStdData[order(MeanStdData$Activity, MeanStdData$Subject), ] ##ordering data by Activity for readability
rownames(MeanStdData) <- NULL
##3.Uses descriptive activity names to name the activities in the data set.
##Substituting in the Activity names for their numbered labels 
for (i in seq_along(ActLabels$V1)){
        MeanStdData[,"Activity"] <- gsub(ActLabels[i,"V1"], ActLabels[i,"V2"], MeanStdData[,"Activity"])
}

##4.Appropriately labels the data set with descriptive variable names. 
## This was completed above as noted

##5.From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.
TidyMeans <- summarise_each(group_by(MeanStdData, Subject, Activity), funs(mean))

