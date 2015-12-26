# Code Book for the Final Project
Getting and Cleaning Data Module - Coursera

## General Information

This code book refers to the final project proposed at the Coursera's module "Getting and Cleaning Data", offered by Johns Hopkins University.
Project instructions may be found here:

https://class.coursera.org/getdata-035/human_grading/view/courses/975119/assessments/3/submissions

and the data treatment requested was:

To create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Also, this Code Book is part of the request.


## Study Design

Original data was retrieved from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It was produced by the study of 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The following information was copied from the source:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited."

## Summary Choices

Data originally separated on eight datasets - activity labels, measurement labels, record of subject IDs (train and test), records of subject activity (train and test), records of measurements (train and test) - were grouped and filtered into one dataset. 

As requested by the instructions, variables representing means or stsandard deviations were kept, totaling 79 variables, plus two for the subject's ID and activity performed. Data was treated in R. Subject ID, activities, and labels were loaded using read.csv command. For the measurements, data was read using read.fwf with 561 fields of fixed size of 16 characters. No original file contains headers. Data was gathered into data.tables (train and test) using data.table package, and column names were attributed by the names command. The resulting data.tables were then grouped by the rbindlist command, with the option use.names=TRUE. Columns were filtered using the %like% command, considering the tokens "mean" and "std" for selecting the attributes related to calculations of means or standard deviations, as requested by the project instructions. 

In the resulting dataset:

- the first row represents the labels of the selected variables
- each row represents a record containing the selected variables 
- each column contains only data related to the respective header
- features are normalized and bounded within [-1;1]


## Variables

