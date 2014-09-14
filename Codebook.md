#  CodeBook for script - run_analysis.R 
###  course project for - Getting and Cleaning Data 



##  Original Data  -- 

###  Human Activity Recognition Using Smartphones Data Set 	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*  Original number of instances (rows) = 10,299 (no header row) 
*  Original number of attributes (columns) = 561



##  run_analysis.R processing -- 

###  Selection - 

	Retained 6 activities and 30 subjects/volunteers.  Subjects coded as 1:30, activities as follows: 

	1 = WALKING

	2 = WALKING_UPSTAIRS

	3 = WALKING_DOWNSTAIRS

	4 = SITTING

	5 = STANDING

	6 = LAYING


	Extract only attributes/variables/columns with "mean()" and "std()" for processing.  Result 66 attributes/columns out of the original 561.  Selected attributes with original and revised column labels (names) follow: 

	  Original Labels		New/Edited Labels

	"tBodyAcc-mean()-X"		"tBodyAcc_mean___X"
	"tBodyAcc-mean()-Y"		"tBodyAcc_mean___Y"
	"tBodyAcc-mean()-Z"		"tBodyAcc_mean___Z"
	"tBodyAcc-std()-X"		"tBodyAcc_std___X"
	"tBodyAcc-std()-Y"		"tBodyAcc_std___Y"
	"tBodyAcc-std()-Z"		"tBodyAcc_std___Z"
	"tGravityAcc-mean()-X"		"tGravityAcc_mean___X"
	"tGravityAcc-mean()-Y"		"tGravityAcc_mean___Y"
	"tGravityAcc-mean()-Z"		"tGravityAcc_mean___Z"
	"tGravityAcc-std()-X"		"tGravityAcc_std___X"
	"tGravityAcc-std()-Y"		"tGravityAcc_std___Y"
	"tGravityAcc-std()-Z"		"tGravityAcc_std___Z"
	"tBodyAccJerk-mean()-X"		"tBodyAccJerk_mean___X"
	"tBodyAccJerk-mean()-Y"		"tBodyAccJerk_mean___Y"
	"tBodyAccJerk-mean()-Z"		"tBodyAccJerk_mean___Z"
	"tBodyAccJerk-std()-X"		"tBodyAccJerk_std___X"
	"tBodyAccJerk-std()-Y"		"tBodyAccJerk_std___Y"
	"tBodyAccJerk-std()-Z"		"tBodyAccJerk_std___Z"
	"tBodyGyro-mean()-X"		"tBodyGyro_mean___X"
	"tBodyGyro-mean()-Y"		"tBodyGyro_mean___Y"
	"tBodyGyro-mean()-Z"		"tBodyGyro_mean___Z"
	"tBodyGyro-std()-X"		"tBodyGyro_std___X"
	"tBodyGyro-std()-Y"		"tBodyGyro_std___Y"
	"tBodyGyro-std()-Z"		"tBodyGyro_std___Z"
	"tBodyGyroJerk-mean()-X"	"tBodyGyroJerk_mean___X"
	"tBodyGyroJerk-mean()-Y"	"tBodyGyroJerk_mean___Y"
	"tBodyGyroJerk-mean()-Z"	"tBodyGyroJerk_mean___Z"
	"tBodyGyroJerk-std()-X"		"tBodyGyroJerk_std___X"
	"tBodyGyroJerk-std()-Y"		"tBodyGyroJerk_std___Y"
	"tBodyGyroJerk-std()-Z"		"tBodyGyroJerk_std___Z"
	"tBodyAccMag-mean()"		"tBodyAccMag_mean__"
	"tBodyAccMag-std()"		"tBodyAccMag_std__"
	"tGravityAccMag-mean()"		"tGravityAccMag_mean__"
	"tGravityAccMag-std()"		"tGravityAccMag_std__"
	"tBodyAccJerkMag-mean()"	"tBodyAccJerkMag_mean__"
	"tBodyAccJerkMag-std()"		"tBodyAccJerkMag_std__"
	"tBodyGyroMag-mean()"		"tBodyGyroMag_mean__"
	"tBodyGyroMag-std()"		"tBodyGyroMag_std__"
	"tBodyGyroJerkMag-mean()"	"tBodyGyroJerkMag_mean__"
	"tBodyGyroJerkMag-std()"	"tBodyGyroJerkMag_std__"
	"fBodyAcc-mean()-X"		"fBodyAcc_mean___X"
	"fBodyAcc-mean()-Y"		"fBodyAcc_mean___Y"
	"fBodyAcc-mean()-Z"		"fBodyAcc_mean___Z"
	"fBodyAcc-std()-X"		"fBodyAcc_std___X"
	"fBodyAcc-std()-Y"		"fBodyAcc_std___Y"
	"fBodyAcc-std()-Z"		"fBodyAcc_std___Z"
	"fBodyAccJerk-mean()-X"		"fBodyAccJerk_mean___X"
	"fBodyAccJerk-mean()-Y"		"fBodyAccJerk_mean___Y"
	"fBodyAccJerk-mean()-Z"		"fBodyAccJerk_mean___Z"
	"fBodyAccJerk-std()-X"		"fBodyAccJerk_std___X"
	"fBodyAccJerk-std()-Y"		"fBodyAccJerk_std___Y"
	"fBodyAccJerk-std()-Z"		"fBodyAccJerk_std___Z"
	"fBodyGyro-mean()-X"		"fBodyGyro_mean___X"
	"fBodyGyro-mean()-Y"		"fBodyGyro_mean___Y"
	"fBodyGyro-mean()-Z"		"fBodyGyro_mean___Z"
	"fBodyGyro-std()-X"		"fBodyGyro_std___X"
	"fBodyGyro-std()-Y"		"fBodyGyro_std___Y"
	"fBodyGyro-std()-Z"		"fBodyGyro_std___Z"
	"fBodyAccMag-mean()"		"fBodyAccMag_mean__"
	"fBodyAccMag-std()"		"fBodyAccMag_std__"
	"fBodyBodyAccJerkMag-mean()"	"fBodyBodyAccJerkMag_mean__"
	"fBodyBodyAccJerkMag-std()"	"fBodyBodyAccJerkMag_std__"
	"fBodyBodyGyroMag-mean()"	"fBodyBodyGyroMag_mean__"
	"fBodyBodyGyroMag-std()"	"fBodyBodyGyroMag_std__"
	"fBodyBodyGyroJerkMag-mean()"	"fBodyBodyGyroJerkMag_mean__"
	"fBodyBodyGyroJerkMag-std()"	"fBodyBodyGyroJerkMag_std__"


