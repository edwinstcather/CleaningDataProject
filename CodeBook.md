# Code Book

This document documents the manner in which run_analysis.R was created.

The code contains many comments describing each section:

* Downloading and loading data
* Manipulating data
* Writing final data to CSV

## Downloading and loading data 

In this section the directory is set and the datasets are loaded from the external sources
and are save to the appropriate directories for further manipulation from the training
and the test datasets

## Manipulating data

There are detailed comments in the run_analysis.R program file. Essentially the dataset is 
combined along with the subject data to create one dataset. Labels are applied and factor
variables defined. 

The means and std columns are then selected from alldata
Summaries are crated by calculating the average for each column for each activity/subject pair.

At this point the final data frame looks like this:

                  V1 test_train 1tbodyacc_mean_x 2tbodyacc_mean_y 3tbodyacc_mean_z
              (fctr)     (fctr)            (dbl)            (dbl)            (dbl)
1            WALKING      TRAIN        0.2656969      -0.01829817       -0.1078457
2   WALKING_UPSTAIRS       TEST        0.2731131      -0.01913232       -0.1156500
3 WALKING_DOWNSTAIRS      TRAIN        0.2734287      -0.01785607       -0.1064926
4            SITTING       TEST        0.2741831      -0.01480815       -0.1075214
5           STANDING      TRAIN        0.2791780      -0.01548335       -0.1056617
6             LAYING      TRAIN        0.2723766      -0.01756970       -0.1159945

## Writing final data to CSV

Finally the dataset is written to the CSV folder