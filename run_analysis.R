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

# Clean up workspace
rm(list=ls())

# Initialize user controlled variables
user_folder <- "data"

# Initialize critical program variables
file_name_str <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
local_folder_name <- paste(user_folder, "/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset", sep="")
local_file_name <- paste(user_folder, "/", file_name_str, sep="")

# Test for existence of user_folder.  Download data if data is missiing.
if (!file.exists(user_folder)) {
    dir.create(user_folder)
    
    # The 'downloader' library is required for execution of this program
    test <- require(downloader)
    if (!test) {
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

# Set new working directory
home_wd <- getwd()
new_wd <- paste(local_folder_name, "/", "UCI HAR Dataset", sep="")
setwd(new_wd)

# Read in the data from files
features     = read.table('./features.txt',header=FALSE); #imports features.txt
activityType = read.table('./activity_labels.txt',header=FALSE); #imports activity_labels.txt

subjectTrain = read.table('./train/subject_train.txt',header=FALSE); #imports subject_train.txt
xTrain       = read.table('./train/x_train.txt',header=FALSE); #imports x_train.txt
yTrain       = read.table('./train/y_train.txt',header=FALSE); #imports y_train.txt

subjectTest = read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
xTest       = read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
yTest       = read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt


# Assigin column names to the data imported above
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";






# Set working directory back to original setting
setwd(home_wd)

