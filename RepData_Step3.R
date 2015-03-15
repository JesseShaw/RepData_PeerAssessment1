##STEP 3 - Reproducible Research Peer Review 1
##This script will reduce data to days and generate an average 5 minute interval for all days
##df_no_NA is used from Step2 which has NAs ommitted

#Aggregate Average Steps And Calcualte Mean
df_mean_steps <- aggregate(steps ~ interval, df_no_NA, mean)

#Generate Line Plot
plot(df_mean_steps$interval, 
     df_mean_steps$steps, 
     type='l', 
     col=1, 
     main="", 
     xlab="5 Minute Intervals", 
     ylab="Average Steps")

##Observation With The Maximum Number Of Steps
max_steps <- df_mean_steps [which.max(df_mean_steps$steps), ]