###  Processing - 

	For each of the selected attributes (columns) above, the mean is taken for each combination of (pair) Activity and Subject, with Activity as the primary and Subject as the secondary key. 



##  run_analysis.R output -- 

###  Output file "tidy_data_set.txt" - 

	As there are 6 distinct Activities and 30 test Subjects, then 30 x 6 gives 180 unique observations/rows (plus 1 header row).  As there were 66 "mean()" or "std()" columns/variables selected, then including the single columns for Activity and Subject, there are 68 columns.  

	Thus output file specifications: 

###  Output file number of instances (rows) = 180 (plus 1 header row) 

	Output rows: 

	1   =  Activity WALKING,  Subject # 1
	2   =  Activity WALKING,  Subject # 2
	3   =  Activity WALKING,  Subject # 3
	4   =  Activity WALKING,  Subject # 4
			.
			.
	29  =  Activity WALKING,  Subject # 29
	30  =  Activity WALKING,  Subject # 30
	31  =  Activity WALKING_UPSTAIRS,  Subject # 1
	32  =  Activity WALKING_UPSTAIRS,  Subject # 2
			.
			.
	60  =  Activity WALKING_UPSTAIRS,  Subject # 30
	61  =  Activity WALKING_DOWNSTAIRS,  Subject # 1
	62  =  Activity WALKING_DOWNSTAIRS,  Subject # 2
			.
			.
	90  =  Activity WALKING_DOWNSTAIRS,  Subject # 30
	91  =  Activity SITTING,  Subject # 1
	92  =  Activity SITTING,  Subject # 2
			.
			.
	120 =  Activity SITTING,  Subject # 30
	121 =  Activity STANDING,  Subject # 1
	122 =  Activity STANDING,  Subject # 2
			.
			.
	150 =  Activity STANDING,  Subject # 30
	151 =  Activity LAYING,  Subject # 1
	152 =  Activity LAYING,  Subject # 2
			.
			.
	180 =  Activity LAYING,  Subject # 30


