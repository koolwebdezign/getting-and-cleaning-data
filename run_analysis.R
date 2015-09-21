# This program has been developed by KoolWebDezign as part of an assignment from the 
# 'Getting And Cleaning Data' course contained within the 'Data Science Specialization'
# offered by John Hopkins University on http://www.coursera.org.

# Please see the included README.md file for further background information on this
# assignment.  Please see also the CodeBook.md file for more information about the technical 
# details related to the development and use of this R programming script.

# Get raw data as directed within the assignment and store in local directory named '/data'
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

test <- require(downloader)
if (!test) {
    install.packages("downloader")
    require(downloader)
}

if (!file.exists("data")) {
    dir.create("data")
}

file_name_str <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
folder_name_str <- "data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset"
local_file_url <- paste("data/", file_name_str, sep="")

if (!file.exists( local_file_url )) {
    data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download(data_url, dest=local_file_url, mode="wb") 
    dir.create(folder_name_str)
    unzip (local_file_url, exdir=folder_name_str)
}



