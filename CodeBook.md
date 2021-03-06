# Code Book
This code book describes the variables, the data and transformations performed to clean up the data.

In the script run_analysis.R:
+	First, after importing all the variables and datasets, measurements are labelled with appropriate names derived from the _features_ vector. Training and test data are then merged to create a unique dataset
+	Only the measurements on mean and standard deviation for each measurement are extracted and the activity labels are added (to that end, columns whose names contain _mean_ or _std_ characters are extracted)
+	Finally, a second, independent tidy data set is created with the average of each variable for each activity and each subject (panel of 30 subjects and 6 possible activities)

#### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### Attribute Information
For each record in the dataset it is provided: 
+ Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
+ Triaxial Angular velocity from the gyroscope. 
+ A 561-feature vector with time and frequency domain variables. 
+ Its activity label. 
+ An identifier of the subject who carried out the experiment 

#### Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  

-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
+ tBodyAcc-XYZ
+ tGravityAcc-XYZ
+ tBodyAccJerk-XYZ
+ tBodyGyro-XYZ
+ tBodyGyroJerk-XYZ
+ tBodyAccMag
+ tGravityAccMag
+ tBodyAccJerkMag
+ tBodyGyroMag
+ tBodyGyroJerkMag
+ fBodyAcc-XYZ
+ fBodyAccJerk-XYZ
+ fBodyGyro-XYZ
+ fBodyAccMag
+ fBodyAccJerkMag
+ fBodyGyroMag
+ fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
+ `mean()`: Mean value
+ `std()`: Standard deviation
+ `mad()`: Median absolute deviation 
+ `max()`: Largest value in array
+ `min()`: Smallest value in array
+ `sma()`: Signal magnitude area
+ `energy()`: Energy measure. Sum of the squares divided by the number of values. 
+ `iqr()`: Interquartile range 
+ `entropy()`: Signal entropy
+ `arCoeff()`: Autorregresion coefficients with Burg order equal to 4
+ `correlation()`: correlation coefficient between two signals
+ `maxInds()`: index of the frequency component with largest magnitude
+ `meanFreq()`: Weighted average of the frequency components to obtain a mean frequency
+ `skewness()`: skewness of the frequency domain signal 
+ `kurtosis()`: kurtosis of the frequency domain signal 
+ `bandsEnergy()`: Energy of a frequency interval within the 64 bins of the FFT of each window.
+ `angle()`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
+ gravityMean
+ tBodyAccMean
+ tBodyAccJerkMean
+ tBodyGyroMean
+ tBodyGyro

#### Activity Labels
+	`WALKING`: value 1  
+	`WALKING_UPSTAIRS`: value 2  
+	`WALKING_DOWNSTAIRS`: value 3  
+	`SITTING`: value 4  
+	`STANDING`: value 5  
+	`LAYING`: value 6   
