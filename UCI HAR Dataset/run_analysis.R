##Getting and Cleaning Data Course Project
##Authot jguzmant
##Date May 7 2020
##Base version

##@knitr ReadFiles

library(reshape2)

#Locate at Course Project Folder
setwd("UCI HAR Dataset")

#Open Files
#Train files
Xtrain <- read.table("train//X_train.txt")
Ytrain <- read.table("train//Y_train.txt")
Strain <- read.table("train//subject_train.txt")


#Test files
Xtest <- read.table("test//X_test.txt")
Ytest <- read.table("test//Y_test.txt")
Stest <- read.table("test//subject_test.txt")


#Label files
FeatsLabels <- read.table("features.txt")
ActivitiesLabels <- read.table("activity_labels.txt")


##@knitr MergeSets

#Merge both train and test sets
X <- rbind(Xtrain,Xtest)
Y <- rbind(Ytrain,Ytest)
S <- rbind(Strain,Stest)

#Get rid of files, keep data frames in memory
rm("Xtrain","Xtest","Ytrain","Ytest","Strain","Stest")

#Look up for Fields of mean and standar deviation in features Dataset
Fields<-grep("mean\\(|std\\(",FeatsLabels$V2)

##@knitr LookUpFields

#Filter Fields of mean and standar deviation from X, Y remains the same
XValues <- X[,Fields]
FieldNames <- FeatsLabels[Fields,2]
FieldNames <- gsub("-std\\(\\)-?","StdDev",FieldNames)
FieldNames <- gsub("-mean\\(\\)-?","Mean",FieldNames)

VectorY <- unlist(Y)

Activities <- as.vector(factor(VectorY,levels = ActivitiesLabels$V1,labels = ActivitiesLabels$V2))

##@knitr CreateDataSets

MergedDataSet <- cbind(S,Activities,XValues)

#Rename fields according to their description
colnames(MergedDataSet)<-c("Subject","Activity",FieldNames)

#Summarize MergedDataSet by Subject and Activity 

SummarizedData <- melt(MergedDataSet,id = c("Subject","Activity"))


#Create independent tidyDS

OutTidyDS <- dcast(SummarizedData, Subject + Activity ~ variable, mean)


#Create files 
write.table(MergedDataSet, "./Full_DS.txt", row.names = FALSE, quote = FALSE)
write.table(OutTidyDS, "./AVG_Activity_Subject_DS.txt", row.names = FALSE, quote = FALSE)

#Remove all temp objects, we have our out files

setwd("..")
#rm("Activities","ActivitiesLabels","FeatsLabels","FieldNames","Fields","MergedDataSet","OutTidyDS","S","Y","SummarizedData","VectorY","X","XValues")

print("Please Check Full_DS.txt and AVG_Activity_Subject_DS.txt files, process done")
print("If you whish to debug a little, please comment previous rm line and ls()")
