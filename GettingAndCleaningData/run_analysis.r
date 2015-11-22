##combine all data
X_data <- rbind(read.table("test/X_test.txt"),read.table("train/X_train.txt"))
Y_data <- rbind(read.table("test/y_test.txt"),read.table("train/y_train.txt"))
Subject_data <- rbind(read.table("test/subject_test.txt"),read.table("train/subject_train.txt"))
features <- read.table("features.txt")
## only retrieve specified columns that contain mean or std calc
specificColumnNums <- grep("mean|std", features[, 2])
X_data <- X_data[,specificColumnNums]

##rename column headers
names(X_data) <- gsub("-","_",gsub("\\()", "",features[specificColumnNums,2]))
names(Subject_data) <- "SubjectId"
names(Y_data) <- "ActivityName"

activityNames <- read.table("activity_labels.txt")

##set the Y_data rows of column 1 = the activity name where value matches between first column of Y_Data and first column of activity names
Y_data[,1] = activityNames[Y_data[,1], 2]

##combine all data & format new data frame's headers
df <- cbind(Subject_data, X_data, Y_data)
names(df) <- gsub("Acc", "Accelerometer",gsub("Gyro", "Gyroscope",gsub("Mag", "Magnitude",gsub("BodyBody", "Body",
					gsub("^t", "time",gsub("^f", "frequency",names(df))))))) 
					

##find means aggregated by columns
Tidy_DataSet <- aggregate(. ~SubjectId + ActivityName, df, mean)
Tidy_DataSet <- Tidy_DataSet[order(Tidy_DataSet$SubjectId,Tidy_DataSet$ActivityName),]
write.table(Tidy_DataSet, file = "TidyDataSet.txt", row.names = FALSE)
