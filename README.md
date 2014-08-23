# GCData_CourseProject

This repository represents Course Project files for Getting and Cleaning Data. First the underlying experiment is described, and then follows a description of the applied analysis.

## Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Analysis
**run_analysis.R** creates a summary data set in the following way:

1. It fetches the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
2. Unzips the data set.
3. Then the different tables and vectors contained in the zip are loaded: the measurements are separated from the subject (volunteer) registration , and also separate from the activity registration. Moreover the headers belonging to the measurements are separated too, and lastly, the original data is divided in a "test" and "train" group.
4. As we are only interested in measurements in terms of means and standard deviations we determine which columns contain these measures.
5. Then the measurements for the test and train groups are combined with the corresponding registration of subject and activity (within these groups).
6. After this, the test and train groups are combined into one dataset. And rightaway we add the appropriate column names.
7. The activity is recorded with an integer factor that gets labeled now.
8. Then the dataset gets melted: subject and activity are IDs and the other measurements are variables. We get a "narrow" dataset.
9. This dataset is summarized through casting: for each variable from the original data set we calculate the mean for all corresponding observations.
10. This results in a new tidy data set (tidydataset.txt) with 180 observations (30 subjects x 6 activities) and the means of 66 measurement variables.