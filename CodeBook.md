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

Please note that the data used in this exercise was obtained at the following URL location <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> on the date indicated above inside the title block.  It is important to document the date of execution of this program since data can change over time.  Future results with the use of this program can vary if the remote data was updated or changed for any reason.

**USER INSTRUCTIONS**

A user of this program can control the desired location of the data to be downloaded by this program. At the top of this program is a section commented with as follows:
```
# Initialize user controlled variables
user_folder <- "data"

```
Use this section to define your desired data folder location.  Please note that this location will be *relative* to your current working directory set within your *R Programming* environment.

**DEPENDENT R PACKAGES**

*Downloader* - The 'downloader' package was chosen for the execution of the downloading and the unzipping of the data targeted by this exercise.  This program will check for the existence of a local folder (inside the current working directory) named by the user.  The program will not execute if this folder exists.  So a user of this program should be sure that the user data folder does not exist before executing this program.







