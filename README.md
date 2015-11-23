## Edwin St Catherine - Getting and Cleaning Data Assignment

## Getting and Cleaning Data Course Project Repo by Edwin St Catherine

### All of the code written the process of generating the results for
### this project can be found here

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

## Writing final data to CSV

Finally the dataset is written to the CSV folder