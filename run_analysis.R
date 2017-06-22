# Create the directory for the assignment and unzip the file
if(!file.exists("./Week_4_Assignment")){dir.create("./Week_4_Assignment")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Week_4_Assignment/Dataset.zip")
unzip(zipfile="./Week_4_Assignment/Dataset.zip",exdir="./Week_4_Assignment")

### 1. IMPORT DATA
# Import the training dataset and variables
x_train <- read.table("./Week_4_Assignment/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Week_4_Assignment/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Week_4_Assignment/UCI HAR Dataset/train/subject_train.txt")

# Import the testing dataset and variables
x_test <- read.table("./Week_4_Assignment/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Week_4_Assignment/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Week_4_Assignment/UCI HAR Dataset/test/subject_test.txt")

# Import features and activity labels
features <- read.table('./Week_4_Assignment/UCI HAR Dataset/features.txt')
activity_labels <- read.table('./Week_4_Assignment/UCI HAR Dataset/activity_labels.txt')

### 2.LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
colnames(x_train) <- features[,2]; colnames(y_train) <-"activityId"; colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] ; colnames(y_test) <- "activityId"; colnames(subject_test) <- "subjectId"
colnames(activity_labels) <- c("activityId","activity")

### 3. MERGE THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET
train <- cbind(y_train, subject_train, x_train); test <- cbind(y_test, subject_test, x_test)
combined <- rbind(train, test)

### 4. EXTRACT ONLY THE MEASUREMENTS ON MEAN AND STD FOR EACH MEASUREMENT
subset_mean_std <- (grepl("activityId", colnames(combined)) | 
                 grepl("subjectId", colnames(combined)) | 
                 grepl("mean..", colnames(combined)) | 
                 grepl("std..", colnames(combined)))
combined_mean_std <- combined[,subset_mean_std == TRUE]
combined_activities <- merge(combined_mean_std, activity_labels,
                               by='activityId',
                               all.x=TRUE)

## Create a second, independent tidy data set with the average of each variable for each activity and each subject
TidyDataSet <- aggregate(. ~subjectId + activityId, combined_activities, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

#Writing second tidy data set in txt file
write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)

