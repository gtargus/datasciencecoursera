# run_analysis.R 
#   Fields to cover:

#   Merges the training and the test sets to create one data set.
#   Extracts only the measurements on the mean and standard deviation for each measurement.
#   Uses descriptive activity names to name the activities in the data set
#   Appropriately labels the data set with descriptive variable names.
#   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#setwd("~/datasciencecoursera/Getting_and_Cleaning_Data/UCI HAR Dataset")
library(dplyr)

message("Phase 1 out of 5...")
message("Merge the training and the test sets to create one data set.")

# Read the training and test data sets.
train.data <- read.table("./train/X_train.txt")
test.data <- read.table("./test/X_test.txt")
merge.data <- rbind(train.data, test.data)

##########################################

message("Phase 2 out of 5...")
message("Extract only the measurements on the mean and standard deviation for each measurement.")

# Read feature list
features <- read.table("./features.txt", col.names=c("col", "name"))
wanted.features <- features[grepl("mean()", features$name, fixed=TRUE) |grepl("std()", features$name, fixed=TRUE),]

# Extract only mean and standard deviation data.
all.wanted.data <- merge.data[, wanted.features$col]

##########################################

message("Phase 3 out of 5...")
message("Use descriptive activity names to name the activities in the data set")

# Read activity label
act <- read.table("./activity_labels.txt", col.names=c("id", "name"))

# Read training and test activity label id's
y_train <- read.table("./train/y_train.txt", col.names="id")
y_test <- read.table("./test/y_test.txt", col.names="id")

# Merge the labels as for the data before (train then test).
y_all <- rbind(y_train, y_test)

# Convert activity label id's into names
y_all$name <- act[y_all$id,]$name
y_all <- y_all[,"name", drop=FALSE]

##########################################

message("Phase 4 out of 5...")
message("Appropriately labels the data set with descriptive variable names.")

# Read the subject lists.
train.subj <- read.table("./train/subject_train.txt", col.names="id")
test.subj <- read.table("./test/subject_test.txt", col.names="id")

# Merge the subjects as for the data before (train then test).
all.subj <- rbind(train.subj, test.subj)

# Convert subjects from integer to factor.
all.subj$id <- as.factor(all.subj$id)

# Combine subjects, activities, and mean and std data into Tidy Data Set 1.
tidy <- cbind(all.subj,y_all, all.wanted.data)

# Set variable names of Tidy data set
names(tidy) <- c("subject", "activity", as.character(wanted.features$name))

##########################################

message("Phase 5 out of 5...")
message("create a second, independent tidy data set with the average of each variable for each activity and each subject.")

# Derive average for each variable by subject and activity and put it into Tidy
# Data Set 2.
tidy.avg <- tidy %>% 
	group_by(subject, activity) %>%
        summarise_each(funs(mean))

# Set variable names of second Tidy data set
names(tidy.avg) <- c("subject", "activity",
                        sapply(wanted.features$name,
                               function(name) paste("avg", name, sep="-")))

##########################################

message("Writing Tidy Data Set 2 to file output.txt...")
write.table(tidy.avg, file="output.txt", row.name=FALSE)
