# Project Description
	
This project is to prepare a tidy data set for later analysis using the data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

	
## Raw Data Collection
	
The data for this project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The folder includes the following data sets that are being used:

	- 'features.txt': List of all features.  
	- 'activity_labels.txt': Links the class labels with their activity name.  
	- 'train/X_train.txt': Training set.
	- 'train/y_train.txt': Training labels.
	- 'test/X_test.txt': Test set.
	- 'test/y_test.txt': Test labels.
	- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample for training and test set respectively. Its range is from 1 to 30.

	
## Description on how to create the tidy data file 
	
1.	Download the above data and unzip to working directory.
2.	Read the data from training tables ‘X_train.txt’, ‘y_train.txt','subject_train.txt' and load into the vaiables x_train, y_train and subject_train respectively.
3.	Read the data from testing tables ‘X_test.txt', ‘y_test.txt' and 'subject_test.txt' files and load into the vaiables x_test, y_test and subject_test respectively.
4.	Load the features from 'features.txt' and activity labels from 'activity_labels.txt'. Assign the value to variables ‘features’ and ‘activity_labels’ respectively.
5.	Assign the column names
6.	Use cbind function to combine x_train, y_train and subject_train and store the result in merge_train
7.	Use cbind function to combine x_test, y_test and subject_test and store the result in merge_test
8.	Use rbind function to combine merge_train and merge_test and store the result in merge_data
9.	Read column names from merge_data and store in a variable named colNames
10.	Create vector for activityId, subjectId, mean and std using ‘grepl’ function and assign the value to Mean_and_Std variable
11.	Making necessary subset from merge_data and store the result into setForMeanAndStd variable
12.	Use ‘merge’ function to name the activity column in setForMeanAndStd using the descriptive activity names in ‘activity_labels’
13.	use ‘aggregate’ function to take the average of each in setWithActivityNames variable for each activity and each subject
14.	Arrange the data by subjectId and activityId
15.	Write the output to ‘TidyDataSet.txt’ in working directory.
	

## Description of variables
 
   •	x_train,y_train,subject_train,x_test,y_test and subject_test contains data of downloaded files  
   •	activity_labels: link class labels with their activity name   
   •	features: list of features
   •	merge_train: Contains merged data set of training tables  
   •	merge_test : Contains merged data set of testing tables  
   •	merge_data : Contains merged data set of both training and testing tables  
   •	colNames : Contains column names of merged data set of both tables  
   •	Mean_and_Std: Contains merged data set of training tables  
   •	setForMeanAndStd: Contains necessary subset from merge_data  
   •	setWithActivityNames: Assign name to the activity column using the descriptive activity names in ‘activity_labels’  
   •	secTidySet: Second tidy data set

