# GettingCleaningData
Repo for the Getting and Cleaning Data course project 
Mitchell O'Neill: March 2015

#Codebook

##The run_analysis.R file transforms the UCI HAR Dataset files into 2 datasets:
··1. A dataset with the complete data on all subjects and activities relating to mean and std. MeanStdData (10299 obs, 81 variables)
··2. A tidy dataset which displays only the average mean and std for each activity by each subject. TidyMeans (180 obs, 81 variables)

##Inorder to create dataset 1 the following actions were performed:
··*The data from both the test and train dataset subfolders(for subject number, activity number and recorded output) are read into seperate data.frames: TrainData, TestData, TrainAct, TestAct, Train Suject, Test Subject
··*The stored data from above are combined into 2 data.frames for FullTest and FullTrain
··*The Activity and Feature files are read into data.frames: ActLables and ColNames
··*The Feature(ColNames) data.frame is coerced to make the names more readable for R and then attached as column names to FullTest and FullTrain data.frames
··*The two data.sets are combined by row into a data.frame "FullData"
··*An index is created that lists the column numbers of the FullData data.frame that relate to recored mean and standard deviation values
··*The index is used to subset "FullData" into a data.frame called "MeanStdData" that only inlcudes the indexed columns
··*A for loop is used to replace all the numbered activity indicators with the names from the ActLables data.frame

##Inorder to create dataset 2 the following actions were performed:
··*The MeanStdData data.frame is grouped first by Subject then Activity and finally summarised with the Mean function into a new data.frame: TidyMeans


##The variables for these two Data.Frames are as follows:
··1	Subject
··2	Activity
··3	tBodyAcc.mean.X
··4	tBodyAcc.mean.Y
··5	tBodyAcc.mean.Z
··6	tBodyAcc.std.X
··7	tBodyAcc.std.Y
··8	tBodyAcc.std.Z
··9	tGravityAcc.mean.X
··10	tGravityAcc.mean.Y
··11	tGravityAcc.mean.Z
··12	tGravityAcc.std.X
··13	tGravityAcc.std.Y
··14	tGravityAcc.std.Z
··15	tBodyAccJerk.mean.X
··16	tBodyAccJerk.mean.Y
··17	tBodyAccJerk.mean.Z
··18	tBodyAccJerk.std.X
··19	tBodyAccJerk.std.Y
··20	tBodyAccJerk.std.Z
··21	tBodyGyro.mean.X
··22	tBodyGyro.mean.Y
··23	tBodyGyro.mean.Z
··24	tBodyGyro.std.X
··25	tBodyGyro.std.Y
··26	tBodyGyro.std.Z
··27	tBodyGyroJerk.mean.X
··28	tBodyGyroJerk.mean.Y
··29	tBodyGyroJerk.mean.Z
··30	tBodyGyroJerk.std.X
··31	tBodyGyroJerk.std.Y
··32	tBodyGyroJerk.std.Z
··33	tBodyAccMag.mean
··34	tBodyAccMag.std
··35	tGravityAccMag.mean
··36	tGravityAccMag.std
··37	tBodyAccJerkMag.mean
··38	tBodyAccJerkMag.std
··39	tBodyGyroMag.mean
··40	tBodyGyroMag.std
··41	tBodyGyroJerkMag.mean
··42	tBodyGyroJerkMag.std
··43	fBodyAcc.mean.X
··44	fBodyAcc.mean.Y
··45	fBodyAcc.mean.Z
··46	fBodyAcc.std.X
··47	fBodyAcc.std.Y
··48	fBodyAcc.std.Z
··49	fBodyAcc.meanFreq.X
··50	fBodyAcc.meanFreq.Y
··51	fBodyAcc.meanFreq.Z
··52	fBodyAccJerk.mean.X
··53	fBodyAccJerk.mean.Y
··54	fBodyAccJerk.mean.Z
··55	fBodyAccJerk.std.X
··56	fBodyAccJerk.std.Y
··57	fBodyAccJerk.std.Z
··58	fBodyAccJerk.meanFreq.X
··59	fBodyAccJerk.meanFreq.Y
··60	fBodyAccJerk.meanFreq.Z
··61	fBodyGyro.mean.X
··62	fBodyGyro.mean.Y
··63	fBodyGyro.mean.Z
··64	fBodyGyro.std.X
··65	fBodyGyro.std.Y
··66	fBodyGyro.std.Z
··67	fBodyGyro.meanFreq.X
··68	fBodyGyro.meanFreq.Y
··69	fBodyGyro.meanFreq.Z
··70	fBodyAccMag.mean
··71	fBodyAccMag.std
··72	fBodyAccMag.meanFreq
··73	fBodyBodyAccJerkMag.mean
··74	fBodyBodyAccJerkMag.std
··75	fBodyBodyAccJerkMag.meanFreq
··76	fBodyBodyGyroMag.mean
··77	fBodyBodyGyroMag.std
··78	fBodyBodyGyroMag.meanFreq
··79	fBodyBodyGyroJerkMag.mean
··80	fBodyBodyGyroJerkMag.std
··81	fBodyBodyGyroJerkMag.meanFreq

Within the variable names there are several reoccuring values:
··*mean: Mean value
··*std: Standard deviation
··*meanFreq: Weighted average of the frequency components to obtain a mean frequency
··*X,Y,Z: Used to denote 3-axial signals in the X, Y and Z directions.
