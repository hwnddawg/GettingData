#  README.txt file for script - run_analysis.R 
###  course project for - Getting and Cleaning Data 


##  0.  Before Starting  -- 

###  Data file location - 

	As indicated in the project instructions, it is assumed that the requisite data has been downloaded and unzipped into the same working directory as the run_analysis.R script.  Thus the files in getdata_projectfiles_UCI HAR Dataset.zip from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip should already have been unzipped and unpacked into the user's working directory where this script also resides.  

	The run_analysis.R script does test for the existence of the "UCI HAR Dataset" sub-directory and will exit with an error if this directory is not found. 

###  Required libraries - 

	The final version of this script requires the "plyr" package and will fail if the library is not available when called.  



##  1.  Merge the Train and Test datasets -- 

	Nothing exceptional here, files are read into memory then merged.  Only the merged datasets are retained.  

	Note:  In the actual script at the end of each sub-section, there will be housekeeping and debugging code which may be ignored. 




##  2.  Extract only the measurements on the Mean and Standard Deviation --
###  Only columns/variables with "mean()" and "std()" included - 

	Out of the original 561 attibutes, 66 columns/variables with "mean()" and "std()" towards the end of their label (column name) are included/selected.  

	Deliberately omitted and filtered-out are those columns/variables where "Mean" is capitalized or falls in the middle of the label without following parens, and "meanFreq" columns/variables.  This in order to jibe with the consistency in the labelling conventions used by the original data collectors. 

	The resulting extracted dataset "x_extract_df" (in memory) thus includes 66 data variable columns and 10,299 observations/rows (plus 1 header row).  




##  3.  Use descriptive Activity Names -- 

	Straightforward replacement of the activity codes in the merged "Y" data with the descriptive names provided in "activity_labels.txt". 




##  4.  Appropriately label the data set -- 

	Minimalist changes to the original variable labels provided in the "features.txt" file in order to preserve the connection with and provde traceback to the original labels.  

###	The "standard" replacement character used is the underscore "_".  

	As per Teaching Assistant instructions on the forums, characters that must be replaced include: 

	*  parentheses, both open "(" and close ")" 
	*  dashes "-" 
	*  commas ","  (in case the dataset is saved in .csv format) 

	These edited column names/labels are then rewritten to the main "x" dataset's names. 

	After proper naming, the activity description and subject code files (both single column/v) are also merged (cbind) with the main "x" dataset. 




##  5.  Creates a tidy data set with the average of each variable for each activity and each subject -- 

###  Primary key is Activity, secondary key is Subject. 

	As there are 6 distinct Activities and 30 test Subjects, then 30 x 6 gives 180 unique observations/rows (plus 1 header row).  As there were 66 "mean()" or "std()" columns/variables selected, then including the single columns for Activity and Subject, there are 68 columns.  

	For proper results, the output file "tidy_data_set.txt" should be read with the header flag set to TRUE, e.g. ... 

###	tidy_df <- read.table("tidy_data_set.txt", header=TRUE)

