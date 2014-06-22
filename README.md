getdata_004_course_project1
===========================
Repository of *Course Project no 1* in the Coursera Course June 2014, *Getting and Cleaning Data*.

## Content of Repository
The repository holds:
* *README.md* - This file 
* *CodeBook.md* - The code book decribing the output *myTidyDataTable*
* *run_analysis.R* - Analysis script for loading, merging, averaging and saving data.                      
* *UCI HAR Dataset* - Directory to store the input data files in

## How to
1. Install package reshape2
2. Set the working directory to the directory of this R-script, *setwd("\<YOUR PATH\>/getdata_004_course_project1")*
3. Download data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the data set into *./UCI HAR Dataset*
4. Run analysis by sourcing the code, *source("./run_analysis.R")*
5. To read table into R, **tidyTableRead<- read.table(file = "myTidyDataTable.txt")**

## Analysis

1. Read activity and feature labels
2. Read test set activities, subjects and feature data. 
3. Drop other features than those containing *mean()* and *std()*
4. Repeat 2. and 3. for the train set
5. Merged data sets into one
6. Reshape, average features for each combination of (subject X activity) and save data
7. Save to file and clean up


