X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

features <- read.table("UCI HAR Dataset/features.txt", sep=" ")

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels=activities$V2

library(dplyr)

X <- rbind(X_train, X_test)
names(X) = features$V2

Y <- rbind(y_train, y_test)
names(Y) = c("Activity")
Y$Activity = as.factor(Y$Activity)
levels(Y$Activity) = activityLabels

S <- rbind(subject_train, subject_test)
names(S) = "Subject ID"

D <- cbind(S,X,Y)
# use grep construct here, because some column names are duplicated and I could not find a way to use %>% select(contains("mean"), contains("std"))
D_ <- D[,which(colnames(D) %in% c("Subject ID", "Activity", grep("mean\\(\\)|std\\(\\)", colnames(D), value=TRUE)))]

T_ <- D_ %>% group_by(Activity, `Subject ID`) %>% summarise_all(mean)
names(T_) <- gsub("^t|^f","Mean of ", names(T_))

write.table(T_, "activity means.csv", row.names=FALSE)
write.table(data.frame(names(T_)),"names.csv", row.names=FALSE, col.names=FALSE)
