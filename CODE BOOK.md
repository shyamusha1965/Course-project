Objectives of the project

Tidy the given data
Create a new file which contains the tidy data
Procedure

Download the dataset from the course page
Create variables to store all the necessary text files

#1 Merges the training and the test sets to create one data set.

-merge the x_train, x__test files using the rbind() function

-merge the y_train, y__test files using the rbind() function

-merge the subject_train, subject_test files using the rbind() function

-now merge all the above things using the cbind() function

-hence we get a new dataset with both test and train sets combined


#2 Extracts only the measurements on the mean and standard deviation for each measurement.

-using the pipe operator pass the merged data and by using the select() function select the necessary columns

-for accessing only the mean and standard deviation observations, use the attribute contains() inside the select function


#3 Uses descriptive activity names to name the activities in the data set

-by comparing the new dataset with the given "activities" text file, assign the proper activity name to each observation

#4 Appropriately labels the data set with descriptive variable names.

-abbreviate the names in the dataset by reffering to the readme file in the original zip file given

-the abbreviations that are to be changed are acc- accelerometer gyro-gyroscope mag-magnitute f-frequency t-time


#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-to extract an independent dataset with the average of each variable for each activity and subject, use the pipe operator on the merged dataset and select the necesary fields

-use the group_by() function to group the data using activity and subject

-use the summarise_all function with the attribute funs(mean) to extract the mean of all the observations

-finally use the write.table() function to create a new .txt file of the final independent dataset
