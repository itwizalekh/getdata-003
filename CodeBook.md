tidyDF.txt
==========

This is the final data frame written to the output file containing three variables (columns in file) and 180 observatoins (rows in file, excluding header for column names).
This Data Set contains the following two key variables:
- activity_name  
- subject_id  
  
This Data Set also contains the following average values corresponding to each unique combination of key values:
- ave_tBodyAcc_mean_X
- ave_tBodyAcc_mean_Y
- ave_tBodyAcc_mean_Z
- ave_tBodyAcc_std_X
- ave_tBodyAcc_std_Y
- ave_tBodyAcc_std_Z
- ave_tGravityAcc_mean_X
- ave_tGravityAcc_mean_Y
- ave_tGravityAcc_mean_Z
- ave_tGravityAcc_std_X
- ave_tGravityAcc_std_Y
- ave_tGravityAcc_std_Z


Processing done on input data to produce tidyDF.txt (output)
=====================

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
