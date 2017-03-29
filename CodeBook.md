Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.
 Download the data sets into local directory and unzip the files.
 # Train Folder
* X_train.txt : training data
* Y_train.txt : training lable data
* Subject_train.txt : subjects numbers for training observation
# Test Folder
* X_test.txt : test data
* Y_test.txt : test label data
* Subject_test.txt : subjects numbers for test observation
* activity_lables.txt : file containing activity text labels
* feature.txt : file containing features name
# Transformation
* activityLabels : load the file using fread command and used argument col.names( "classLabels" and "activityName" )
* FeatureLabels : load the file using fread command and used argument col.names( "index", "featureNames")
* FeatureWanted and measurements : uses the "grep" function to capture all column numbers and column names that contains "mean" or "std" in its description. Once the original feature names are available it uses "gsub" function to replace all special chracters from the text; in this case expecially "()" and "-"
* train data set : set contains those columns only with featureWanted mean and standard deviation observations with activity and subject
* test data set : set contains those columns only with featureWanted mean and standard deviation observations with activity and subject
* mergeData : merge train and test data using rbind command, set the Activity and SubjectNum as factor.
# independent tidy data set created with the average of each variable for each activity and each subject used reshape2 package. Fist used melt function to mergeData to reshape into tall and skinny data, id = c("subjectNum", "Activity"),set measure.vars = varaible, and  dcast function to mergeData from the first step used argument fun.aggregate = mean. Tidy data set as a txt file created with write.table() using row.name=FALSE 

# Variables Name 
# subjectNum - The group of 30 volunteers who carried out the experiment
* 1  
* 2
* 3 
* 4
* 5
* 6
* 7
* 8
* 9
* 10
* 11
* 12
* 13
* 14
* 15
* 16
* 17
* 18
* 19
* 20
* 21
* 22
* 23
* 24
* 25
* 26
* 27
* 28
* 29
* 30
# Activities : The six activites that each person performed
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
# These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.
# The set of variables that were estimated from these signals are: 
  mean(): Mean Value,
  std() : Standard Deviation
* 1 tBodyAcc-mean()-X
* 2 tBodyAcc-mean()-Y
* 3 tBodyAcc-mean()-Z
* 4 tBodyAcc-std()-X
* 5 tBodyAcc-std()-Y
* 6 tBodyAcc-std()-Z
* 7 tGravityAcc-mean()-X
* 8 tGravityAcc-mean()-Y
* 9 tGravityAcc-mean()-Z
* 10 tGravityAcc-std()-X
* 11 tGravityAcc-std()-Y
* 12 tGravityAcc-std()-Z
* 13 tBodyAccJerk-mean()-X
* 14 tBodyAccJerk-mean()-Y
* 15 tBodyAccJerk-mean()-Z
* 16 tBodyAccJerk-std()-X
* 17 tBodyAccJerk-std()-Y
* 18 tBodyAccJerk-std()-Z
* 19 tBodyGyro-mean()-X
* 20 tBodyGyro-mean()-Y
* 21 tBodyGyro-mean()-Z
* 22 tBodyGyro-std()-X
* 23 tBodyGyro-std()-Y
* 24 tBodyGyro-std()-Z
* 25 tBodyGyroJerk-mean()-X
* 26 tBodyGyroJerk-mean()-Y
* 27 tBodyGyroJerk-mean()-Z
* 28 tBodyGyroJerk-std()-X
* 29 tBodyGyroJerk-std()-Y
* 30 tBodyGyroJerk-std()-Z
* 31 tBodyAccMag-mean()
* 32 tBodyAccMag-std()
* 33 tGravityAccMag-mean()
* 34 tGravityAccMag-std()
* 35 tBodyAccJerkMag-mean()
* 36 tBodyAccJerkMag-std()
* 37 tBodyGyroMag-mean()
* 38 tBodyGyroMag-std()
* 39 tBodyGyroJerkMag-mean()
* 40 tBodyGyroJerkMag-std()
* 41 fBodyAcc-mean()-X
* 42 fBodyAcc-mean()-Y
* 43 fBodyAcc-mean()-Z
* 44 fBodyAcc-std()-X
* 45 fBodyAcc-std()-Y
* 46 fBodyAcc-std()-Z
* 47 fBodyAcc-meanFreq-X
* 48 fBodyAcc-meanFreq-Y
* 49 fBodyAcc-meanFreq-Z
* 50 fBodyAccJerk-mean()-X
* 51 fBodyAccJerk-mean()-Y
* 52 fBodyAccJerk-mean()-Z
* 53 fBodyAccJerk-std()-X
* 54 fBodyAccJerk-std()-Y
* 55 fBodyAccJerk-std()-Z
* 56 fBodyAccJerk-meanFreq()-X
* 57 fBodyAccJerk-meanFreq()-Y
* 58 fBodyAccJerk-meanFreq()-Z
* 59 fBodyAccJerk-skewness()-X
* 60 fBodyGyro-mean()-X
* 61 fBodyGyro-mean()-Y
* 62 fbodyGyro-mean()-Z
* 63 fBodyGyro-std()-X
* 64 fBodyGyro-std()-Y
* 65 fBodyGyro-std()-Z
* 66 fBodyGyro-meanFreq()-X
* 67 fBodyGyro-meanFreq()-Y
* 68 fBodyGyro-meanFreq()-Z
* 69 fBodyAccMag-mean()
* 70 fBodyAccMag-std()
* 71 fBodyAccMag-meanFreq()
* 72 fBodyBodyAccJerkMag-mean()
* 73 fBodyBodyAccJerkMag-std()
* 74 fBodyBodyGyroMag-mean()
* 75 fBodyBodyGyroMag-std()
* 76 fBodyBodyGyroMag-meanFreq()
* 77 fBodyBodyGyroJerkMag-mean()
* 78 fBodyBodyGyroJerkMag-std()
* 79 fBodyBodyGyroJerkMag-meanFreq()
* 80 angle(tBodyAccMean,gravity)
* 81 angle(tBodyAccJerkMean),gravityMean)
* 82 angle(tBodyGyroMean,gravityMean)
* 83 angle(tBodyGyroJerkMean,gravityMean)
* 84 angle(X,gravityMean)
* 85 angle(Y,gravityMean)
* 86 angle(Z,gravityMean)

