1. Subject                         - Subject's ID (Integer, range 1:30).
2. Activity                        - Activity performed during data collection (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
3. tBodyAcc-mean()-X               - Mean Body Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
4. tBodyAcc-mean()-Y               - Mean Body Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
5. tBodyAcc-mean()-Z               - Mean Body Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
6. tBodyAcc-std()-X                - Standard Deviation Body Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
7. tBodyAcc-std()-Y                - Standard Deviation Body Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
8. tBodyAcc-std()-Z                - Standard Deviation Body Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
9. tGravityAcc-mean()-X            - Mean Gravity Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
10. tGravityAcc-mean()-Y            - Mean Gravity Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
11. tGravityAcc-mean()-Z            - Mean Gravity Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
12. tGravityAcc-std()-X             - Standard Deviation Gravity Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
13. tGravityAcc-std()-Y             - Standard Deviation Gravity Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
14. tGravityAcc-std()-Z             - Standard Deviation Gravity Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
15. tBodyAccJerk-mean()-X           - Mean Jerk Signal Body Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
16. tBodyAccJerk-mean()-Y           - Mean Jerk Signal Body Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
17. tBodyAccJerk-mean()-Z           - Mean Jerk Signal Body Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
18. tBodyAccJerk-std()-X            - Standard Deviation Jerk Signal Body Linear Acceleration - X - time domain (normalized and bounded within [-1;1]).
19. tBodyAccJerk-std()-Y            - Standard Deviation Jerk Signal Body Linear Acceleration - Y - time domain (normalized and bounded within [-1;1]).
20. tBodyAccJerk-std()-Z            - Standard Deviation Jerk Signal Body Linear Acceleration - Z - time domain (normalized and bounded within [-1;1]).
21. tBodyGyro-mean()-X              - Mean Body Angular Acceleration - X - time domain (normalized and bounded within [-1;1]).
22. tBodyGyro-mean()-Y              - Mean Body Angular Acceleration - Y - time domain (normalized and bounded within [-1;1]).
23. tBodyGyro-mean()-Z              - Mean Body Angular Acceleration - Z - time domain (normalized and bounded within [-1;1]).
24. tBodyGyro-std()-X               - Standard Deviation Body Angular Acceleration - X - time domain (normalized and bounded within [-1;1]).
25. tBodyGyro-std()-Y               - Standard Deviation Body Angular Acceleration - Y - time domain (normalized and bounded within [-1;1]).
26. tBodyGyro-std()-Z               - Standard Deviation Body Angular Acceleration - Z - time domain (normalized and bounded within [-1;1]).
27. tBodyGyroJerk-mean()-X          - Mean Jerk Signal Body Angular Acceleration - X - time domain (normalized and bounded within [-1;1]).
28. tBodyGyroJerk-mean()-Y          - Mean Jerk Signal Body Angular Acceleration - Y - time domain (normalized and bounded within [-1;1]).
29. tBodyGyroJerk-mean()-Z          - Mean Jerk Signal Body Angular Acceleration - Z - time domain (normalized and bounded within [-1;1]).
30. tBodyGyroJerk-std()-X           - Standard Deviation Jerk Signal Body Angular Acceleration - X - time domain (normalized and bounded within [-1;1]).
31. tBodyGyroJerk-std()-Y           - Standard Deviation Jerk Signal Body Angular Acceleration - Y - time domain (normalized and bounded within [-1;1]).
32. tBodyGyroJerk-std()-Z           - Standard Deviation Jerk Signal Body Angular Acceleration - Z - time domain (normalized and bounded within [-1;1]).
33. tBodyAccMag-mean()              - Mean Magnitude Body Linear Acceleration - time domain (normalized and bounded within [-1;1]).
34. tBodyAccMag-std()               - Standard Deviation Magnitude Body Linear Acceleration - time domain (normalized and bounded within [-1;1]).
35. tGravityAccMag-mean()           - Mean Magnitude Gravity Linear Acceleration - time domain (normalized and bounded within [-1;1]).
36. tGravityAccMag-std()            - Standard Deviation Magnitude Gravity Linear Acceleration - time domain (normalized and bounded within [-1;1]).
37. tBodyAccJerkMag-mean()          - Mean Magnitude Jerk Signal Body Linear Acceleration - time domain (normalized and bounded within [-1;1]).
38. tBodyAccJerkMag-std()           - Standard Deviation Magnitude Jerk Signal Body Linear Acceleration - time domain (normalized and bounded within [-1;1]).
39. tBodyGyroMag-mean()             - Mean Magnitude Body Angular Acceleration - time domain (normalized and bounded within [-1;1]).
40. tBodyGyroMag-std()              - Standard Deviation Magnitude Body Angular Acceleration - time domain (normalized and bounded within [-1;1]).
41. tBodyGyroJerkMag-mean()         - Mean Magnitude Jerk Signal Body Angular Acceleration - time domain (normalized and bounded within [-1;1]).
42. tBodyGyroJerkMag-std()          - Standard Deviation Magnitude Jerk Signal Body Angular Acceleration - time domain (normalized and bounded within [-1;1]).
43. fBodyAcc-mean()-X               - Mean Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
44. fBodyAcc-mean()-Y               - Mean Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
45. fBodyAcc-mean()-Z               - Mean Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
46. fBodyAcc-std()-X                - Standard Deviation Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
47. fBodyAcc-std()-Y                - Standard Deviation Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
48. fBodyAcc-std()-Z                - Standard Deviation Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
49. fBodyAcc-meanFreq()-X           - Weighted Average of the Frequency Components Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
50. fBodyAcc-meanFreq()-Y           - Weighted Average of the Frequency Components Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
51. fBodyAcc-meanFreq()-Z           - Weighted Average of the Frequency Components Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
52. fBodyAccJerk-mean()-X           - Mean Jerk Signal Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
53. fBodyAccJerk-mean()-Y           - Mean Jerk Signal Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
54. fBodyAccJerk-mean()-Z           - Mean Jerk Signal Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
55. fBodyAccJerk-std()-X            - Standard Deviation Jerk Signal Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
56. fBodyAccJerk-std()-Y            - Standard Deviation Jerk Signal Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
57. fBodyAccJerk-std()-Z            - Standard Deviation Jerk Signal Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
58. fBodyAccJerk-meanFreq()-X       - Weighted Average of the Frequency Components Jerk Signal Body Linear Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
59. fBodyAccJerk-meanFreq()-Y       - Weighted Average of the Frequency Components Jerk Signal Body Linear Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
60. fBodyAccJerk-meanFreq()-Z       - Weighted Average of the Frequency Components Jerk Signal Body Linear Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
61. fBodyGyro-mean()-X              - Mean Body Angular Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
62. fBodyGyro-mean()-Y              - Mean Body Angular Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
63. fBodyGyro-mean()-Z              - Mean Body Angular Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
64. fBodyGyro-std()-X               - Standard Deviation Body Angular Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
65. fBodyGyro-std()-Y               - Standard Deviation Body Angular Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
66. fBodyGyro-std()-Z               - Standard Deviation Body Angular Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
67. fBodyGyro-meanFreq()-X          - Weighted Average of the Frequency Components Body Angular Acceleration - X - frequency domain (normalized and bounded within [-1;1]).
68. fBodyGyro-meanFreq()-Y          - Weighted Average of the Frequency Components Body Angular Acceleration - Y - frequency domain (normalized and bounded within [-1;1]).
69. fBodyGyro-meanFreq()-Z          - Weighted Average of the Frequency Components Body Angular Acceleration - Z - frequency domain (normalized and bounded within [-1;1]).
70. fBodyAccMag-mean()              - Mean Magnitude Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
71. fBodyAccMag-std()               - Standard Deviation Magnitude Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
72. fBodyAccMag-meanFreq()          - Weighted Average of the Frequency Components Magnitude Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
73. fBodyBodyAccJerkMag-mean()      - Mean Magnitude Jerk Signal Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
74. fBodyBodyAccJerkMag-std()       - Standard Deviation Magnitude Jerk Signal Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
75. fBodyBodyAccJerkMag-meanFreq()  - Weighted Average of the Frequency Components Magnitude Jerk Signal Body Linear Acceleration - frequency domain (normalized and bounded within [-1;1]).
76. fBodyBodyGyroMag-mean()         - Mean Magnitude Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
77. fBodyBodyGyroMag-std()          - Standard Deviation Magnitude Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
78. fBodyBodyGyroMag-meanFreq()     - Weighted Average of the Frequency Components Magnitude Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
79. fBodyBodyGyroJerkMag-mean()     - Mean Magnitude Jerk Signal Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
80. fBodyBodyGyroJerkMag-std()      - Standard Deviation Magnitude Jerk Signal Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
81. fBodyBodyGyroJerkMag-meanFreq() - Weighted Average of the Frequency Components Magnitude Jerk Signal Body Angular Acceleration - frequency domain (normalized and bounded within [-1;1]).
