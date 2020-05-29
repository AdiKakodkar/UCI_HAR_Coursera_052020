#Code Book for Human Activity Recognition Using Smartphones Dataset: Tidy Data Exercise (Version 1.0)
==================================================================

##Introduction
================
Data for this experiment was obtained from readings of accelerometer and gyroscope of a smartphone. More information about the exact protocols for measuring raw data can be found in the 'features_info.txt' file provided along with the raw data.

##Variables
=============
There were 561 variables in the original dataset. These were reduced by choosing only the mean and the standard deviation variables. This subsetting resulted in 66 variables. There were two variables (columns) added to the dataset i.e. Subjects and Activity. Both Subjects and Activity variables were obtained from separate datasets. 

In the final dataset there are 68 variables. Some of the variables have a prefix 't' which represents the measurements were from time domain signals or a prefix 'f' which represents that the measurements were from a frequency domain signal. Some variables have -X or -Y or -Z as the last characters. These represent the directions/axial signals in which the variable was measured.

Body refers to the subject's physical body whose acceleration and orientation was measured using the accelerometer and gyrometer sensors inside the smartphone.

Following are the substitutions made to the original variable names (on the left of the arrow) to improve readibility

1. -std() -> StdDeviation
2. -mean() -> Mean
3. Acc -> Acceleration
4. Gyro -> Orientation
5. Mag -> Magnitude


Following is a list of the variables in the final dataset and their type in brackets
 [1] "Subjects" (Int)                                     
 [2] "Activity"  (Chr)                                   
 [3] "tBodyAccelerationMean-X" (num)                     
 [4] "tBodyAccelerationMean-Y" (num)                      
 [5] "tBodyAccelerationMean-Z" (num)                      
 [6] "tGravityAccelerationMean-X" (num)                   
 [7] "tGravityAccelerationMean-Y" (num)                   
 [8] "tGravityAccelerationMean-Z" (num)                   
 [9] "tBodyAccelerationJerkMean-X" (num)                  
