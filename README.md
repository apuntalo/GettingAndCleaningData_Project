==================================================================
Getting and Cleaning Data Course Project
==================================================================
Nicolás Gómez Jaramillo
Getting and Cleaning Data Course
Johns Hopkins University - Coursera
Part of the Data Science Specialization
==================================================================

The origin of the data is  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and is related to a study, which can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data contains:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
======================================

To create this data set, only the variables representing mean and standard deviation was taken into account. With this reduction the number of variables passes from 561 to 68.

Additional to this selection, information about the subject and the activity are incorporated in the data set.

According to the description of the original data set, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

subject_Code: a number between 1 and 30 to identify the subject who performed the activity
activity_description: the description of the activity performed.

The final variables are the following, with these specific keys to understand their meanings: "t" to identify times signal and "f" to identify frequency signals; followed by the name of the variable captures; netx, mean or std to identify if it is related to a mean or a standard deviation; "X", "Y" or "Z" to identify the axis of the variable.

BodyAcc, GravityAcc, BodyAccJerk, BodyGyro, BodyGyroJerk, BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag, BodyAcc, BodyAccJerk, BodyGyro, BodyAccMag, BodyBodyAccJerkMag, BodyBodyGyroMag, BodyBodyGyroJerkMag

To obtain these values, first, we take the dataset mentioned above, which is composed of 5 files that contain the following information: 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The initial step is to merge the training and test data from the files 'train/X_train.txt' and 'test/X_test.txt' into a single data frame; then, from the features file ('features.txt'), the names of the variables stored in the training and test data are extracted and assigned as column names to the previously constructed data frame; then it is filtered to keep only the data corresponding to standard deviations (std) or mean (mean); later, the test 'test/subject_test.txt' and training data 'train/subject_train.txt' of the evaluated subjects are extracted and added to the dataframe . Finally, the means grouped by subject and activity are taken and stored in the file.
