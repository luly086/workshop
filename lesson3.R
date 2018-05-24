analyze <- function(filename){
  dat <- read.csv(file = filename, header = FALSE)
  avg_dat_inflammation <- apply(dat,2,mean)
  plot(avg_dat_inflammation)
  
  max_dat_inflammation <- apply(dat,2,max)
  plot(max_dat_inflammation)
  
  min_dat_inflammation <- apply(dat,2,min)
  plot(min_dat_inflammation)
}

getwd()
list.files()
analyze('inflammation-01.csv')
analyze('inflammation-02.csv')


print('text')
a <- 'text'
print(a)
best_practice <- c('Let','the','computer','do','the','work')

print_words <- function(sentence){
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}
print_words(best_practice)
best_practice[-6]
print_words(best_practice[-6])
print_words <- function(sentence){
  for(word in sentence){
    print(word)
  }
}
print_words(best_practice)
print_words(best_practice[-6])

len <- 0
vowels <- c('a','e','i','o','u')

for (v in vowels){
  print(v)
  len <- len +1
}

len
v
letter <- 'z'
#that's the for function works
for (letter in c('a','b','c')){
  print(letter)
}
letter 

#R has a function called seq that creates a list of numbers:
seq(3)
seq(10)
#make a function that prints the first N numbers
print_N <- function(int){
  seq_num <- seq(int)
  for (a in seq_num){
    print(a)
  }
}

print_N(5)
# 1 2 3
list.files()
list.files(pattern = 'csv')
list.files(pattern = 'inflammation')
filenames <- list.files(pattern = 'inflammation')
filenames
analyze_all <- function(pattern){
  filenames <- list.files(pattern = pattern)
for (a in filenames){
  analyze(a)
  }
}
analyze_all('inflammation')

pdf('inflammation-01.pdf')
analyze('inflammation-01.csv')
dev.off()

num <- 37
if(num > 100){
  print('greater')
} else{
  print('not greater')
}

#is the number greater than 0?
#function sign will return -1 for a negative number
#0 for 0
#1 for a positive number
sign <- function(num){
  if(num<0){
    return(-1)
  }else if(num ==0){
    return(0)
  }else{
    return(1)
  }
}
sign(0.3)

#conditional: is a equal to B?
a == b
# a is less than b
a < b
#greater than
a > b
# a isn't equal to B
a != b
# a is less than or equal to b
a <= b
# a is greater than or equal to b
a >= b

a = 3
b =2
a<b
a<=b
a!=b

# a, b, and c
a =3
b = 2
c =4
# if a is less than c, but bigger than b
a < c
a > b
a<c & a>b
if (a<c | a>b){
  
}
TRUE | FALSE
FALSE | FALSE
if (1>0 & -1>0){
  print('both parts are true')
}else{
  print('at least one part is not true')
}

if(1>0 | -1>0){
  print('at least one part is true')
}else{
  print('neither part is true')
}

head(dat)
dat <- read.csv('inflammation-01.csv',header = FALSE)
# write a function called plot_dist()
plot_dist(dat[,10], use_boxplot = TRUE)
# first argument is the data to plot
# argument use_boxplot is TRUE: make a boxplot
# argument use_boxplot is FALSE: make a histogram
# if nothing in use_boxplot: make a boxplot
# if the data is less than threshold, plot a stripchart
# if you don't set threshold, default it to 10
boxplot(dat[,10])
hist(dat[,10])
stripchart(dat[,10])

plot_dist <- function(dat,use_boxplot = TRUE,threshold = 10){
  if(length(dat) < threshold){
    stripchart(dat)
  }else if (use_boxplot==TRUE){
    boxplot(dat)
  }else {
    hist(dat)
  }
} 
plot_dist(seq(3))
plot_dist(seq(3), use_boxplot = TRUE)
plot_dist(seq(3), use_boxplot = FALSE)
plot_dist(seq(20))
plot_dist(seq(20), use_boxplot = FALSE)
plot_dist(seq(20), threshold = 100)
plot_dist(seq(20), threshold = 100, use_boxplot = FALSE)
plot_dist(seq(20), threshold = 100, use_boxplot = TRUE)

  
  



