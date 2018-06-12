library(plyr)
# Downloading dataset

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#1.	Merges the training and the test sets to create one data set.

# 1.1 Reading files

# Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 1.2 Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')


# 1.3 Merging all data in one set:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merge_data<- rbind(merge_train, merge_test)


# 2.Extracting only the measurements on the mean and standard deviation for each measurement

# 2.1 Reading column names:
colNames<-colnames(merge_data)

# 2.2 Create vector for defining ID, mean and standard deviation:
Mean_and_Std<- (grepl("activityId", colNames) | grepl("subjectId", colNames) |grepl("mean", colNames)|grepl("std", colNames))

# 2.3 Making nessesary subset from merge_data:
setForMeanAndStd <- merge_data[ , Mean_and_Std == TRUE]

# 3. Using descriptive activity names to name the activities in the data set:
setWithActivityNames <- merge(setForMeanAndStd, activity_labels,by='activityId',all.x=TRUE)

# 4. Appropriately labeling the data set with descriptive variable names.
# This step was made in previos steps =) See 1.3, 2.2, 2.3.

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

# 5.1 Making second tidy data set 
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]


# 5.2 Writing second tidy data set in txt file
write.table(secTidySet, "TidyDataSet.txt", row.name=FALSE)

