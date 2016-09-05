#Getting and Cleaning Data: Course Project

This assignment utilizes a dataset from wearable computing technology which recorded a group of volunteers performing activities while wearing a smartphone. For this data science course project, I have gathered and prepared the wearable technology data into a tidy form that can be used for analysis. This report will review my steps and what I’ve gathered in this process. 

The raw data is a multivariate time-series data that could be used for classification and clustering. The dataset has been partitioned into two sets: training data and test data. There are 561 unlabeled attributes (in x_test.txt file). There were 30 test subjects (data is found in the subject_test.txt file) conducting six activities (activity labels can be found in the y_test.txt file).

In order to prepare a tidy data set, I first created a file that merges the training data and the test data into one. This file is called run_analysis.R. In order for this to occur, the UCI HAR Dataset had to be extracted and the UCI HAR Dataset had to be available in the UCI HAR Dataset directory. I then added labels to the newly merged dataset and retained columns with mean and standard deviation data. The script will create a clean data set with all the means of all the columns by test subject and activity. This data would be written in a manner that would be easier to analyze. The tab-delimited file with this data is titled tidy.txt and is included in my files. 

About the Code Book
I have also included a code book file titled CodeBook.md. This file has all of the steps performed.
