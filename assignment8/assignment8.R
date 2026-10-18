#1. Import Assignment 6 data
student6 <- read.table(file.choose(),
                       header = TRUE,
                       sep = ",",
                       stringsAsFactors = FALSE)

#Gender mean
library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

#2. Filter Names Containing “i”
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

#3. Export Filtered Dataset
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)