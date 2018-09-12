---
title: "Doing Data Science Live Session 03 Assignment"
author: "Drew Wilkins"
date: "September 11, 2018"
output: 
  html_document:
    keep_md: true
---

# Question 1:

GitHub Cloning (20 points): Using Git, clone the following GitHub repository to your local machine: https://github.com/caesar0301/awesome-public-datasets. In RMarkdown, please show the code (commented out, as it's not R syntax) that you used to create a new directory, navigate to the appropriate directory, and clone the
repository to it. One Git command per line, please.


```r
# cd Data\ Science\ Masters/Doing\ Data\ Science/Homework/Homework\ 3/
# mkdir Live\ Session\ 03\ Assignment/
# cd Live\ Session\ 03\ Assignment/
# git init
# git clone https://github.com/caesar0301/awesome-public-datasets
```

# Question 2:

a. In R, please read in titanic.csv via either read.table() or read.csv(), assigning it to df. This dataset follows the passengers aboard the Titanic, including their fees paid, rooms rented, and survivorship status.


```r
# Navigate to the proper working directory and load in the .csv
setwd("C:/Users/Andrew/Documents/Data Science Masters/Doing Data Science/Homework/Homework 3")
df <- read.csv("Live Session 03 Assignment/DataSets/titanic.csv")
```

b. Output the respective count of females and males aboard the Titanic. Plot the frequency of females and males. Be sure to give an accurate title and label the axes.


```r
# Table will display the counts.
table(df$Sex)
```

```
## 
## female   male 
##    314    577
```

```r
plot(df$Sex, xlab="Sex", ylab="Frequency", main= "Male and Female Frequency")
```

![](HW3_files/figure-html/Q2b-1.png)<!-- -->

c. Please use one apply function (to review: swirl() modules 11, 12) to output the means of Age, Fare, and Survival. Make sure the output is a real number for all three means.


```r
# A custom function is necessary to remove the NA values
vapply(list(df$Age, df$Fare, df$Survived), function(x){mean(x, na.rm=TRUE)}, numeric(1))
```

```
## [1] 29.6991176 32.2042080  0.3838384
```

# Question 3:

a. Create objects for the median Age, the minimum and maximum Duration of sleep, and the mean and standard deviation of the Rosenberg Self Esteem scale (RSES). You may need to specify a few options like in Problem 2 and live session.


```r
# Make a new function that performs the requested operations
Helper <- function(data){
  MedianAge <- median(sleep$Age, na.rm=TRUE)
  MinDuration <- min(sleep$Duration, na.rm=TRUE)
  MaxDuration <- max(sleep$Duration, na.rm=TRUE)
  MeanRSES <- mean(sleep$RSES, na.rm = TRUE)
  SDRSES <- sd(sleep$RSES, na.rm= TRUE)
}
```

b. Create a data.frame object called report: it should consist of the median age, the RSES mean and standard deviation respectively divided by five (since there are five questions and these scores are summed), and the range of Duration (the statistical definition of range; it should be a single number.)


```r
# Create the data.frame within the function
Helper <- function(data){
  MedianAge <- median(sleep$Age, na.rm=TRUE)
  MinDuration <- min(sleep$Duration, na.rm=TRUE)
  MaxDuration <- max(sleep$Duration, na.rm=TRUE)
  MeanRSES <- mean(sleep$RSES, na.rm = TRUE)
  SDRSES <- sd(sleep$RSES, na.rm= TRUE)
  report <- data.frame(medAge= MedianAge, meanRSES= MeanRSES, SDRSES= SDRSES, rangeDur= MaxDuration - MinDuration)
}
```

c. Change the column names of this data.frame to MedianAge, SelfEsteem, SE_SD, and DurationRange.


```r
# Change the names of the columns
Helper <- function(data){
  MedianAge <- median(sleep$Age, na.rm=TRUE)
  MinDuration <- min(sleep$Duration, na.rm=TRUE)
  MaxDuration <- max(sleep$Duration, na.rm=TRUE)
  MeanRSES <- mean(sleep$RSES, na.rm = TRUE)
  SDRSES <- sd(sleep$RSES, na.rm= TRUE)
  report <- data.frame(medAge= MedianAge, meanRSES= MeanRSES, SDRSES= SDRSES, rangeDur= MaxDuration - MinDuration)
  names(report) <- c("MedianAge", "SelfEsteem", "SE_SD", "DurationRange")
}
```

d. Round the report to at most 2 digits: leave this as the closing line to the function.


```r
# Finally, round the results to 2 decimal places
Helper <- function(data){
  MedianAge <- median(sleep$Age, na.rm=TRUE)
  MinDuration <- min(sleep$Duration, na.rm=TRUE)
  MaxDuration <- max(sleep$Duration, na.rm=TRUE)
  MeanRSES <- mean(sleep$RSES, na.rm = TRUE)
  SDRSES <- sd(sleep$RSES, na.rm= TRUE)
  report <- data.frame(medAge= MedianAge, meanRSES= MeanRSES, SDRSES= SDRSES, rangeDur= MaxDuration - MinDuration)
  names(report) <- c("MedianAge", "SelfEsteem", "SE_SD", "DurationRange")
  round(report, 2)
}
```

e. Finally, run the function on your sleep data to show the output.


