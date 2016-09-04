# Part 0-sourcing,reading and formating data sets

  ## Source appropriate libraries used in this assignment
    library(data.table)
    library(dplyr)

  ## Read the supporting metadata 
    featureNames <- read.table("UCI HAR Dataset/features.txt")
    activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

  ## Format the test data and training sets-- both are split up into subject, activity and features
    ##Training data
      subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
      activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
      featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

  ## Test data
    subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
    activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
    featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

# Part 1. Merges the training and the test sets to create one data set.
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

  ## naming the coloumns
    colnames(features) <- t(featureNames[2])

  ## merging the data
    colnames(activity) <- "Activity"
    colnames(subject) <- "Subject"
    completeData <- cbind(features,activity,subject)

# Part 2. Extracts only the measurements on the mean and standard deviation for each measurement
  ## extracting cols that have std or mean
    columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
  
  ##adding activity and subject cols to the list  & verifying dims
    requiredColumns <- c(columnsWithMeanSTD, 562, 563)
    requiredColumns <- c(columnsWithMeanSTD, 562, 563)
    dim(completeData)

# Part 3. Uses descriptive activity names to name the activities in the data set.
    extractedData$Activity <- as.character(extractedData$Activity)
    for (i in 1:6){
      extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
    }
    ## factor in the activity variable
    extractedData$Activity <- as.factor(extractedData$Activity)
    
# Part 4 Appropriately labels the data set with descriptive activity names
    names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
    names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
    names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
    names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
    names(extractedData)<-gsub("^t", "Time", names(extractedData))
    names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
    names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
    names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
    names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
    names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
    names(extractedData)<-gsub("angle", "Angle", names(extractedData))
    names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

# Part 5 Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject
    extractedData$Subject <- as.factor(extractedData$Subject)
    extractedData <- data.table(extractedData)
    tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
    tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
    write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
    
    