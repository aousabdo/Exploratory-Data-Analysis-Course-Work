## Ignore warnings
options(warn=-1)
## Read the first ten entries for now
df <- read.csv("./household_power_consumption.txt", na.strings="?" , sep=";", nrow=10)
Names <- names(df)

## we can see that the first entry is on 2006-12-16 17:24:00, we'll call that t_min
t_min <- "2006-12-16 17:24:00"

## now let's calculate the time difference between this and Feb 1 2007
t_initial <- "2007-02-01 00:00:00"
t_diff    <- ymd_hms(t_initial) - ymd_hms(t_min)

## t_diff is in days = 46.275, convert to minutes
t_diff_min <- t_diff * 24*60

## t_diff_min represent the numbe of rows we are going to skip, each raw is one minutes
## Now we need to read rows for two days
rows_max <- 2*24*60

## so we are going to skip the first 66637 rows and read the next 2880 rows
df <- read.csv("./household_power_consumption.txt", na.strings="?" ,
               sep=";",  skip=66637, nrow=2880)
names(df) <- Names

## now we need to merge the Date and Time columns and 
## save them in the correct format
date_time <- with(df, paste(Date, Time))
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")


tempdf  <- data.frame(Date_Time=date_time)
df      <- cbind(df, tempdf)



