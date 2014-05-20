# 7352 observations
# setwd("")

# Read various datasets
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

# Combine various datasets
myDF <- rbind(cbind(subject_train, y_train, X_train), cbind(subject_test, y_test, X_test))

# as noted by "features_info.txt" file, tAcc-XYZ and tGyro-XYZ are the only raw 
# signals measured. Rest of the values are some or the other transformations 
# from tAcc-XYZ and tGyro-XYZ. 
# Hence, only extracting mean() and std() for tAcc-XYZ and tGyro-XYZ:
# (these are the following columns as per "features.txt")
# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 41 tGravityAcc-mean()-X
# 42 tGravityAcc-mean()-Y
# 43 tGravityAcc-mean()-Z
# 44 tGravityAcc-std()-X
# 45 tGravityAcc-std()-Y
# 46 tGravityAcc-std()-Z
#
# The offset (+2) is to account for activity and subject columns added
myDF2 <- myDF[,c(1,2,seq(1+2,6+2),seq(41+2,46+2))]

# assigning meaningful column names
colnames(myDF2) <- c("subject_id", "activity_id", "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z", "tGravityAcc_mean_X", "tGravityAcc_mean_Y", "tGravityAcc_mean_Z", "tGravityAcc_std_X", "tGravityAcc_std_Y", "tGravityAcc_std_Z")

# loading activity names (labels)
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id", "activity_name")

myDF3 <- merge(activity_labels, myDF2, by.x="activity_id", by.y="activity_id")
# myDF4 <- myDF3[,!(colnames(myDF3) %in% "activity_id")]
# rm(myDF4)
# ls()
myDF3 <- myDF3[,!(colnames(myDF3) %in% "activity_id")]

library(plyr)
# colnames(myDF3)
tidyDF <- ddply(myDF3, .(activity_name, subject_id), summarise,
 ave_tBodyAcc_mean_X=mean(tBodyAcc_mean_X),
 ave_tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y),
 ave_tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z),
 ave_tBodyAcc_std_X=mean(tBodyAcc_std_X),
 ave_tBodyAcc_std_Y=mean(tBodyAcc_std_Y),
 ave_tBodyAcc_std_Z=mean(tBodyAcc_std_Z),
 ave_tGravityAcc_mean_X=mean(tGravityAcc_mean_X),
 ave_tGravityAcc_mean_Y=mean(tGravityAcc_mean_Y),
 ave_tGravityAcc_mean_Z=mean(tGravityAcc_mean_Z),
 ave_tGravityAcc_std_X=mean(tGravityAcc_std_X),
 ave_tGravityAcc_std_Y=mean(tGravityAcc_std_Y),
 ave_tGravityAcc_std_Z=mean(tGravityAcc_std_Z)
)

write.table(tidyDF, file = "tidyDF.txt")
