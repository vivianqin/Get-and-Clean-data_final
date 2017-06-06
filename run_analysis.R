install.packages(plyr)
library(plyr)

# Step 1
# Merge the training and test sets to one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' and 'y' data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with mean() or std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset and then correct names 
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names

# correct column name
names(subject_data) <- "subject"

# combine all the data 
all_data <- cbind(x_data, y_data, subject_data)

# Step 5
# Create a second, independent tidy data set with the average of each variable

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)