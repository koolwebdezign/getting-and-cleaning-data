# This program has been developed by KoolWebDezign as part of an assignment from the 
# 'Getting And Cleaning Data' course contained within the 'Data Science Specialization'
# offered by John Hopkins University on http://www.coursera.org.

# Please see the included README.md file for further background information on this
# assignment.  Please see also the CodeBook.md file for more information about the technical 
# details related to the development and use of this R programming script.

# Get raw data as directed within the assignment and store in local directory named 'data' 
# or other folder as controlled by the user_folder variable defined below.  The target data
# file is located on the internet at the following location.
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Clear your workspace from active variables
rm(list=ls())

# Initialize user controlled variables
user_folder <- "data"

# Initialize critical program variables
file_name_str <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
local_folder_name <- paste(user_folder, "/getdata-projectfiles-UCI-HAR-Dataset", sep="")
local_file_name <- paste(user_folder, "/", file_name_str, sep="")

# Test for existence of user_folder.  Download data if data is missiing.
if (!file.exists(user_folder)) {
    dir.create(user_folder)
    
    # The 'downloader' library is required for execution of this program
    test_downloader <- require(downloader)
    if (!test_downloader) {
        install.packages("downloader")
        require(downloader)
    }
    
    # Download the data
    data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download(data_url, dest=local_file_name, mode="wb") 
    
    # Unzip the downloaded files
    dir.create(local_folder_name)
    unzip (local_file_name, exdir=local_folder_name)
}

# The 'data.table' library is required for execution of this program
test_data_table <- require(data.table)
if (!test_data_table) {
    install.packages("data.table")
    require(data.table)
}

# Save current working directory for return at end of program
home_wd <- getwd()

# Set new working directory
new_wd <- paste(local_folder_name, "/", "UCI HAR Dataset", sep="")
setwd(new_wd)

# Read data from downloaded files
features = read.table('./features.txt', header=FALSE)
activity_labels = read.table('./activity_labels.txt', header=FALSE)

subject_test = read.table('./test/subject_test.txt', header=FALSE)
x_test = read.table('./test/x_test.txt', header=FALSE)
y_test = read.table('./test/y_test.txt', header=FALSE)

subject_train = read.table('./train/subject_train.txt', header=FALSE)
x_train = read.table('./train/x_train.txt', header=FALSE)
y_train = read.table('./train/y_train.txt', header=FALSE)

# Set working directory back to original setting
setwd(home_wd)

# Assign column names to the new R tables
colnames(features) = c('feature_id','feature_type')
colnames(activity_labels) = c('activity_id','activity_type')

colnames(subject_test) = "subject_id"
colnames(x_test) = features[,2] 
colnames(y_test) = "activity_id"

colnames(subject_train) = "subject_id"
colnames(x_train) = features[,2] 
colnames(y_train) = "activity_id"

# Create new 'test' and 'training' tables by binding the data 
# from our read files (use cbind - column bind)
test_data = cbind(subject_test, y_test, x_test)
train_data = cbind(subject_train, y_train, x_train)

# Concatenate the new 'test' and 'training' tables above into 
# a single table (use rbind - rowbind)
full_data = rbind(test_data, train_data)

# Merge the 'full_data' set with the 'activity_labels' table
# to include descriptive activity names (equivalent to LEFT OUTER JOIN)
final_data = merge(full_data, activity_labels, by='activity_id', all.x=TRUE)

# Extract sub-set of data such that we extract only the measurements
# on the mean and standard deviation for each measurement
sub_data = final_data[ grepl("subject|activity|mean|std", names(final_data)) ]

# Change column order to make data more readable by the table 'key' fields
# The 'keys' on this table are the 'subject_id' and the 'activity_id'.
# We've added the 'activity_type' field with a table JOIN and I now want
# these three columns in the beginning of the tables
# Move 'activity_type' to the first column of 'sub_data' table
sub_data <- setcolorder(sub_data, c("activity_type", setdiff(names(sub_data), "activity_type")))
# Move 'activity_id' to the first column (now in front of 'activity_type')
sub_data <- setcolorder(sub_data, c("activity_id", setdiff(names(sub_data), "activity_id")))
# Move 'subject_id' to the first column (now in front of 'activity_id')
sub_data <- setcolorder(sub_data, c("subject_id", setdiff(names(sub_data), "subject_id")))

# Sort the view of the 'sub_data' file and order by 'subject_id' and 'activity_id'
sub_data <- arrange(sub_data, subject_id, activity_id)

# Output full data table for future reference
write.csv(full_data, file="full_data.csv", row.names=FALSE)
write.table(full_data, file="full_data.txt", row.names=FALSE)

# Output tidy data files to CSV files
write.csv(sub_data, file="sub_data.csv", row.names=FALSE)

# Output tidy data files to TXT files (as instructed by professor)
write.table(sub_data, file="sub_data.txt", row.names=FALSE)

# The 'dplyr' library is required to execute the final step in this assignment
# We are being asked to execute the equivalent of a SQL query that obtains the 
# mean and standard deviation of all of the variables with the data set
# grouped by 'subject_id' and 'activity_id'.
test_dplyr <- require(dplyr)
if (!test_dplyr) {
    install.packages("dplyr")
    require(dplyr)
}
summary_data <- sub_data %>%
    group_by(subject_id, activity_id, activity_type) %>%
    summarise_each(funs(mean, sd))

# Now output the summary_data to a CSV file as well as a TEXT file
write.csv(summary_data, file="summary_data.csv", row.names=FALSE)
write.table(summary_data, file="summary_data.txt", row.names=FALSE)

# Clear your workspace from active variables
# This step is optional yet it clears memory intensive information
rm(list=ls())

