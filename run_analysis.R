library(dplyr)

#Download the data sets
filename <- "UCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Load the data sets
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","features"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.name = c("code","activity"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$features)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("code"))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$features)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("code"))

#Merge train and test data sets
TRAIN <- cbind(subject_train,Y_train,X_train)
TEST <- cbind(subject_test,Y_test,X_test)
M_data <- rbind(TRAIN,TEST)

#Select measurements with mean and std
M_dataMeanStd <- select(M_data, subject, code, contains("mean"),contains("std"))

#Use descriptive name of the activities to the data set
M_dataMeanStd$code <- activity_labels[M_dataMeanStd$code,2]

#Appropriately labels the data set with descriptive variable names
names(M_dataMeanStd)[2] = "activity"
names(M_dataMeanStd)<-gsub("Acc", "Accelerometer", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("Gyro", "Gyroscope", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("BodyBody", "Body", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("Mag", "Magnitude", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("^t", "Time", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("^f", "Frequency", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("tBody", "TimeBody", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("-mean()", "Mean", names(M_dataMeanStd), ignore.case = TRUE)
names(M_dataMeanStd)<-gsub("-std()", "STD", names(M_dataMeanStd), ignore.case = TRUE)
names(M_dataMeanStd)<-gsub("-freq()", "Frequency", names(M_dataMeanStd), ignore.case = TRUE)
names(M_dataMeanStd)<-gsub("angle", "Angle", names(M_dataMeanStd))
names(M_dataMeanStd)<-gsub("gravity", "Gravity", names(M_dataMeanStd))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
new_data <- M_dataMeanStd %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(new_data, "new_data.txt", row.name=FALSE)




