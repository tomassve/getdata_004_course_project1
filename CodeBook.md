Codebook
========================================================
Codebook of *Course Project no 1* in the Coursera Course June 2014, *Getting and Cleaning Data*.

Original data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

&nbsp;&nbsp;&nbsp;[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The training and test set were merged into a common data set. Only the measurements on the mean and standard deviation were analysed. The data set reported here is the average of each feature for each activity and each subject.

Data have one row for each combination of activity and subject, while columns hold the average of an analysed feature. 

The columns are:

#### subject

  Subject id
  
  Unique identfier for the subject [1, 30]
    
#### activity  
Activity string

The activity performed by the subject. One of:

* LAYING
* SITTING           
* STANDING
* WALKING          
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS
      
#### avg_XXX
XXX is one of the 66 features analysed, e.g. **avg_tBodyAcc-mean()-X** is the average value of **tBodyAcc-mean()-X** for the combination of subject and activity. All these variables are normalized to [-1, 1] and unit less as described in "UCI HAR Dataset/README.txt"
