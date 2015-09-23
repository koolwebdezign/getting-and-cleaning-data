---
title: "CodeBook"
author: "KoolWebDezign"
date: "September 20, 2015"
output: html_document
---

**COMPUTER PLATFORM:**

* Operating Platform: Windows 7 Professional, Service Pack 1  
* Microprocessor: Intel Core i3-2100 CPU @ 3.10 GHz  
* RAM: 8.0 GB  
* System: 64-bit Operating System  

**R PLATFORM**

* R version 3.2.2 (2015-08-14) -- "Fire Safety"  
* Copyright (C) 2015 The R Foundation for Statistical Computing  
* Platform: x86_64-w64-mingw32/x64 (64-bit)  
* R Studio: Version 0.99.467

**DATA INFORMATION**

Please note that the data used in this exercise was obtained at the following URL location <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> on the date indicated above inside the title block.  

A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

It is important to document the date of execution of this program since data can change over time.  Future results with the use of this program can vary if the remote data was updated or changed for any reason.

**USER INSTRUCTIONS**

A user of this program can control the desired location of the data to be downloaded by this program. At the top of this program is a section commented with as follows:
```
# Initialize user controlled variables
user_folder <- "data"

```
Use this section to define your desired data folder location.  Please note that this location will be *relative* to your current working directory set within your *R Programming* environment.

**DEPENDENT R PACKAGES**

*Downloader* - The 'downloader' package was chosen for the execution of the downloading and the unzipping of the data targeted by this exercise.  This program will check for the existence of a local folder (inside the current working directory) named by the user.  The program will not execute if this folder exists.  So a user of this program should be sure that the user data folder does not exist before executing this program.

*DATA.TABLE* - 'data.table' is a useful library for executing several functions related to the management and arranging of table data.

*DPLYR* - This exciting library was used to complete Step 5 of the assignment.  Step 5 of this assignment asks us to execute the equivalent of a SQL query that selects the 'mean' and 'standard deviation' values for the given fields which requires the query to sort and group the data results as well.  With 'dplyr' we are able to 'Group by' and 'summarise'.  Excitingly enough, the 'summarise_each' function of 'dplyr' allows us to programatically instruct R to execute the analysis on all targeted 82 columns and this did require us to hand code the names of the columns.

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

**OTHER INFORMATION**

1. Please be sure to read further instructions included within the README.md file included within this repository.

2. If I can be of further assistance, please feel free to contact me via my website at <http://koolwebdezign.com/>.


