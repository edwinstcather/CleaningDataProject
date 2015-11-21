setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)
##alldata1 <- cbind.data.frame(subject_train,x_train)

setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)
##alldata2 <- cbind.data.frame(subject_test,x_test)

library(plyr);library(dplyr);library(Hmisc);library(stringr)
train <- mutate(x_train, dClass="1")
test <- mutate(x_test, dClass="2")

Subject <- rbind.data.frame(subject_test,subject_train)
alldata <- rbind.data.frame(test,train)

setwd("C:/Users/Edwin/Documents/R/UCI HAR Dataset")
cols <- readLines("features.txt")
##cols1 <- strsplit(cols,"\\ ")
##second_element <- function(x){x[2]}
##cols2 <- sapply(cols1, second_element)
cols3 <- c(cols,"test_train")
cols4 <- gsub(" ","",cols3)
cols5 <- gsub("-","_",cols4)
cols6 <- tolower(cols5)
cols7 <- str_replace_all(cols6, "([()])", "")
cols8 <- str_replace_all(cols7, "([,])", "_")
#cols6 <- gsub(")","",cols5)
#cols7 <- gsub("(","",cols6)
colnames(alldata) <- cols8
allData <- cbind.data.frame(Subject,alldata)
allData$test_train <- factor(allData$test_train, levels = c(1,2), labels = c("TRAIN","TEST"))
allData$V1 <- factor(allData$V1, levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
label(allData$V1) <- "Activity Label"
label(allData$test_train) <- "Whether Testing or Training"
allstd <- select(allData, contains("std"))
allmeans <- select(allData, contains("mean"))
Tidy2nd <- allData %>% group_by(V1, test_train) %>% summarise_each(funs(mean))
head(Tidy2nd)