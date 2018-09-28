# Read in the data
df <- read.table("yob2016.txt",sep=";", stringsAsFactors = FALSE)
names(df) <- c("Name", "Sex", "Count")

# Display the data
summary(df)
str(df)

# Find the misspelled name and it's index
grep("yyy$", df$Name, value=TRUE)
grep("yyy$", df$Name)

# Make a new data frame without this observation
y2016 <- df[-grep("yyy$", df$Name),]


# Read in the other data set
y2015 <- read.table("yob2015.txt", sep=",", header = FALSE)
names(y2015) <- c("Name", "Sex", "Count")

# Display the last 10 rows
tail(y2015,10)

# Merge the 2 data frames together at Name
final <- merge(y2016, y2015, by= "Name")


# Add a new column called Total
final$Total <- final$Count.x + final$Count.y
summary(final$Total)

# Sort by descending Total value
final <- final[order(-final$Total),]
head(final, 10)

# Weed out the boys
girls <- final[which(final$Sex.x=="F" & final$Sex.y=="F"),]
head(girls, 10)
girls2 <- data.frame(Name= girls$Name, Count= girls$Total)
write.csv(girls2, "Girl_names.csv")