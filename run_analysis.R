# Get Data
# Download the data in the current working directory

library(data.table)
filepath = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('.\\UCI HAR Dataset.zip')){
  download.file(filepath,'.\\UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}


# Read the data set and merge into a single data frame
# Import the features
features <- read.csv( '.\\UCI HAR Dataset\\features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

# Train Data

# Import train data set
train_data_x <- read.table('.\\UCI HAR Dataset\\train\\X_train.txt', header=FALSE)

# Import the activity labels
train_activity <- read.csv('.\\UCI HAR Dataset\\train\\y_train.txt', header=FALSE)

# Import the subject labels
train_subject <- read.csv('.\\UCI HAR Dataset\\train\\subject_train.txt', header=FALSE)

# Merge into data frame train_dataset
train_dataset <- data.frame(train_subject, train_activity, train_data_x)
names(train_dataset) <- c(c('subject', 'activity'), features)
# head(train_dataset)

# Test Data

# Import test data set
test_data_x <- read.table('.\\UCI HAR Dataset\\test\\X_test.txt', header=FALSE)

# Import the activity labels
test_activity <- read.csv('.\\UCI HAR Dataset\\test\\y_test.txt', header=FALSE)

# Import the subject labels
test_subject <- read.csv('.\\UCI HAR Dataset\\test\\subject_test.txt', header=FALSE)

# Merge into data frame test_dataset
test_dataset <- data.frame(test_subject, test_activity, test_data_x)
names(test_dataset) <- c(c('subject', 'activity'), features)
# head(test_dataset)

# Merge train_data and test_data data_full
data_full <- rbind(train_dataset, test_dataset)

