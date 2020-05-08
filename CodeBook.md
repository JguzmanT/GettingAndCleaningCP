---
title: "Getting and Cleaning Data Course Project"
output: pdf_document
---

# Data

This project contains data from serveral sources:

- Subjects(People who participated in the experiment)
- Observations(test and train files)
- Activity Labels(each subject was monitored during six different times)
- Feature Labels(Mean and Standard Deviations of the observations)


Additionaly data was in different sets, since the original intention was to test a SVM model, which needs:

- Test Data
- Train Data

# Output Files

- MergedDataSet ('data.frame':	10299 obs. of  68 variables:)

 [1] "Subject"                    "Activity"                  
 [3] "tBodyAccMeanX"              "tBodyAccMeanY"             
 [5] "tBodyAccMeanZ"              "tBodyAccStdDevX"           
 [7] "tBodyAccStdDevY"            "tBodyAccStdDevZ"           
 [9] "tGravityAccMeanX"           "tGravityAccMeanY"          
[11] "tGravityAccMeanZ"           "tGravityAccStdDevX"        
[13] "tGravityAccStdDevY"         "tGravityAccStdDevZ"        
[15] "tBodyAccJerkMeanX"          "tBodyAccJerkMeanY"         
[17] "tBodyAccJerkMeanZ"          "tBodyAccJerkStdDevX"       
[19] "tBodyAccJerkStdDevY"        "tBodyAccJerkStdDevZ"       
[21] "tBodyGyroMeanX"             "tBodyGyroMeanY"            
[23] "tBodyGyroMeanZ"             "tBodyGyroStdDevX"          
[25] "tBodyGyroStdDevY"           "tBodyGyroStdDevZ"          
[27] "tBodyGyroJerkMeanX"         "tBodyGyroJerkMeanY"        
[29] "tBodyGyroJerkMeanZ"         "tBodyGyroJerkStdDevX"      
[31] "tBodyGyroJerkStdDevY"       "tBodyGyroJerkStdDevZ"      
[33] "tBodyAccMagMean"            "tBodyAccMagStdDev"         
[35] "tGravityAccMagMean"         "tGravityAccMagStdDev"      
[37] "tBodyAccJerkMagMean"        "tBodyAccJerkMagStdDev"     
[39] "tBodyGyroMagMean"           "tBodyGyroMagStdDev"        
[41] "tBodyGyroJerkMagMean"       "tBodyGyroJerkMagStdDev"    
[43] "fBodyAccMeanX"              "fBodyAccMeanY"             
[45] "fBodyAccMeanZ"              "fBodyAccStdDevX"           
[47] "fBodyAccStdDevY"            "fBodyAccStdDevZ"           
[49] "fBodyAccJerkMeanX"          "fBodyAccJerkMeanY"         
[51] "fBodyAccJerkMeanZ"          "fBodyAccJerkStdDevX"       
[53] "fBodyAccJerkStdDevY"        "fBodyAccJerkStdDevZ"       
[55] "fBodyGyroMeanX"             "fBodyGyroMeanY"            
[57] "fBodyGyroMeanZ"             "fBodyGyroStdDevX"          
[59] "fBodyGyroStdDevY"           "fBodyGyroStdDevZ"          
[61] "fBodyAccMagMean"            "fBodyAccMagStdDev"         
[63] "fBodyBodyAccJerkMagMean"    "fBodyBodyAccJerkMagStdDev" 
[65] "fBodyBodyGyroMagMean"       "fBodyBodyGyroMagStdDev"    
[67] "fBodyBodyGyroJerkMagMean"   "fBodyBodyGyroJerkMagStdDev"

- OutTydyDS (180 obs. of  68 variables)

# Mappings

According to the request, the following was done:

- Join Test and Train Sets.- This was done using rbind function to add the rows from one set to the base data set.

- LookUp for Mean and Standard Deviation variables.- Grep functions to obtain both kind of variables(e.g. grep("mean()|std()",FeaturesSet)) 

- Change Column names.- A gsub function was used to change first the std() for StdDev and then to change mean() for Mean

- Replace index values for labels on Activity data set.- A factor function was applied to replace the index for the Label

- Merge all sets.- Since we have three Data sets(Subjects, Activities) 

