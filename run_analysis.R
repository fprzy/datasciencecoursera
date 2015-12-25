library(dplyr)
require(plyr)



features <- read.table("features.txt")
column_names <- as.vector(features$V2)

activity_labels <- fread("activity_labels.txt")


data_x_test <- fread("test/X_test.txt")
activity_test <- fread("test/Y_test.txt")
subjects_test <- fread("test/subject_test.txt")

colnames(data_x_test) <- column_names
colnames(activity_test) <- c("Activity")
colnames(subjects_test) <- c("Subject")
data_x_test_mean_std <- select(data_x_test, matches("(mean|std)", ignore.case = TRUE))
data_x_test_mean_std  <- cbind(subjects_test, activity_test, data_x_test_mean_std)
data_x_test_mean_std$Activity <- mapvalues(data_x_test_mean_std$Activity, 
                                 from=activity_labels$V1, 
                                 to=activity_labels$V2)


data_x_train <- fread("train/X_train.txt")
activity_train <- fread("train/Y_train.txt")
subjects_train <- fread("train/subject_train.txt")

colnames(data_x_train) <-  column_names
colnames(activity_train) <- c("Activity")
colnames(subjects_train) <- c("Subject")
data_x_train_mean_std <- select(data_x_train, matches("(mean|std)", ignore.case = TRUE))
data_x_train_mean_std  <- cbind(subjects_train, activity_train, data_x_train_mean_std)
data_x_train_mean_std$Activity <- mapvalues(data_x_train_mean_std$Activity, 
                                           from=activity_labels$V1, 
                                           to=activity_labels$V2)

data_x_mean_std <- rbind (data_x_train_mean_std, data_x_test_mean_std)

by_subject_activity <- group_by(data_x_mean_std,Subject,Activity)
result <- (by_subject_activity %>% summarise_each(funs(mean)))
write.table(result,"result.out",row.name=FALSE)
