#ggplot follow-up session

getwd()
mammals = read.csv(file.choose()) # to open a file browser prompt to select a file
data <- file.choose()
View(mammals)
## package load -ins ###
library(dplyr)
library(ggplot2)

# begin scriopt content ###
dev.off()
glimpse(mammals)
ggplot(mammals, aes(x=adult_body_mass_g, 
                    y=adult_head_body_len_mm,color = order)) +
  geom_point(aes(shape=order)) +
  geom_rect(aes(xmin=1000,xmax=100000,ymin=100,ymax=100000,
            fill = 'green')) + 
  labs(x = 'Body Mass (g)', y='Body length(mm)')+
  scale_x_log10()+
  scale_y_log10()

install.packages('ggThemeAssist')
library(ggThemAssist)

glimpse(mammals)
mammals$cet <- FALSE
#mammals$cet <- (mammals$order == 'Cetacea')
mammals$cet[mammals$order == 'Cetacea'] <- TRUE
ggplot(mammals, aes(x=adult_body_mass_g, y = adult_head_body_len_mm, color =cet)) + 
  geom_point()

mammals$cet <- ifelse(mammals$order == "Cetacea", 'whale','not whale')
glimpse(mammals)

#ggBiplot wil tell you 




