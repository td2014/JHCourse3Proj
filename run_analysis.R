#
# run_analysis.R
#
# Script to perform processing for Coursera Data Science Class.
# Oct 24, 2014
#

#
# Clear workspace and do some setup.
#

rm(list = ls())
setwd("~/Desktop/OnlineCourses/JohnsHopkins_DataScienceTrack/DataScienceToolbox_Course3_GettingData/CourseProject")

#
# Step 1: Merges the training and the test sets to create one data set.
#

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")

#
# Label the columns of the training data with the names from the features.txt file
#

trainDataColumnNames <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
names(trainData) <- trainDataColumnNames$V2

#
# Now load the activity ID
#

trainDataActivityID <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
names(trainDataActivityID) <- c("ActivityID")

#
# Extract out the descriptive activity names and remap the ID to activity name.
# The "unlist" statement in the second line
# was required to convert the dataframe/list to a vector of 
# integers so the subscripting would work to convert to the descriptive names.
#

activityDescriptiveLabelList <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
# Create a new column that converts activityID to descriptive English name
trainDataActivityDescriptiveLabels <- activityDescriptiveLabelList$V2[unlist(trainDataActivityID)]

#
# Get subject ID for each record.
#

trainDataSubjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
names(trainDataSubjectID) <- c("SubjectID")

#
# Combine all the columns
#

trainData <- cbind(trainDataSubjectID,trainDataActivityID,
                   trainDataActivityDescriptiveLabels, trainData)

#
# Now add a flag to indicate this is training data.  This might be
# useful for future analysis (able to separate Test and Train data again).
#

dataType <- rep("Train",dim(trainData)[1])
names(dataType) <- c("DataType")
trainData <- cbind(dataType,trainData)
names(trainData)[4] <- c("DescriptiveLabels") # to have consistent name with test data below

#
# Now do similar processing for the TEST data.
#

testData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
names(testData) <- trainDataColumnNames$V2  # Same column names as for training data so reuse variable.

#
# Now load the activity IDs and remap to descriptive labels
# The "unlist" statement in the second line
# was required to convert the dataframe/list to a vector of 
# integers so the subscripting would work to convert to the descriptive names.
#

testDataActivityID <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")
names(testDataActivityID) <- c("ActivityID")
# Create column that converts ActivityID to descriptive English name.
testDataActivityDescriptiveLabels <- activityDescriptiveLabelList$V2[unlist(testDataActivityID)]

#
# Get subject ID for each record
#

testDataSubjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
names(testDataSubjectID) <- c("SubjectID")

#
#combine all the columns
#
testData <- cbind(testDataSubjectID,testDataActivityID,
                  testDataActivityDescriptiveLabels,testData)

#
# Now add a flag to indicate this is test data.  Might be useful to
# be able to separate training and test data in the future.
#

dataType <- rep("Test",dim(testData)[1])
names(dataType) <- c("DataType")
testData <- cbind(dataType,testData)
names(testData)[4] <- c("DescriptiveLabels") #Make this header name consistent with training data above.

#
# Fuse the training and test data sets.  I labeled everything already above
# and included a flag that indicates source of data (test or train).
#

finalData <- rbind(trainData,testData)

#
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# I will do this programmatically, by searching the column names for
# entries that include the tag "mean()" or "std()" as described in
# the file "features_info.txt" - part of the distribution.
#
# The list of feature names comes from "features.txt" which was loaded at the beginning of the 
# script into "trainDataColumnNames"
#

meanIndex <- grep("mean",trainDataColumnNames$V2) #indices with "mean()" in description
stdIndex <- grep("std",trainDataColumnNames$V2) #indices with "std()" in description

combinedExtraction <- c(meanIndex,stdIndex)  # list of column indices of means followed by std.

#We have to shift the combinedExtraction index by 4 to take into account the added four columns in our intermediate dataset.
finalData_MeanStd <- finalData[,c(1,2,3,4,combinedExtraction+4)]# preserve columns 1:4 and extract the mean&std deviation columns

#
# Step 3: Uses descriptive activity names to name the activities in the data set
# --> This step was done as part of Step1 (using the activityDescriptiveLabelList$V2)

#
# Step 4: Appropriately labels the data set with descriptive variable names. 
# --> This step was done as part of Step1 by loading in the defined variable names
# that were part of the data set (for example features.txt).
# In cases where a custom label was needed, it was added in Step 1 and indicated
# with comments there.
#

#
# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.
#

#
# Split over columns 2 & 3 (SubjectID and ActvityID)
#

finalDataSubSetRes <- split(finalData_MeanStd,finalData_MeanStd[,c(2,3)],drop=TRUE)

#
# Breakup the list into data frames, compute the
# means over each of the numeric columns, and reconstruct
# the final tidy data table for output.
#

sumTotal <- rep(NA,dim(finalData_MeanStd)[2])  # Set up accumulator row.
names(sumTotal) <- names(finalData_MeanStd)

#
# Loop over each item in the list.
#
for (iEntry in 1:length(finalDataSubSetRes)){ 
        currStatsDF <- as.data.frame(finalDataSubSetRes[iEntry]) # Break list into data frames
        newRes <- colMeans(currStatsDF[5:dim(currStatsDF)[2]])
        # construct a row of the tidy dataset.  Add in the test/train flag, SubjectID, ActivityID, ActivityLabel, computed means vector-"newRes".
        sumRes <- c(as.character(currStatsDF[1,1]),currStatsDF[1,2],currStatsDF[1,3],as.character(currStatsDF[1,4]),newRes)
        names(sumRes) <- names(finalData_MeanStd)  # add consistent/standard labels
        # add to master table we are accumulating for output
        sumTotal <- rbind(sumTotal,sumRes)
} 
sumTotal <- sumTotal[-1,-1]  #clobber first row & first column (don't need them for output)
#
# Write file out for uploading to coursera.
#
outFileName <- "./Step5_tidyData.txt"
write.table(sumTotal,file=outFileName,row.names=FALSE, quote=FALSE)

#
# End of script
#
