# intro to r part 2
fahreheit_to_kelvin <- function(temp_F) {
  temp_K <- ((temp_F - 32) * (5/9)) + 273.15
  return(temp_K)
}
fahreheit_to_kelvin(100)

kelvin_to_celsius <- function(temp_K){
  temp_C <- temp_K -273.15
  return(temp_C)
}

kelvin_to_celsius(0)
temp_C

fahreheit_to_celsius <- function(temp_F){
  temp_K <- fahreheit_to_kelvin(temp_F)
  temp_C <- kelvin_to_celsius(temp_K)
  return(temp_C)
}

fahreheit_to_celsius(100)


# two arguments
sentence <- c("write","program","for","people","not","computers")
asterisk <- "***"
fence <- function(sentence,wrapper){
  answer <- c(wrapper,sentence,wrapper)
  return(answer)
}

fence(sentence,asterisk)
# two arguments
center <- function(data, desired){
  new_data <- (data - mean(data)+desired)
  return(new_data)
}
z <- c(0,0,0,0)
center(z, 3)

dat <- read.csv(file="inflammation-01.csv",header=FALSE)

centered <- center(dat[,4], 0)

center(0, dat[,4]) # it's not what we want to do

min(dat[,4])
min(centered)
max(dat[,4])
max(centered)
mean(dat[,4])
mean(centered)

sd(dat[,4])
sd(centered)

all.equal(sd(dat[,4]), sd(centered))

center(dat[,4])

center <- function(data,desired=0){
  new_data <- (data - mean(data)) + desired
  return(new_data)
}
center(dat[,4])

rescale <- function(data) {
  L <- min(data)
  H <- max(data)
  result <- (data - L)/(H - L)
  return(result)
}

rescale(c(3,2,5,7))

plot(c(3,2,5,7))
plot(rescale(c(3,2,5,7)))
min(c(3,2,5,7))
min(rescale(c(3,2,5,7)))
max(c(3,2,5,7))
max(rescale(c(3,2,5,7)))

dat <- read.csv(file="inflammation-01.csv", TRUE)
head(dat)



