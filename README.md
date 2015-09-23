---
title: "README"
author: "KoolWebDezign"
date: "September 20, 2015"
output: html_document
---

**OVERVIEW:**

This assignment is an integral component of the *Getting and Cleaning Data* course contained within the *Data Science Specialization* program offered by John Hopkins University at <https://www.coursera.org/specializations/jhudatascience>. I am an accomplished web developer and an aspiring data scientist enrolled in the complete Data Science Specialization program.  It is my vision to play an active roll in higher education administration such that we can improve higher education services that increase student engagement and success with their aducational goals. It is my pleasure to share my work here on GitHub. If I can be of any further assistance, I can be reached here via <http://github.com> or via my personal website at <http://koolwebdezign.com>.

**OBJECTIVES:**

The purpose of this project is to demonstrate my ability to collect and to clean a data set so that it can be used for analytical purposes. The goal is to prepare a **TIDY DATA** set that can be easily read and queried.

Within the objectives of this exercise, I will achieve the following:

1. a tidy data set as described below,

2. this Github repository contains a *run_analysis.R* script for performing the analysis, and 

3. a *CodeBook.md* file that describes the variables, the data, and any transformations or work that I performed to clean up the data.

**DATA SET INFORMATION:**

One of the most exciting areas in all of data science right now is wearable computing - see for example this link below:

<http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/> 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users of their latest wearable devices. The data linked to which I have linked above represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of this data is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here is the actual link to the data used for this project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

please note that my *run_analysis.R* program is configured to automatically retrieve this data from this URL, to then unzip this file for use, and to finally process this data in accordance with our stated objectives.

My R script called 'run_analysis.R' will accomplish the following. 

1a. Download and unzip the required data.  

1b. Assemble the training and the test data sets to create a single data set.
    
2. Extract only the measurements on the mean and standard deviation for each measurement. 

3. Use descriptive activity names to name the activities in the data set.  I have chosen here to **NOT** modify the names of these fields even though they have excessive characters and abbreviations.  I believe the documentation that is available from UCI properly documents the names of these variables and their intended use.  Because of the extensive length of the data (561 data columns), we programmatically change the column names with the use of the defined variable names.  To change these variable names as part of our TIDY DATA objectives breaks a "best practice" rule which encourages us not to change any data that may jeopardize our ability to manage this data by scripting language.  Changing these column names would put us at risk of being able to do further analysis on these fields because the name collection would have been modified.

4. Appropriately label the data set with descriptive variable names.  See comment #4 above. 

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

**R LIBRARIES DEPLOYED**

*DOWNLOADER* - Downloader was used to programmatically execute the download and unzip activities for the targeted data sets.

*DATA.TABLE* - 'data.table' is a useful library for executing several functions related to the management and arranging of table data.

*DPLYR* - This exciting library was used to complete Step 5 of the assignment.  Step 5 of this assignment asks us to execute the equivalent of a SQL query that selects the 'mean' and 'standard deviation' values for the given fields which requires the query to sort and group the data results as well.  With 'dplyr' we are able to 'Group by' and 'summarise'.  Excitingly enough, the 'summarise_each' function of 'dplyr' allows us to programatically instruct R to execute the analysis on all targeted 82 columns and this did require us to hand code the names of the columns.

**REPOSITORY INFORMATION - KOOLWEBDEZIGN**

*'data' folder* - please note that this folder contains a copy of the downloaded .zip file and the corresponding folder of the data as unzipped by my run_analysis.R program.

*full_data.csv* - This is the CSV output of the complete assembled data collection.  This data set has a total of 10299 observations of 563 variables.  This data collection has two foreign keys which are entitled subject_id and activty_id.  This allows a user of this data to query this data set for other analytical purposes.

*sub_data.csv* - This is the CSV output of the targeted sub-set of data as instructed per this project.  This subset is similar to the full_data.csv file yet it contains 10299 observations with 82 column variables.  This data set has the same two foreign keys as noted above, yet we have inserted the descriptive column named activity_type to describe the activity in a user-friendly format.

*summary_data.csv* - The summary data is a final sorted and summarized version of this data set.  This data collection contains 180 observations of 161 variables. Please see my CONCLUSIONS below for final observation comments related to this data set. 

*full_data.txt, sub_data.txt, and summary_data.txt* - These files are similar to the full_data.csv, sub_data.csv, and summary_data.csv files above.  These are output with the write.table output as instructed per this assignment.

**CONCLUSIONS**

This is a very standard exercise that simply asks us to take a collection of 8 tables, assemble them together by rows and columns, add descriptive information to the new table, and to then sort and analyze the data in accordance with a prescribed objective.

In the completion of this project we achieved the following:

1. Download and unzip files.

2. Read tables and setting new column names.

3. Combined tables by columns and then by rows.

4. We used 'merge' to execute the equivalent of a LEFT OUTER JOIN.  This step added descriptive labels to the activities that were contained within a separate data set.

5. We then sub-setted the data to select targeted columns.  We reduced the original table size from 561 data columns to 82.

6. We then changed the column order to move the three 'key' fields to the begging columns.  I changed the data sets so that 'subject_id', 'activity_id', and 'activity_type' were moved to the first three column positions.

7. Finally, we used dplyr to to execute the final grouping and the summarization of the data that was requested as part of this project.

8. My final "TIDY DATA" set results in a collection of 180 unique observations (rows) of the data, nicely sorted with a primary sort on the subject_id and then a secondary sort on the activity_id.  I then have 158 columns of data result, half of the columns are represent the calculation of the mean and the other half represent the calculation of the standard deviation of the collected data for each of the 30 persons completing an exercise of 6 activities each.  


Thank you for reviewing and sharing this work with me!