###  Output file number of attributes (columns) = 68 (the mean of 66 selected variables, plus 1 column each for Activity and Subject). 

	Output columns: 

	1  =  "activity_desc"		:  Factor with 6 levels
	2  =  "subject_code"		:  Integer (1:30)
	3  =  "tBodyAcc_mean___X"	:  Numeric
	4  =  "tBodyAcc_mean___Y"	:  Numeric
	5  =  "tBodyAcc_mean___Z"	:  Numeric
	6  =  "tBodyAcc_std___X"	:  Numeric
	7  =  "tBodyAcc_std___Y"	:  Numeric
	8  =  "tBodyAcc_std___Z"	:  Numeric
	9  =  "tGravityAcc_mean___X"	:  Numeric
	10 =  "tGravityAcc_mean___Y"	:  Numeric
	11 =  "tGravityAcc_mean___Z"	:  Numeric
	12 =  "tGravityAcc_std___X"	:  Numeric
	13 =  "tGravityAcc_std___Y"	:  Numeric
	14 =  "tGravityAcc_std___Z"	:  Numeric
	15 =  "tBodyAccJerk_mean___X"	:  Numeric
	16 =  "tBodyAccJerk_mean___Y"	:  Numeric
	17 =  "tBodyAccJerk_mean___Z"	:  Numeric
	18 =  "tBodyAccJerk_std___X"	:  Numeric
	19 =  "tBodyAccJerk_std___Y"	:  Numeric
	20 =  "tBodyAccJerk_std___Z"	:  Numeric
	21 =  "tBodyGyro_mean___X"	:  Numeric
	22 =  "tBodyGyro_mean___Y"	:  Numeric
	23 =  "tBodyGyro_mean___Z"	:  Numeric
	24 =  "tBodyGyro_std___X"	:  Numeric
	25 =  "tBodyGyro_std___Y"	:  Numeric
	26 =  "tBodyGyro_std___Z"	:  Numeric
	27 =  "tBodyGyroJerk_mean___X"	:  Numeric
	28 =  "tBodyGyroJerk_mean___Y"	:  Numeric
	29 =  "tBodyGyroJerk_mean___Z"	:  Numeric
	30 =  "tBodyGyroJerk_std___X"	:  Numeric
	31 =  "tBodyGyroJerk_std___Y"	:  Numeric
	32 =  "tBodyGyroJerk_std___Z"	:  Numeric
	33 =  "tBodyAccMag_mean__"	:  Numeric
	34 =  "tBodyAccMag_std__"	:  Numeric
	35 =  "tGravityAccMag_mean__"	:  Numeric
	36 =  "tGravityAccMag_std__"	:  Numeric
	37 =  "tBodyAccJerkMag_mean__"	:  Numeric
	38 =  "tBodyAccJerkMag_std__"	:  Numeric
	39 =  "tBodyGyroMag_mean__"	:  Numeric
	40 =  "tBodyGyroMag_std__"	:  Numeric
	41 =  "tBodyGyroJerkMag_mean__"	:  Numeric
	42 =  "tBodyGyroJerkMag_std__"	:  Numeric
	43 =  "fBodyAcc_mean___X"	:  Numeric
	44 =  "fBodyAcc_mean___Y"	:  Numeric
	45 =  "fBodyAcc_mean___Z"	:  Numeric
	46 =  "fBodyAcc_std___X"	:  Numeric
	47 =  "fBodyAcc_std___Y"	:  Numeric
	48 =  "fBodyAcc_std___Z"	:  Numeric
	49 =  "fBodyAccJerk_mean___X"	:  Numeric
	50 =  "fBodyAccJerk_mean___Y"	:  Numeric
	51 =  "fBodyAccJerk_mean___Z"	:  Numeric
	52 =  "fBodyAccJerk_std___X"	:  Numeric
	53 =  "fBodyAccJerk_std___Y"	:  Numeric
	54 =  "fBodyAccJerk_std___Z"	:  Numeric
	55 =  "fBodyGyro_mean___X"	:  Numeric
	56 =  "fBodyGyro_mean___Y"	:  Numeric
	57 =  "fBodyGyro_mean___Z"	:  Numeric
	58 =  "fBodyGyro_std___X"	:  Numeric
	59 =  "fBodyGyro_std___Y"	:  Numeric
	60 =  "fBodyGyro_std___Z"	:  Numeric
	61 =  "fBodyAccMag_mean__"	:  Numeric
	62 =  "fBodyAccMag_std__"	:  Numeric
	63 =  "fBodyBodyAccJerkMag_mean__"	:  Numeric
	64 =  "fBodyBodyAccJerkMag_std__"	:  Numeric
	65 =  "fBodyBodyGyroMag_mean__"	:  Numeric
	66 =  "fBodyBodyGyroMag_std__"	:  Numeric
	67 =  "fBodyBodyGyroJerkMag_mean__"	:  Numeric
	68 =  "fBodyBodyGyroJerkMag_std__"	:  Numeric


					-o0o-