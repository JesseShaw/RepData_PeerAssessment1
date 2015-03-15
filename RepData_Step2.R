##STEP 2 - Reproducible Research Peer Review 1
##This script will explore the activity data by generating a histogram of 
##complete cases and calcualte base statistics.

##Remove NAs from df in Step 1
df_no_NA <- na.omit(df)

##Aggregate Total Steps Per Day
df_steps_per_day <- aggregate(steps ~ date, df_no_NA, sum)

#Create Histogram
hist(df_steps_per_day$steps, 
     col=1, 
     main="ACTIVITY MONITORING (STEPS)",
     breaks=10,
     xlab="Total Steps Per Day")

#Calculate Mean And Median Steps Per Day
ave_steps <- mean(df_steps_per_day$steps)
median_steps <- median(df_steps_per_day$steps)