[10] "tBodyAccelerationJerkMean-Y" (num)                  
[11] "tBodyAccelerationJerkMean-Z" (num)                  
[12] "tBodyOrientationMean-X"    (num)                    
[13] "tBodyOrientationMean-Y"   (num)                     
[14] "tBodyOrientationMean-Z"    (num)                    
[15] "tBodyOrientationJerkMean-X"  (num)                  
[16] "tBodyOrientationJerkMean-Y"  (num)                  
[17] "tBodyOrientationJerkMean-Z"  (num)                  
[18] "tBodyAccelerationMagnitudeMean"  (num)              
[19] "tGravityAccelerationMagnitudeMean"     (num)        
[20] "tBodyAccelerationJerkMagnitudeMean"  (num)          
[21] "tBodyOrientationMagnitudeMean"     (num)            
[22] "tBodyOrientationJerkMagnitudeMean" (num)            
[23] "fBodyAccelerationMean-X"  (num)                
[24] "fBodyAccelerationMean-Y"  (num)                     
[25] "fBodyAccelerationMean-Z"  (num)                     
[26] "fBodyAccelerationJerkMean-X"  (num)                 
[27] "fBodyAccelerationJerkMean-Y"  (num)                 
[28] "fBodyAccelerationJerkMean-Z"  (num)                 
[29] "fBodyOrientationMean-X"  (num)                      
[30] "fBodyOrientationMean-Y" (num)                       
[31] "fBodyOrientationMean-Z"  (num)                      
[32] "fBodyAccelerationMagnitudeMean"  (num)            
[33] "fBodyBodyAccelerationJerkMagnitudeMean"  (num)      
[34] "fBodyBodyOrientationMagnitudeMean"  (num)           
[35] "fBodyBodyOrientationJerkMagnitudeMean"  (num)       
[36] "tBodyAccelerationStdDeviation-X"  (num)             
[37] "tBodyAccelerationStdDeviation-Y"  (num)             
[38] "tBodyAccelerationStdDeviation-Z"   (num)            
[39] "tGravityAccelerationStdDeviation-X" (num)
[40] "tGravityAccelerationStdDeviation-Y"   (num)         
[41] "tGravityAccelerationStdDeviation-Z"   (num)         
[42] "tBodyAccelerationJerkStdDeviation-X"  (num)         
[43] "tBodyAccelerationJerkStdDeviation-Y"  (num)         
[44] "tBodyAccelerationJerkStdDeviation-Z"  (num)         
[45] "tBodyOrientationStdDeviation-X"   (num)             
[46] "tBodyOrientationStdDeviation-Y"   (num)             
[47] "tBodyOrientationStdDeviation-Z"   (num)             
[48] "tBodyOrientationJerkStdDeviation-X"  (num)          
[49] "tBodyOrientationJerkStdDeviation-Y"  (num)          
[50] "tBodyOrientationJerkStdDeviation-Z"   (num)         
[51] "tBodyAccelerationMagnitudeStdDeviation" (num)       
[52] "tGravityAccelerationMagnitudeStdDeviation"  (num)   
[53] "tBodyAccelerationJerkMagnitudeStdDeviation"  (num)  
[54] "tBodyOrientationMagnitudeStdDeviation"  (num)       
[55] "tBodyOrientationJerkMagnitudeStdDeviation" (num)    
[56] "fBodyAccelerationStdDeviation-X"  (num)             
[57] "fBodyAccelerationStdDeviation-Y"  (num)             
[58] "fBodyAccelerationStdDeviation-Z" (num)
[59] "fBodyAccelerationJerkStdDeviation-X" (num)          
[60] "fBodyAccelerationJerkStdDeviation-Y" (num)          
[61] "fBodyAccelerationJerkStdDeviation-Z"  (num)         
[62] "fBodyOrientationStdDeviation-X"  (num)              
[63] "fBodyOrientationStdDeviation-Y"  (num)              
[64] "fBodyOrientationStdDeviation-Z"   (num)             
[65] "fBodyAccelerationMagnitudeStdDeviation"  (num)      
[66] "fBodyBodyAccelerationJerkMagnitudeStdDeviation" (num)
[67] "fBodyBodyOrientationMagnitudeStdDeviation"     (num)
[68] "fBodyBodyOrientationJerkMagnitudeStdDeviation" (num)


##Summary Choice
==================
The original data was matched with the subjects who participated in the study and the acitvities performed by them. The original dataset contained 10299 activity measurements from 30 subjcts. To simplify the data it was decided to select only the variables which measure the mean and the standard deviation. These were further grouped by activities and  each subject and only the average of each variable was included per row in the final tidy dataset. Each row in the final dataset represents a activity related average measurements of a subject. e.g. as follows
                
                        Subject         Activity        Var1       Var2         Var3        Var....
                          1             WALKING         1.234545    -0.234521   -0.444588   

The final dataset contains 180 measurements i.e. 30 subjects performing 6 activities each and 68 variables. 


##Study Design
================
The data was obtained from UCI machine learning repository. It was mainly divided into divided into two parts first was test set which contained about 30% of the subjects and the second one was the train set which contained 70% of the subjects.
 Following steps were applied to the raw data to create the tidy dataset
*     Train and test sets were combined in to one dataset. This dataset contained 10299 measurements and 561 variables
*     A subset of the combined dataset was created using the measurements for mean and standard deviation. This reduced the number of variables to 66
*     Activities data was obtained for both test and train sets and combined in to a separate dataset. The acitvities were further labelled according to the key provided. This was then added to the dataset created in step above.
*     Variables in the dataset were labelled to make them more human readable. Complete list of changes to the variable names are listed in the 'Variables' section above.
*     A separate tidy dataset was created from the resulting set in step-4  with averages of each variable for each subject and for each activity. Please refer to the section 'Summary Choice' above for more details.
 