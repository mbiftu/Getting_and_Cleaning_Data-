Course Project Code Book
Below are the links to the data sources:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (data for the project)

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (full description of data) 

The file with the merged data set of the training data and test data (run_analysis.R) merges:
    1). train/X_train.txt with test/X_test.txt, resulting in a 10299x561 data frame 
    2). train/subject_train.txt with test/subject_test.txt, the result of which is a 10299x1 data frame with subject IDs
    3). train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs

This file also extracts the 66 mean and standard deviation data attributes from the total 561 attributes in the features.txt file resulting in a 10299x66 data frame. Mean and standard deviation data should all be numbers between -1 and 1. 
The file then applies descriptive activity names to name each activity within the data set (from activity_labels.txt file). These activities are: walking, walkingupstairs, walkingdownstairs, sitting, standing, and laying. All attributes are appropriately labeled, underscores and brackets are removed, and activity names are converted to lower-case. 

The 10299x66 data with attributes is then combined with the 10299x1 containing activity labels and subject IDs. This results in a 10299x68 data in which the first column has the subject IDs, the second column has the activity names, and the last 66 columns have the mean and standard deviation measurements.  The subject IDs are numbers between 1 and 30 and the names of the attributes are:  tbodyacc-mean-x, tbodyacc-mean-y , tbodyacc-mean-z , tbodyacc-std-x, tbodyacc-std-y, tbodyacc-std-z , tgravityacc-mean-x , tgravityacc-mean-y

Then, the script becomes a different independent tidy data file that has the average of each measurement for each activity and each subject (saved as data_set_with_the_averages.txt). This file has a 180x68 data frame. The first column has the subject IDs, the second column has the activity names and the 3rd-68th column have averages for each of the 66 attributes. 

