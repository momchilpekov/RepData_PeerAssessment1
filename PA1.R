conn="activity.zip"
data <- read.csv(unz(conn, "activity.csv"), header=TRUE ,sep=",")
# Dates as dates
data$date <- as.Date(data$date, "%Y-%m-%d")
dataSum<-aggregate(steps~date, data=data, sum)
#histogram of steps by days
hist(dataSum$steps)
## What is mean total number of steps taken per day?
# mean
mean(dataSum$steps)

#median
median(dataSum$steps)

## What is the average daily activity pattern?

dataSum<-aggregate(steps~interval, data=data, mean)
averageAllDays<-mean(data$steps, na.rm=T)

plot( dataSum$interval,dataSum$steps, type="l")
title("steps averaged by dates")

#interval with largest averaged steps 
dataSum$interval[which.?max(dataSum$steps)]

#number of NAs
sum(is.na(data))


f<-function(d,dataSum){
        if d$steps==NA{
                d$steps<-dataSum[dataSum$interval==d$interval, ]$steps
        }
}

lapply(data, f)