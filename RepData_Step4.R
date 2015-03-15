##STEP 4 - Reproducible Research Peer Review 1
##This script will count the number of NA observations and then replace NAs with approximated values 
##by creating a function to impute them

##Subset NAs From df
df_NAs <- is.na(df$steps)

##Calculate The Number Of Missing Values
NA_values <- sum(df_NAs)

##Impute NAs Function
imputeNA <- function(steps, interval){
        imputed <- NA
        if (!is.na(steps))
                imputed <- c(steps)
        else
                imputed <- (df_mean_steps[df_mean_steps$interval==interval, "steps"])
        return(imputed)
}

##Copy df To df_imputed
df_imputed <- df

##Mapply imputeNA Function
df_imputed$steps <- mapply(imputeNA, df_imputed$steps, df_imputed$interval)

##Aggregate Total Steps Per Day
df_steps_per_day_imputed <- aggregate(steps ~ date, df_imputed, sum)

##Create Histogram
hist(df_steps_per_day_imputed$steps, 
     col=1, 
     main="ACTIVITY MONITORING (STEPS w/IMPUTED)",
     breaks=10,
     xlab="Total Steps Per Day")

#Calculate Mean And Median Steps Per Day
ave_steps_imputed <- mean(df_steps_per_day_imputed$steps)
median_steps_imputed <- median(df_steps_per_day_imputed$steps)