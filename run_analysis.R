# Load Packages and get the Data in R
library("reshape2")
library(data.table)
setwd("C:/Users/nvarshney/Desktop/R programming/Coursera")
getwd()
path <-getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# Load activity labels + features
activityLabels <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/activity_labels.txt",
                        col.names = c("classLabels", "activityName"))
View(activityLabels)

featureLabels <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/features.txt", 
                       col.names = c("index","featureNames"))
View(featureLabels)
featureWanted <- grep("mean|std", featureLabels[, featureNames], ignore.case = TRUE)
View(featureWanted)
measurements <- featureLables[featureWanted, featureNames]
measurements <- gsub('[()]', '', measurements)
str(measurements)

# Load Train data

train <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/train/X_train.txt")[, featureWanted, with = FALSE] 
         data.table::setnames(train, colnames(train), measurements)  
dim(train)
trainActivities <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/train/Y_train.txt",
                         col.names = c("Activity"))
dim(trainActivities)                              
View(trainActivities)
trainSubjects <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/train/subject_train.txt",
                       col.names = c("SubjectNum"))
dim(trainSubjects)
View(trainSubjects)                      
train <- cbind(train, trainActivities,trainSubjects)
View(train)
dim(train)

# Load test data
test <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/test/X_test.txt")[,featureWanted, with = FALSE]
            data.table::setnames(test,colnames(test),measurements)
 View(test) 
 dim(test)
testActivities <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/test/Y_test.txt",
                      col.names = c("Activity"))
dim(testActivities)
View(testActivities)
testSubjects <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/UCI HAR Dataset/test/subject_test.txt",
                   col.names = c("SubjectNum"))
dim(testSubjects)
View(testSubjects)

test <- cbind(test, testActivities,testSubjects)
View(test)
dim(test)

# merge  Train and Test data sets
mergeData <- rbind(train,test)
View(mergeData)
dim(mergeData)

#convert classLables to descriptive activityName
mergeData[["Activity"]] <- factor( mergeData[,Activity],
                                     levels = activityLabels[["classLabels"]],
                                     labels = activityLabels[["activityName"]])
View(mergeData)

mergeData[["SubjectNum"]] <- as.factor(mergeData[,SubjectNum])
View(mergeData)

# Create a second, independent tidy data set with the average of each variable for each activity and subject using Reshape2 package.

mergeData <- reshape2::melt(mergeData, id = c("SubjectNum", "Activity"))
View(mergeData)
dim(mergeData)
mergeData <- reshape2::dcast(mergeData, SubjectNum + Activity ~ variable, fun.aggregate = mean)
View(mergeData)
dim(mergeData)

tidydata <-write.table(x = mergeData, file = "tidyaData.txt", quote = FALSE, row.name = FALSE)
tidydata <- fread("C:/Users/nvarshney/Desktop/R programming/Coursera/tidyaData.txt")
View(tidydata)
dim(tidydata)
