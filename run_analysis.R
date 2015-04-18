source_data = "source_data.zip"

# Download raw data
if (!file.exists(source_data)) {
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        destfile = source_data)
}

# Read train, test & features data sets
x_train <- read.table(unz(source_data, "UCI HAR Dataset/train/X_train.txt"), header = F, fill = T)
y_train <- read.table(unz(source_data, "UCI HAR Dataset/train/y_train.txt"), header = F)
subject_train <- read.table(unz(source_data, "UCI HAR Dataset/train/subject_train.txt"), header = F)

x_test <- read.table(unz(source_data, "UCI HAR Dataset/test/X_test.txt"), header = F, fill = T)
y_test <- read.table(unz(source_data, "UCI HAR Dataset/test/y_test.txt"), header = F)
subject_test <- read.table(unz(source_data, "UCI HAR Dataset/test/subject_test.txt"), header = F)

features <- read.table(unz(source_data, "UCI HAR Dataset/features.txt"), header = F, stringsAsFactors = F)
activity_labels <- read.table(unz(source_data, "UCI HAR Dataset/activity_labels.txt"), header = F, col.names = c("id", "activity"))

# Merge train / test data sets and set descriptive activity names
subjects <- rbind(subject_train, subject_test)[,1]
activities <- factor(rbind(y_train, y_test)[,1], 
                     levels = activity_labels$id, 
                     labels = activity_labels$activity)

# Select mean / std columns
mean_std_cols <- subset(features, grepl("(mean|std)\\(\\)", V2))
measurements <- rbind(x_train, x_test)[,mean_std_cols$V1]

# Set decriptive column names
column_names <- mean_std_cols$V2

replacements <- new.env()
replacements[["\\(\\)"]] = ""
replacements[["-"]] = ""
replacements[["^t"]] = "time"
replacements[["^f"]] = "freq"
replacements[["([bB]ody)+"]] = "Body"
replacements[["mean"]] = "Mean"
replacements[["std"]] = "Std"

for (key in ls(replacements)) {
    column_names <- lapply(column_names, function(x) gsub(key, replacements[[key]], x))
}

colnames(measurements) <- column_names

# Create complete dataset
data <- cbind(activity = activities, subject = subjects, measurements)

# Create dataset with mean values for each activity and each subject
tidy_data <- aggregate(data[, 3:68], list(activity = data$activity, subject = data$subject), mean)
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)