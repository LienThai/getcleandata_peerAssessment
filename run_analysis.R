
# Read in data table files
subj_train.df <- read.table(file="Dataset/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
x_train.df <- read.table(file="Dataset/UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train.df <- read.table(file="Dataset/UCI HAR Dataset/train/y_train.txt", header=FALSE)


# pick out column with mean and standard deviation forTRAIN set, the indexes are chosen by looking at the file features.txt
chosen_mean_idxs <- c(1,2,3,41,42,42,81,82,83,121,122,123,161,162,163,201,
                 214,227,240,253, 266,267,268,294,295,296,345,346,347,
                 373,374,375,424,425,426,452,453,454,503,513,516,526,529,
                 539,542,552,555,556,557,558,559,560,561)

chosen_std_idxs <- c(4,5,6,44,44,46,84,85,86,124,125,126,164,165,166,
                     202,215,228,241,254,269,270,271,348,349,350,427,428,429,
                     504,517,530,543)


chosen_idxs <- c(chosen_mean_idxs, chosen_std_idxs)
# str(features_names)

# read in features file to extract the respective column names
features_names <- readLines(con = 'Dataset/UCI HAR Dataset/features.txt')
col_names <- features_names[chosen_idxs]
# col_names

x_train.df <- x_train.df[,c(chosen_idxs)]
subj_train_mean.df <- subj_train.df
# remove number infront of feature names
fixed_col_names <- sapply(strsplit(col_names, split = " "), function(x){x[2]})
fixed_col_names

bind_train.df <- cbind(subj_train.df, x_train.df, y_train.df)
colnames(bind_train.df)[1] <- "Subject"
colnames(bind_train.df)[2:87] <- fixed_col_names
colnames(bind_train.df)[88] <- "ActivityType"
head(bind_train.df)
colnames(bind_train.df)


# pick out column with mean and standard Deviation for TEST set 
# Read in data table files
subj_test.df <- read.table(file="Dataset/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_test.df <- read.table(file="Dataset/UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test.df <- read.table(file="Dataset/UCI HAR Dataset/test/y_test.txt", header=FALSE)

x_test.df <- x_test.df[,c(chosen_idxs)]
subj_test_mean.df <- subj_test.df

bind_test.df <- cbind(subj_test.df, x_test.df, y_test.df)
colnames(bind_test.df)[1] <- "Subject"
colnames(bind_test.df)[2:87] <- fixed_col_names
colnames(bind_test.df)[88] <- "ActivityType"
head(bind_test.df)
colnames(bind_test.df)

bind_traintest.df <- rbind(bind_train.df, bind_test.df)

library(reshape2)
#Melt bind_train.df
completeData_melt.df <- melt(bind_traintest.df, id=c("Subject", "ActivityType")) #,measure.vars= fixed_col_names)

head(completeData_melt.df)

# compute the  tidy dataset
completeData_dcast.df <- dcast(completeData_melt.df, Subject + ActivityType~variable, mean)
length(colnames(completeData_dcast.df))
variable_names <- colnames(completeData_dcast.df)[3:length(colnames(completeData_dcast.df))]
# add average to feature names
variable_names <- paste0('average-', variable_names)
variable_names
colnames(completeData_dcast.df)[1] <- "Subject"
colnames(completeData_dcast.df)[2] <- "ActivityType"
colnames(completeData_dcast.df)[3:86] <- variable_names
head(completeData_dcast.df)
colnames(completeData_dcast.df)

# write the tidy dataset to the text file
write.table(completeData_dcast.df, 'tidy_dataset.txt')









