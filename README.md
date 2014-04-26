Coursera Getting and Cleaning Data Project
=============================

In this project are processing scripts for retrieving and processing the UCI smartphone dataset.

- `get_data.R`: retrieves the large zip file with the original data files.
- `run_analysis.R`: will extract a tidy dataset with mean and standard deviation fields extracted `compact_data.csv`
   as well as a secondy tidy dataset summarized across activity and individual `summary.csv`.

Inside each file contains the fields:

- Activity - One of six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Subject - Integer reference to the subject from which the values were collected
- 79 additional mean and standard deviations of various accelerometer readings.
