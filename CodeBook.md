"The experiments have been carried out with a group of 30 volunteers [...]. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."
From the description of the original data:  
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Foreach measurement the average ("mean") and standart deviation ("std"") had been calculated ( part of the original data).
In this data preparation a new data-set was created representing the mean of the mean and std values over the measurements per subject and activity. It can be found in "activity means.csv"

The original data is described in the files included alongside the data in

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Especially in README.txt and features_info.txt.
A list of all the original feature is given in features.txt.
The activity labels are given in activity_labels.txt



The steps that were beformed to generate the new data-set are the following:
1. Train- and Test-sets have concatenated to form the total data-set of subject ids, features and target variable.
(subject_train.txt, subject_test.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt)
2. The categorical numbers for the activities in the y-colum were replaced by their respective descriptive label from avtivity_labels.txt
3. The missing column names in the features data-set were replaced according to the list list in features.txt
4. The Activity/ y-column was named "Activity", the column with the subject ids was named "Subject ID"
2. The three data-sets were joined alongside each other to form one data-set
5. For features representing the mean() and std() of measurements (see original data description) their respective average ("mean") were calculated over the data grouped by "Activity" and "Subject ID" ( in that order)
6. In the resulting data-set the column-names of measurements were renamed prepending "Mean of" to reflect what they represent

The list of features can be found in names.csv
