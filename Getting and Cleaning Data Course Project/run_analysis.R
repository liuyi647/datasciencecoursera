runAnalysis <- function(){
    ## initialize local variables
    colNameActivityId <- "activityId"
    colNamePersonId <- "personId"
    
    ## prepare data
    # reading data
    xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
    yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
    personTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
    yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
    personTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    feature <- read.table('./UCI HAR Dataset/features.txt')
    
    activity = read.table('./UCI HAR Dataset/activity_labels.txt')
    
    # create column names
    colnames(xTrain) <- feature[,2] 
    colnames(yTrain) <- colNameActivityId
    colnames(personTrain) <- colNamePersonId
    
    colnames(xTest) <- feature[,2] 
    colnames(yTest) <- colNameActivityId
    colnames(personTest) <- colNamePersonId
    
    colnames(activity) <- c(colNameActivityId,'activityType')
    
    # merge all data
    allTrain <- cbind(yTrain, personTrain, xTrain)
    allTest <- cbind(yTest, personTest, xTest)
    allTrainAndTest <- rbind(allTrain, allTest)
    
    ## Extracting only the measurements on the mean 
    ## and standard deviation for each measurement
    colNames <- colnames(allTrainAndTest)
    meanStdIndicator <- (grepl(colNameActivityId, colNames) | 
                             grepl(colNamePersonId, colNames) | 
                             grepl("mean..", colNames) | 
                             grepl("std..", colNames) 
    )
    meanStdData <- allTrainAndTest[, meanStdIndicator == TRUE]
    
    ## Using descriptive activity names to name the activities
    meanStdDataWithActivityNames <- merge(meanStdData, activity,
                                          by = colNameActivityId,
                                          all.x=TRUE)
    
    ## Creating a second, independent tidy data set with 
    ## the average of each variable for each activity and each subject.
    tidyData <- aggregate(. ~personId + activityId + activityType, 
                          meanStdDataWithActivityNames, 
                          mean)
    
    tidyData <- tidyData[order(tidyData$personId, 
                               tidyData$activityId),]
    
    write.table(tidyData, "tidyData.txt", row.names = FALSE)
}








