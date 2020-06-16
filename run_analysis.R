getwd()

library(dslabs)

library(dplyr)

#URL OF THE REQUIRED TABLES
activitylabels="./activity_labels.txt"
features="./features.txt"

#test set
xtest="./test/X_test.txt"
ytest="./test/y_test.txt"
subjecttest="./test/subject_test.txt"

#train set
xtrain="./train/X_train.txt"
ytrain="./train/y_train.txt"
subjecttrain="./train/subject_train.txt"



#READING THE TABLES
activities=read.table(activitylabels,col.names = c("no","activities"))
featurefunctions=read.table(features,col.names = c("no","functions"))

xtestdata=read.table(xtest,col.names = featurefunctions$functions)
ytestlabels=read.table(ytest,col.names = c("label"))
testsubject=read.table(subjecttest,col.names = c("subject"))

xtraindata=read.table(xtrain,col.names = featurefunctions$functions)
ytrainlabels=read.table(ytrain,col.names = c("label"))
trainsubject=read.table(subjecttrain,col.names = c("subject") )


#1 MERGING TEST AND TRAIN INTO ONE DATASET
x=rbind(xtestdata,xtraindata)
y=rbind(ytestlabels,ytrainlabels)
subject=rbind(testsubject,trainsubject)
merge_data=cbind(subject,y,x)

names(merge_data)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
required_data=merge_data %>% select(subject,label, contains("mean"),contains("std"))

#3 Uses descriptive activity names to name the activities in the data set
required_data$label=activities[required_data$label,2]

#4 Appropriately labels the data set with descriptive variable names.

names(required_data)[2]="activitydone"
names(required_data)=gsub("^t","time",names(required_data))
names(required_data)=gsub("^f","frequency",names(required_data))
names(required_data)=gsub("BodyBody","Body",names(required_data))
names(required_data)=gsub("Acc","accelerometer",names(required_data))
names(required_data)=gsub("Gyro","gyroscope",names(required_data))
names(required_data)=gsub("Mag","magnitude",names(required_data))
names(required_data)=gsub("Freq","frequency",names(required_data))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

independent_data=required_data%>% group_by(subject,activitydone)%>% summarise_all(funs(mean))

write.table(independent_data,"independent data.txt",row.name = FALSE)
