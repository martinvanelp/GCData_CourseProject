# Code Book

This code book describes the variables, the data, and any transformations or work done to create the tidydataset.txt which is a summary of the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Variables
Each record provides:

- Subject: the unique volunteer number (1 to 30).
- Activity: the performed activity (6 different activities: walking, walking upstairs, walking downstairs, sitting, standing, laying).
- The means of measurements for 66 measures (both means and standard deviations) for each subject and each activity, as measured by the accelerometer and gyroscope of the phone.

So there are 180 observations (30 volunteers x 6 activities) and 66 other variables, excluding Subject and Activity.

## Transformations and other work
- The original data was separated in a training and test group. These groups have been combined to one set.
- Variables that did not depict a mean or standard deviation were dropped.
- In the original combined data there were 10299 observations with *non-unique* combinations of subject and activity.
- Then summary statistics were calculated for each *unique* combination of subject and activity, in the form of means.
- This resulted in 180 observations (30 volunteers x 6 activities) for 66 measurement variables.
- These variables depict the means of the original measurements by the accelerometer and gyroscope of the phone in terms of means and standard deviations.