```r
# Read in the .csv and call our new function
sleep <- read.csv("Live Session 03 Assignment/DataSets/sleep_data_01.csv")
Helper(sleep)
```

```
##   MedianAge SelfEsteem SE_SD DurationRange
## 1        14      18.11  6.18             7
```

# Question 4

a. Install the fivethirtyeight package.  (Done)

b. In the listing of Data sets in package 'fivethirtyeight,' assign the 22nd data set to an object 'df.'


```r
# load in the package and find the 22nd data set
library(fivethirtyeight)
dataSetName <- as.character(data(package="fivethirtyeight")$results[22,"Item"])
data(list= dataSetName, package="fivethirtyeight")
df <- get(dataSetName)
dataSetName
```

```
## [1] "college_recent_grads"
```

c. Use a more detailed list of the data sets to write out the URL in a comment to the related news story.


```r
# Not sure what the "related news story" is all about...

#https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/
```

d. Using R command(s), give the dimensions and column names of this data frame.


```r
dim(df)
```

```
## [1] 173  21
```

```r
colnames(df)
```

```
##  [1] "rank"                        "major_code"                 
##  [3] "major"                       "major_category"             
##  [5] "total"                       "sample_size"                
##  [7] "men"                         "women"                      
##  [9] "sharewomen"                  "employed"                   
## [11] "employed_fulltime"           "employed_parttime"          
## [13] "employed_fulltime_yearround" "unemployed"                 
## [15] "unemployment_rate"           "p25th"                      
## [17] "median"                      "p75th"                      
## [19] "college_jobs"                "non_college_jobs"           
## [21] "low_wage_jobs"
```

# Question 5

a. Write an R command that gives you the column names of the data frame. Right after that, write one that counts the number of columns but not rows. Hint: The number should match one of your numbers in Question 1d for dimensions.


```r
colnames(df)
```

```
##  [1] "rank"                        "major_code"                 
##  [3] "major"                       "major_category"             
##  [5] "total"                       "sample_size"                
##  [7] "men"                         "women"                      
##  [9] "sharewomen"                  "employed"                   
## [11] "employed_fulltime"           "employed_parttime"          
## [13] "employed_fulltime_yearround" "unemployed"                 
## [15] "unemployment_rate"           "p25th"                      
## [17] "median"                      "p75th"                      
## [19] "college_jobs"                "non_college_jobs"           
## [21] "low_wage_jobs"
```

```r
length(colnames(df))
```

```
## [1] 21
```

b. Generate a count of each unique major_category in the data frame. I recommend using libraries to help. To be clear, this should look like a matrix or data frame containing the major_category and the frequency it occurs in the dataset. Assign it to major_count.


```r
major_count<- as.data.frame(table(df$major_category))
major_count
```

```
##                                   Var1 Freq
## 1      Agriculture & Natural Resources   10
## 2                                 Arts    8
## 3               Biology & Life Science   14
## 4                             Business   13
## 5          Communications & Journalism    4
## 6              Computers & Mathematics   11
## 7                            Education   16
## 8                          Engineering   29
## 9                               Health   12
## 10           Humanities & Liberal Arts   15
## 11 Industrial Arts & Consumer Services    7
## 12                   Interdisciplinary    1
## 13                 Law & Public Policy    5
## 14                   Physical Sciences   10
## 15            Psychology & Social Work    9
## 16                      Social Science    9
```

c. To make things easier to read, put par(las=2) before your plot to make the text perpendicular to the axis. Make a barplot of major_count. Make sure to label the title with something informative (check the vignette if you need), label the x and y axis, and make it any color other than grey. Assign the major_category labels to their respective bar. Flip the barplot horizontally so that bars extend to the right, not upward. All of these options can be done in a single pass of barplot(). Note: It's okay if it's wider than the preview pane.


```r
par(las=2, fig= c(0,1,0,1), mar= c(5.1,16.1,4.1,2.1))
barplot(major_count$Freq,horiz= TRUE, main = "College Major Occurances", xlab= "Number of Occurances", ylab= "", col= 7, names.arg= major_count$Var1, axisnames = TRUE)
title(ylab= "Major Category", line=15)
```

![](HW3_files/figure-html/Q5c-1.png)<!-- -->

d. Write the fivethirtyeight data to a csv file. Make sure that it does not have row labels.


```r
write.csv(df, "Live Session 03 Assignment/DataSets/CollegeGrads.csv", row.names= FALSE)
```

# Question 6

a. Start a new repository on GitHub for your SMU MSDS homework. On your local device, make sure there is a directory for Homework at the minimum; you are welcome to add whatever you would like to this repo in addition to your requirements here. (Done)

b. Create a README.md file which explains the purpose of the repository, the topics included, the sources for the material you post, and contact information in case of questions. Remember, the one in the root directory should be general. You are welcome to make short READMEs for each assignment individually in other folders. (Done)

c. In one (or more) of the nested directories, post your RMarkdown script, HTML file, and data from 'fivethirtyeight.' Make sure that in your README or elsewhere that you credit fivethirtyeight in some way.

d. In your RMarkdown script, please provide the link to this GitHub so the grader can see it. (Done)


```r
# https://github.com/lavos84/SMU-MSDS-Homework/tree/master/Homework3
```
