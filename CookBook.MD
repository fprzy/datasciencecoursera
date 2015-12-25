---
title: "CookBook.MD"
output: html_document
---



The transformations to create the new tiny data set are carried out with the R script transform.R. The used variables and the main tranformation steps are described below:

**Used variables**

`features`:

holds the features read from features.txt.


`column_names`:

vector of columnnames for the training and test data, derived from the second
column of dataframe `features`.

`activity_labels`:

holds the activity labels read from activity_labels.txt.


`data_x_test`:

holds the test data read from X_test.txt.

`data_x_train`:

holds the training data read from X_train.txt.

`activity_test`:

holds the activity labels for the test data read from Y_test.txt.

`activity_train`:

holds the activity labels for the trainsing set read from Y_train.txt.

`subjects_test`:

holds the subject labels read from subject_test.txt.

`subjects_train`:

holds the subject labels for the trainig data read from subject_train.txt.

`data_x_test_mean_std`:

holds the transformed and cleansed test data set.

`data_x_train_mean_std`:

holds the transformed and cleansed training data set.

`data_x_mean_std`:

holds the merged transformed and cleansed traing and test data set.


`by_subject_activity`:

grouping set from grouping on subject and activity column.

`result`:

stores the transformed new tidy data set.



**Transformation steps**

1. Generating meaningful column names from  feature.txt, Y_test.txt, Y_train.txt 
2. Filtering columns which colnum names match mean or std.
3. Merging subject and activity data with the measured data value set.
4. Merging the transformed training and test data sets.
5. Generating the new tidy data set from the merged data set in step 4.


