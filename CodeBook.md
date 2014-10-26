This file is the CodeBook and describes the data in the tidy data set.

Excerpt taken from the provided documentation about the experiment (See README.txt for further details):

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."

====
For the purposes of the tidy data set, I extracted only those features that contained either the word "mean" or "std" is their description.  These variables refer to the mean ("mean") or standard deviation ("std") of underlying feature.   The list is as follows:

 [1] "SubjectID":  Integer
 This is the ID code of the subject wearing the smartphone in the experiment.
 Range 1-30.
 
 [2] "ActivityID":  Integer
 This is the ID code of the activity being performed by the subject.  
 1 WALKING  
 2 WALKING_UPSTAIRS  
 3 WALKING_DOWNSTAIRS  
 4 SITTING  
 5 STANDING  
 6 LAYING  
 
 [3] "DescriptiveLabels":  Factor/Character String
 This is the activity label (in English) corresponding to the ActivityID.
 Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
The remaining variables are described in more detail in the file "features_info.txt"
However, it should be noted that each of these numerical features have been normalized to the range of [-1,1] and are thus unitless.  It should be noted that the results in the tidy data set are the means of each of the below quantities, for each combination of SubjectID and ActivityID.  This list is as follows:
 
 [4] "tBodyAcc-mean()-X"              
 [5] "tBodyAcc-mean()-Y"              
 [6] "tBodyAcc-mean()-Z"              
 [7] "tGravityAcc-mean()-X"           
 [8] "tGravityAcc-mean()-Y"           
 [9] "tGravityAcc-mean()-Z"           
[10] "tBodyAccJerk-mean()-X"          
[11] "tBodyAccJerk-mean()-Y"          
[12] "tBodyAccJerk-mean()-Z"          
[13] "tBodyGyro-mean()-X"             
[14] "tBodyGyro-mean()-Y"             
[15] "tBodyGyro-mean()-Z"             
[16] "tBodyGyroJerk-mean()-X"         
[17] "tBodyGyroJerk-mean()-Y"         
[18] "tBodyGyroJerk-mean()-Z"         
[19] "tBodyAccMag-mean()"             
[20] "tGravityAccMag-mean()"          
[21] "tBodyAccJerkMag-mean()"         
[22] "tBodyGyroMag-mean()"            
[23] "tBodyGyroJerkMag-mean()"        
[24] "fBodyAcc-mean()-X"              
[25] "fBodyAcc-mean()-Y"              
[26] "fBodyAcc-mean()-Z"              
[27] "fBodyAcc-meanFreq()-X"          
[28] "fBodyAcc-meanFreq()-Y"          
[29] "fBodyAcc-meanFreq()-Z"          
[30] "fBodyAccJerk-mean()-X"          
[31] "fBodyAccJerk-mean()-Y"          
[32] "fBodyAccJerk-mean()-Z"          
[33] "fBodyAccJerk-meanFreq()-X"      
[34] "fBodyAccJerk-meanFreq()-Y"      
[35] "fBodyAccJerk-meanFreq()-Z"      
[36] "fBodyGyro-mean()-X"             
[37] "fBodyGyro-mean()-Y"             
[38] "fBodyGyro-mean()-Z"             
[39] "fBodyGyro-meanFreq()-X"         
[40] "fBodyGyro-meanFreq()-Y"         
[41] "fBodyGyro-meanFreq()-Z"         
[42] "fBodyAccMag-mean()"             
[43] "fBodyAccMag-meanFreq()"         
[44] "fBodyBodyAccJerkMag-mean()"     
[45] "fBodyBodyAccJerkMag-meanFreq()" 
[46] "fBodyBodyGyroMag-mean()"        
[47] "fBodyBodyGyroMag-meanFreq()"    
[48] "fBodyBodyGyroJerkMag-mean()"    
[49] "fBodyBodyGyroJerkMag-meanFreq()"
[50] "tBodyAcc-std()-X"               
[51] "tBodyAcc-std()-Y"               
[52] "tBodyAcc-std()-Z"               
[53] "tGravityAcc-std()-X"            
[54] "tGravityAcc-std()-Y"            
[55] "tGravityAcc-std()-Z"            
[56] "tBodyAccJerk-std()-X"           
[57] "tBodyAccJerk-std()-Y"           
[58] "tBodyAccJerk-std()-Z"           
[59] "tBodyGyro-std()-X"              
[60] "tBodyGyro-std()-Y"              
[61] "tBodyGyro-std()-Z"              
[62] "tBodyGyroJerk-std()-X"          
[63] "tBodyGyroJerk-std()-Y"          
[64] "tBodyGyroJerk-std()-Z"          
[65] "tBodyAccMag-std()"              
[66] "tGravityAccMag-std()"           
[67] "tBodyAccJerkMag-std()"          
[68] "tBodyGyroMag-std()"             
[69] "tBodyGyroJerkMag-std()"         
[70] "fBodyAcc-std()-X"               
[71] "fBodyAcc-std()-Y"               
[72] "fBodyAcc-std()-Z"               
[73] "fBodyAccJerk-std()-X"           
[74] "fBodyAccJerk-std()-Y"           
[75] "fBodyAccJerk-std()-Z"           
[76] "fBodyGyro-std()-X"              
[77] "fBodyGyro-std()-Y"              
[78] "fBodyGyro-std()-Z"              
[79] "fBodyAccMag-std()"              
[80] "fBodyBodyAccJerkMag-std()"      
[81] "fBodyBodyGyroMag-std()"         
[82] "fBodyBodyGyroJerkMag-std()" 