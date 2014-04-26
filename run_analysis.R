library(plyr)

train_X <- read.table('UCI HAR Dataset/train/X_train.txt')
train_Y <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')

test_X <- read.table('UCI HAR Dataset/test/X_test.txt')
test_Y <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt')

entire_train <- cbind(train_Y, train_subject, train_X)
entire_test <- cbind(test_Y, test_subject, test_X)

features <- read.table('UCI HAR Dataset/features.txt')
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')

feature_names <- as.character(features[[2]])
activity_names <- as.character(activity_labels[[2]])

mean_features = feature_names[grep('mean', feature_names)]
std_features = feature_names[grep('std', feature_names)]

combined_data <- rbind(entire_train, entire_test)

names(combined_data) <- c('Activity', 'Subject', feature_names)

compact_data <- combined_data[,c('Activity', 'Subject', mean_features, std_features)]
compact_data$Activity <- mapvalues( compact_data$Activity, from=activity_labels[[1]] , to=activity_names)

write.csv(compact_data, 'compact_data.csv', row.names=FALSE)

agg_data <- aggregate(. ~ Activity + Subject, compact_data, FUN=mean)

write.csv(agg_data, 'summary.csv', row.names=FALSE)


