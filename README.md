The script "run_analysis.R" is designed to process the data sets for the
smartphone motion data provided for the Data Science course.

It does the following:  

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in steps 1-4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Write out this final data set to a .txt file ("Step5_tidyData.txt").

In particular, please note the following:  
The training and test data we extract are based on the derived (processed) data files X_train.txt and X_test.txt, and not the original raw motion data.

The extraction (item 2 above) of mean and standard deviation was performned programmatically based on the name of the column having either "mean" or "std" in the title.  It is assumed that this tagging is consistent (based on a review of the documentation provided with the data set - see feature_info.txt for details)

In item 5, resulting tidy data set outputs the mean results for each of the variables
without changing the column name.  The column value should be interpreted as being
"the mean of"" the variable in a given column.

The run_analysis.R script is fairly well documented (both in terms of explicit variable names and comments) which describe the processing steps in greater detail.

