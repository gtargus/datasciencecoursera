# Introduction
#https://github.com/GeodesiaSig/getting_cleaning_data/blob/master/run_analysis.R
The script `run_analysis.R`
- Assumes data are downloaded from
  [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)
- merges the training and test sets to create one data set
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- appropriately labels the columns with descriptive names
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. In other words, same type of
  measurements for a particular subject and activity are averaged into one value
  and the tidy data set contains these mean values only. The processed tidy data
  set is also exported as csv file.
  
# run_analysis.R

The script is executed by placing it in the folder containing the data.
Then run:
setwd("path_of_script")
and then:
source(run_analysis.R)

# The original data set

The original data set is split into training and test sets (70% and 30%,
respectively) where each partition is also split into three files that contain
- measurements from the accelerometer and gyroscope
- activity label
- identifier of the subject

# Getting and cleaning data

If the data is not already available in the `data` directory, it is downloaded
from UCI repository.

The first step of the preprocessing is to merge the training and test
sets. After the merge operation, mean and standard deviation features are extracted
for further processing.

Next, the activity labels are replaced with descriptive activity names, defined
in `activity_labels.txt` in the original data folder.
The final step creates a tidy data set with the average of each variable for
each activity and each subject.The tidy data set is exported to `output.txt`.

