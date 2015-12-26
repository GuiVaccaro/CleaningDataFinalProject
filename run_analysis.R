## RUN_ANALYSIS

## (c) Guilherme Vaccaro
## For Coursera's Getting and Cleaning Data Module 
## 2015-12-26

## General tokens and requirements

testMode <- FALSE

if( testMode ) {
    rowsToRead <- 10
} else {
    rowsToRead <- -1    
}

require(data.table)

mainDir <- "/Users/vaccaro/Dropbox/Coursera/Data Science Toolbox/Getting and Cleaning Data/Project"
workDir <- "/Users/vaccaro/Dropbox/Coursera/Data Science Toolbox/Getting and Cleaning Data/Project/UCI HAR Dataset"
workDirTrain <- "/Users/vaccaro/Dropbox/Coursera/Data Science Toolbox/Getting and Cleaning Data/Project/UCI HAR Dataset/train"
workDirTest  <- "/Users/vaccaro/Dropbox/Coursera/Data Science Toolbox/Getting and Cleaning Data/Project/UCI HAR Dataset/test"

## Read labels as characters

setwd(workDir)

labels.Features <- read.csv(file = "features.txt", sep = " ", header = FALSE, as.is = TRUE)[,2]
labels.Activities <- read.csv(file = "activity_labels.txt", sep = " ", header = FALSE, as.is = TRUE)[,2]

labels.All <- c(
    "Subject",
    "Activity",
    labels.Features
)

labels.Selected <- c(
    "Subject",
    "Activity",
    labels.Features[ (labels.Features %like% "mean") | (labels.Features %like% "std") ]
)

## Merge the training and the test sets to create one data set.
## Appropriately label the data set with descriptive variable names. 
## Use descriptive activity names to name the activities in the data set

setwd(workDirTrain)

dt.train <- data.table( 
    read.csv(file = "subject_train.txt", header = FALSE, nrows = rowsToRead),
    read.csv(file = "Y_train.txt", header = FALSE, nrows = rowsToRead),
    read.fwf(file = "X_train.txt", widths = rep(16,561), header = FALSE, n = rowsToRead)
)
names(dt.train) <- labels.All
dt.train$Activity <- labels.Activities[dt.train$Activity]

setwd(workDirTest)

dt.test <- data.table( 
    read.csv(file = "subject_test.txt", header = FALSE, nrows = rowsToRead),
    read.csv(file = "Y_test.txt", header = FALSE, nrows = rowsToRead),
    read.fwf(file = "X_test.txt", widths = rep(16,561), header = FALSE, n = rowsToRead)
)

names(dt.test) <- labels.All
dt.test$Activity <- labels.Activities[dt.test$Activity]

dt.merge <- rbindlist(list(dt.train,dt.test), use.names = TRUE)

## Extract only the measurements on the mean and standard deviation for each measurement. 

dt.filtered <- dt.merge[, c(labels.Selected), with = FALSE]

## From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

dt.means <- dt.filtered[, lapply(.SD, mean), by = c("Activity","Subject")]

## Save files

setwd(mainDir)
write.table(dt.filtered, file = "data_selected.txt", sep = ",", row.names = FALSE)
write.table(dt.means, file = "data_selected_means.txt", sep = ",", row.names = FALSE)
