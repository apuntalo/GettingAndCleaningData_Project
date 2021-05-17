library(dplyr)

## Step 1. Merges the training and the test sets to create one data set.
## Collect all measures in one table
X_trainData <- read.table("./data/train/X_train.txt")
X_testData <- read.table("./data/test/X_test.txt")
totalData <- rbind(X_trainData, X_testData)

## Step 4. Appropriately labels the data set with descriptive variable names.
featuresData <- read.table("./data/features.txt")
## Assign the names obtained from features to the data table
colnames(totalData) <- featuresData[,2]
names(totalData) <- gsub("[()]","",names(totalData))
names(totalData) <- gsub("[-]","_",names(totalData))

## Step 2. Extracts only the measurements on the mean and standard deviation for
## each measurement. 
totalFilterd <- totalData[,grepl("(mean|std)\\(\\)", featuresData[,2])]

## Step 3. Uses descriptive activity names to name the activities in the data set
## Extract data from all the activity labels
activity_labels <- read.table("./data/activity_labels.txt")
## Collect all data of the activities in train and test tables in one table
y_trainData <- read.table("./data/train/y_train.txt")
y_testData <- read.table("./data/test/y_test.txt")
totalActivities_Data <- rbind(y_trainData, y_testData)
## Merge all activity data with their descriptions
activity_Data = merge(totalActivities_Data, activity_labels)
names(activity_Data) <- c("activity_code", "activity_description")

## Create a data frame with descriptions and data measured
total <- cbind(activity_Data[2], totalFilterd)

## Step 5. From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

## Collect all data of the subjects in train and test tables in one table
subject_trainData <- read.table("./data/train/subject_train.txt")
subject_testData <- read.table("./data/test/subject_test.txt")
subject_Data <- rbind(subject_trainData, subject_testData)
names(subject_Data) <- c("subject_Code")

final <- cbind(subject_Data, total)
final <- final %>% 
    group_by(subject_Code, activity_description) %>% 
    summarise_at(vars(tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std), list(mean = mean))
write.table(final, file = "Final.txt", row.names = FALSE)