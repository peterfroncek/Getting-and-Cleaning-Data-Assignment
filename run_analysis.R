xtest <- read.table("test/X_test.txt", sep = "")
ytest <- read.table("test/y_test.txt", sep = "")
subject_test <- read.table("test/subject_test.txt", sep = "")

xtrain <- read.table("train/X_train.txt", sep = "")
ytrain <- read.table("train/y_train.txt", sep = "")
subject_train <- read.table("train/subject_train.txt", sep = "")

test <- cbind(subject_test,ytest,xtest)
train <- cbind(subject_train,ytrain,xtrain)

data <- rbind(test,train)

features <- read.table("features.txt", sep = "")

cols <- grep("mean|std",features[,2])
cols <- cols + 2
cols <- c(1,2,cols)

data <- data[,cols]

activities <- read.table("activity_labels.txt", sep = "")

data[,2] <- gsub("1",activities[1,2],data[,2])
data[,2] <- gsub("2",activities[2,2],data[,2])
data[,2] <- gsub("3",activities[3,2],data[,2])
data[,2] <- gsub("4",activities[4,2],data[,2])
data[,2] <- gsub("5",activities[5,2],data[,2])
data[,2] <- gsub("6",activities[6,2],data[,2])

names <- c("subject","activity",as.character(features[grep("mean|std",features[,2]),2]))
names <- gsub("\\(\\)","",names)
names <-gsub("-|_",".",names)

colnames(data) <- names

library(dplyr)


data <- group_by(data,subject,activity)
data <- summarize_each(data,funs(mean))
