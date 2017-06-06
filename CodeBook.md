# Procedures

The script `run_analysis.R`performs the 5 steps described in the requirement.

* Firs, all the similar data is merged using the `rbind()` function. Similar means these files having the same columns and indicating the same objects of interests.
* Second, mean and std.edv for appropriate columns are taken. 
* Third, columns are given the correct names, as required from `features.txt`, and vague names are corrected.
* Fourth, activity names and IDs are taken from `activity_labels.txt` and then substituted. 
* Finally, a new dataset with all the average measures (30 subjects * 6 activities = 180) is outputted to `averages_data.txt`.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge from the previous datasets
* `features` has the correct names for the `x_data` dataset, which are applied to names stored in `mean_and_std_features`. Similarly for activity names.
* `all_data` merges all three: `x_data`, `y_data` and `subject_data` 
* `averages_data` contains the averages stored in a `.txt` file. `colMeans()` is from plyr package.
