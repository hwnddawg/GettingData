###  run_analysis.R - Getting and Cleaning Data Course Project
###  (kindly refer to "README.md" file for more details) 




run_analysis <- function()

{




##  0.  Check if data directories and files exist, exit if not. 

	#  This simplified version assumes that the data files from 
	#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	#  have been downloaded and properly unzipped into the working directory. 
	#
	if (!file.exists("UCI HAR Dataset")) 
	{  stop("UCI HAR Dataset not found!") }




##  1.  Merges the training and the test sets to create one data set.

	#  read data files
	#
	x_train_txt		<- read.table("UCI HAR Dataset/train/X_train.txt")
	x_test_txt		<- read.table("UCI HAR Dataset/test/X_test.txt")
	y_train_txt       	<- read.table("UCI HAR Dataset/train/y_train.txt")
	y_test_txt        	<- read.table("UCI HAR Dataset/test/y_test.txt")
	subject_train_txt	<- read.table("UCI HAR Dataset/train/subject_train.txt")
	subject_test_txt	<- read.table("UCI HAR Dataset/test/subject_test.txt")

	#  merge training and test sets
	#
	x_merged_df		<- rbind(x_train_txt, x_test_txt)
	y_merged_df		<- rbind(y_train_txt, y_test_txt) 
	subject_merged_df	<- rbind(subject_train_txt, subject_test_txt) 


	#  housekeeping & debugging  (please feel free to ignore this subsection :) 
	#
	rm(list = c("x_train_txt", "y_train_txt", "subject_train_txt")) 
	rm(list = c( "x_test_txt",  "y_test_txt",  "subject_test_txt")) 
	gc()
	#
#	str(x_merged_df)
#	str(y_merged_df)
#	str(subject_merged_df)
#	print("***  completed phase 1  ***")




##  2.  Extracts only the 
##	measurements on the mean and standard deviation (columns)
##      for each measurement/[observation] (row). 

	#  read the column labels from the features file
	#  then apply to the big "x merged" dataset's columns
	#
	features_txt <- read.table("UCI HAR Dataset/features.txt")
	colnames(x_merged_df) <- features_txt[,2]
	
	#  create a logical list (flags) for columns with "mean()" and "std()" 
	#
	temp_cols <- grepl("mean|std", features_txt[,2])
	not_cols  <- logical(length = length(features_txt[,2]))
	#  comment-out the following (kludge :) line if you want to include "meanFreq" 
	not_cols  <- grepl("meanFreq", features_txt[,2])
	true_cols <- temp_cols & !not_cols

	#  extract/subset from big "x merged" only the columns required by the spec
	# 
	x_extract_df <- x_merged_df[, true_cols] 


	#  housekeeping & debugging  (please feel free to ignore this subsection :) 
	#
	rm(list = c("x_merged_df", "features_txt"))
	rm(list = c("temp_cols", "not_cols", "true_cols"))
	gc()
	#
#	str(x_extract_df)
#	print("***  completed phase 2  ***")




##  3.  Uses descriptive activity names to name the activities in the data set

	#  read the activity label file
	#
	activity_labels_txt <- read.table("UCI HAR Dataset/activity_labels.txt")

	#  replace activity code with activity description 
	#
	y_act_labels <- data.frame(activity_labels_txt[y_merged_df[,1], 2])
	

	#  housekeeping & debugging  (please feel free to ignore this subsection :) 
	#
	rm(list = c("y_merged_df", "activity_labels_txt"))
	gc()
	#
#	str(y_act_labels)
#	print("***  completed phase 3  ***")




##  4.  Appropriately labels the data set with descriptive variable names. 

	#  edit/label dataset with descriptive variable names 
	#  (remove/replace parens, commas, etc.)
	#  
	temp_var_labels <- names(x_extract_df) 
	temp_var_labels <- gsub("\\(", "_", temp_var_labels) 
	temp_var_labels <- gsub("\\)", "_", temp_var_labels)
 	temp_var_labels <- gsub("-", "_",   temp_var_labels) 
 	temp_var_labels <- gsub(",", "_",   temp_var_labels) 
	colnames(x_extract_df) <- temp_var_labels
	meas_vars <- names(x_extract_df)

	#  name the columns for the activity code "y" and subject code "subject" files
	#
	colnames(y_act_labels) 		<- "activity_desc"	#  from 1:6
	colnames(subject_merged_df) 	<- "subject_code"	#  1:30
	id_vars <- c(names(y_act_labels), names(subject_merged_df))

	#  now that their columns are properly named, 
	#  might as well cbind them all into the big kahuna 
	# 
	allin_df <- cbind(y_act_labels, subject_merged_df, x_extract_df) 


#  housekeeping & debugging  (please feel free to ignore this subsection :) 
	#
	rm(list = c("temp_var_labels", "y_act_labels"))
	rm(list = c("x_extract_df",  "subject_merged_df"))
	gc()
	#
#	print(ls())
#	str(allin_df)
#	write.table(allin_df, "allin_df.txt", row.names = FALSE)
#	write.csv(allin_df, "allin_df.csv", row.names = FALSE)
#	print("***  completed phase 4  ***")




##  5.  Creates a second, independent tidy data set  
##      with the average of each variable for each activity and each subject. 

	tidy_data_set <- data.frame()

	#  these DON'T work -- 
	#
	# id_vars <- list(id_vars)
	# tidy_data_set <- aggregate(allin_df[,meas_vars], by=id_vars, FUN=mean)
	# tidy_data_set <- aggregate.data.frame(allin_df, by=id_vars, FUN=mean)

	#  ran to completion, but looks bad -- 
	#
	# library(reshape2) 
	# melted_df <- melt(allin_df, id=id_vars, measure.vars=meas_vars)
	# tidy_data_set <- dcast(melted_df, id_vars ~ variable, mean) 

	#  Average variables for each activity and subject  --
	#  (this looks good and it checks with the forums, but not sure)  
	#
	library(plyr)
	tidy_data_set <- ddply(allin_df, .(activity_desc, subject_code), function(x) colMeans(x[,3:68]))

	#  Write tidy data set  --  
	#
	write.table(tidy_data_set, "tidy_data_set.txt", row.names = FALSE)



#  housekeeping & debugging  (please feel free to ignore this subsection :) 
	#
	gc()
	#
#	write.csv(tidy_data_set, "tidy_data_set.csv", row.names = FALSE)
#	str(tidy_data_set)
#	print("***  completed phase 5  ***")

}