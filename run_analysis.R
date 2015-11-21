## The training data is read into the training folder along with the 
## subject related codes for the training data
setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)
##alldata1 <- cbind.data.frame(subject_train,x_train)

## The test data is read into the test folder along with the 
## subject related codes for the test data.
setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)
##alldata2 <- cbind.data.frame(subject_test,x_test)

## I load the relevant library to be used in the execution of the code
library(plyr);library(dplyr);library(Hmisc);library(stringr)
## Here a column in the training and test dataset are added to reflect the data source
## This column is called dClass which I rename later to test_train
train <- mutate(x_train, dClass="1")
test <- mutate(x_test, dClass="2")

## The Subject datasets are combine to create one subject dataset
## The train and test datasets are combine to create one dataset
Subject <- rbind.data.frame(subject_test,subject_train)
alldata <- rbind.data.frame(test,train)

## Here the Column headings are read in from the features text file
setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset")
cols <- readLines("features.txt")

## The following comments removes the leading numbers from the column heading if that
## is required. I thought it best to keep them. However this is the script to remove 
## the leading numbers if desired
##cols1 <- strsplit(cols,"\\ ")
##second_element <- function(x){x[2]}
##cols2 <- sapply(cols1, second_element)

## Naming the additional field test_train and cleaning the variable names
cols3 <- c(cols,"test_train")
cols4 <- gsub(" ","",cols3)
cols5 <- gsub("-","_",cols4)
cols6 <- tolower(cols5)
cols7 <- str_replace_all(cols6, "([()])", "")
cols8 <- str_replace_all(cols7, "([,])", "_")
#cols6 <- gsub(")","",cols5)
#cols7 <- gsub("(","",cols6)

##Applying the cleaned field names to the alldata data frame created previously
colnames(alldata) <- cols8

##Column bind the Subject and the alldata(containing test and training data) datasets
##then convert activity and test_train into factor variables then apple 
##Variable labels and value labels to each of these columns
allData <- cbind.data.frame(Subject,alldata)
allData$test_train <- factor(allData$test_train, levels = c(1,2), labels = c("TRAIN","TEST"))
allData$V1 <- factor(allData$V1, levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
label(allData$V1) <- "Activity Label"
label(allData$test_train) <- "Whether Testing or Training"

##select the fields with mean and std in their column names and store to a dataframe
allMeansStd <- select(allData, (contains("mean") || contains("std")))

##create second tidy data dataset as required
Tidy2nd <- allMeansStd %>% group_by(V1, test_train) %>% summarise_each(funs(mean))
write.table(Tidy2nd, file="Tidy2nd.txt", row.name=FALSE)
head(Tidy2nd,6)