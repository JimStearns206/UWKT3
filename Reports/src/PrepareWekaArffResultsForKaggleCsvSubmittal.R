# Script to read in ARFF file created by Weka modeler,
# atrip all attributes except the predicted classification (here, "WnvPresent"),
# add an Id column with a sequence number equal to the record number; and
# write as a CSV file.

wnvpTestFileNRecs <- 116293 # Records in test file supplied by Kaggle. Submission record cnt must match.
arffInFilename <- "working/testClassified02"
testClassified_df <- read.arff(paste0(arffInFilename, ".arff"))
stopifnot(nrow(testClassified_df) == wnvpTestFileNRecs)

Id <- seq(1:wnvpTestFileNRecs)
colsToKeep <- c("predicted WnvPresent")
testClassified_df <- cbind(Id, testClassified_df[names(testClassified_df) %in% colsToKeep])
names(testClassified_df) <- c("Id", "WnvPresent")
# Write "No" as 0 and "Yes" as 1
testClassified_df$WnvPresent <- ifelse(testClassified_df$WnvPresent == "No", 0, 1)
str(testClassified_df)

write.csv(testClassified_df, paste0(arffInFilename, ".csv"), row.names=FALSE)
