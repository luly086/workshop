3

getwd()
setwd("~/Desktop/workshop/data")
getwd()
list.files()
read.csv(file = "inflammation-01.csv",header = FALSE)
a <- 3
a+5
weight_kg <- 55
weight_kg *2.2
weight_kg <- 57.5
weight_kg
weight_lb <- weight_kg * 2.2
data <- read.csv(file = "inflammation-01.csv",header = FALSE)
data
class(data)
getwd()
dim(data)
data[1,1]
data[30,20]
c(1,2,3)
data[c(1,3,5),c(10,20)]
data[1:4 , 1:10]
data[5:12,1:10]
data[1,]
data[,16:19]
data[,]
data[1,]
max(data[1,])
patient_1 <- data[1,]
max(patient_1)
min(data[,7])
median(data[,7])
sd(data[,7])
summary(data)
mean(data[,1])
mean(data[,2])
mean(data[,3])
#mean of every row
apply(data,1,mean)
#mean of every column
apply(data,2,mean)
a <- c(1,2,3)
a
a*3
animal <- c('m','o','n','k','e','y')
animal[1:3]
animal[4:6]
animal[6:4]
animal[-1]
head(data)
apply(data,2,mean)
avg_day_inflammation <- apply(data,2,mean)
plot(avg_day_inflammation)
max_day_inflammation <- apply(data,2,max)
plot(max_day_inflammation)
min_day_inflammation <- apply(data,2,min)
plot(min_day_inflammation)
sd_day_inflammation <- apply(data,2,sd)
plot(sd_day_inflammation)
mean(data[2,])
class(data[2,])
class(data[,2])
mean(as.integer(data[2,]))
# class is very important
class(as.integer(data[2,]))
as.integer(data[2,])
