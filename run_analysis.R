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


