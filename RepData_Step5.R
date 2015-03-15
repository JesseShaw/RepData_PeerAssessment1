##STEP 5 - Reproducible Research Peer Review 1
##This script will compare activity between weekdays and weekends using df_imputed from Step4

##Load GGPlot2
library(ggplot2)

##Weekday Identification Function
type_day <- function(date){
        day_type <- weekdays(date)
        if (day_type %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
                return("weekday")
        else if (day_type %in% c("Saturday", "Sunday"))
                return("weekend")
        else
                stop("Bad Date Format")
}

##Convert Activity Date to Type DATE
df_imputed$date <- as.Date(df_imputed$date)

##Add Day Field Via type_day Function
df_imputed$day_type <- sapply(df_imputed$date, FUN = type_day)

##Aggregate Steps Per Day
df_steps_per_day_type_imputed <- aggregate(steps ~ interval+day_type, df_imputed, mean)

#Weekday And Weekend Panel Plot
step_panel <- ggplot(df_steps_per_day_type_imputed, aes(interval, steps))+geom_line()+ facet_grid(day_type ~ .) + 
        xlab("5 Minute Intervals") + 
        ylab("Number of Steps")

print(step_panel)