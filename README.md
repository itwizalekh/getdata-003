getdata-003
===========

Course project submission for Coursera MOOC "Getting and Cleaning Data"

The data for the project was taken from the following URL at 23:49 20-05-2014 IST: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The intention was to create an R script run_analysis.R that does the following:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive activity names.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

Readme.md
===========

A readme file containing brief description of each file submitted for the Course pPoject.

Here is a summary of what this script does:  
- Read various datasets
- Combine various datasets (training set with corresponding test set)

- As noted by "features_info.txt" file, tAcc-XYZ and tGyro-XYZ are the only raw 
  signals measured. Rest of the values are some or the other transformations 
  from tAcc-XYZ and tGyro-XYZ. 
  Hence, only extracting mean() and std() for tAcc-XYZ and tGyro-XYZ:
  (these are the following columns as per "features.txt")
  - 1 tBodyAcc-mean()-X
  - 2 tBodyAcc-mean()-Y
  - 3 tBodyAcc-mean()-Z
  - 4 tBodyAcc-std()-X
  - 5 tBodyAcc-std()-Y
  - 6 tBodyAcc-std()-Z
  - 41 tGravityAcc-mean()-X
  - 42 tGravityAcc-mean()-Y
  - 43 tGravityAcc-mean()-Z
  - 44 tGravityAcc-std()-X
  - 45 tGravityAcc-std()-Y
  - 46 tGravityAcc-std()-Z    
- Assign meaningful column names
- Load activity names (labels)
- Average all mean and SD measures over subject and activity for tidy data set
- Write the final tidy dataset to an ouptut file tidyDF.txt for submission

run_analysis.R
==============

This is the actual R script that was written for intended data processing required for submission towards the Course Project.  
  

tidyDF.txt
==========

This is the final data frame written to the output file containing three variables (columns in file) and 180 observatoins (rows in file, excluding header for column names).


