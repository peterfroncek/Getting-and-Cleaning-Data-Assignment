# Getting-and-Cleaning-Data-Assignment

The R script included in this repository takes the original UCI HAR Dataset and produce a new clean tidy dataset from it. 

1. The variable (feature) measurements are concatenated with their subject and activity identifier (1st and 2nd column respectively) in both the training and test sets
2. The merged test and training data sets are concatenated along their rows to create one large set of measurements.
3. Only the columns regarding the mean and the st. dev. of each type of measurement are retained in the data set
4. The activity labels (2nd column) are replaced with their names.
5. The columns are labeled by their names (accroding to R variable naming standards)
6. The dataset was then grouped by subject and by acitvity, and observations within each subject-activity group was then summarized by its mean as a single observation, thus finally producing 180 observations of 81 variables each.
