#ggplot and dplyr!!
colors()

install.packages("ggplot2")
library('ggplot2')
install.packages('dplyr')
library('dplyr')
getwd()
#setwd('directory')
mammals <- read.csv(file = "mammals.csv")
setwd('/Users/linyinglu/Desktop/workshop')
head(mammals)
glimpse(mammals) # using glimpse to know the dataset
View(mammals)
plot(adult_head_body_len_mm ~ adult_body_mass_g, data=mammals)
ggplot(data=mammals,aes(x=adult_body_mass_g, y=adult_head_body_len_mm)) +
  geom_point()
# 1, 2, 3
ggplot(data=mammals,aes(x=adult_body_mass_g, y=adult_head_body_len_mm))+
  geom_point()

ggplot(data=mammals,aes(x=adult_body_mass_g, y=adult_head_body_len_mm))+
  geom_point(size=3, aes(color=order))

glimpse(mammals)

tails <- filter(mammals, order == "Rodentia")
glimpse(tails)

large_tails <- filter(mammals, order == "Rodentia" | adult_body_mass_g > 100000)
glimpse(large_tails)

large_tails <- filter(mammals,order =="Rodentia" &  adult_body_mass_g > 10)
glimpse(large_tails)

tmammals <- filter(mammals, habitat == 'T')
colnames(tmammals)
View(arrange(tmammals, adult_body_mass_g))

ggplot(data=mammals, aes(x=habitat, y= adult_body_mass_g, fill = habitat))+ # foundational info for plot, set x and y
  geom_boxplot()+ #plot data as a boxplot
  geom_jitter()+ # add plot layer with jittered
  scale_y_log10()+ # make the y axis log scale
  scale_fill_manual(values = c("dodgerblue","forestgreen"))+ # manually set colors
  labs(x = "Habitat", y= "Adult body mass (g)", title ="Body mass of mammals, by habitat") # set axis and title names

ggplot(mammals,aes(x=habitat, y=adult_body_mass_g, fill = habitat))+
  geom_jitter()+
  geom_boxplot()+
  scale_y_log10()

ggplot(data=mammals, aes(x=habitat, y= adult_body_mass_g, fill = habitat))+ # foundational info for plot, set x and y
  geom_boxplot()+ #plot data as a boxplot
  geom_jitter(aes(x=habitat,y=adult_body_mass_g,col=order), alpha=0.2)+ # add plot layer with jittered
  scale_y_log10()+ # make the y axis log scale
  scale_fill_manual(values = c("dodgerblue","forestgreen"))+ # manually set colors
  labs(x = "Habitat", y= "Adult body mass (g)", title ="Body mass of mammals, by habitat") # set axis and title names

ggplot(data=mammals, aes(x=habitat, y= adult_body_mass_g, fill = habitat))+ # foundational info for plot, set x and y
  geom_boxplot()+ #plot data as a boxplot
  geom_jitter(aes(color = order), alpha=0.2)+ # add plot layer with jittered
  scale_y_log10()+ # make the y axis log scale
  scale_fill_manual(name = 'habitat',values = c("blue","green"))+ # manually set colors
  scale_color_discrete(name = 'ORDER')
#labs(x = "Habitat", y= "Adult body mass (g)", title ="Body mass of mammals, by habitat") # set axis and title names

#################
#
#
# back to Dplyr....
summary(mammals)
summarize(mammals, mean_mass = mean(adult_body_mass_g))

?mean
summarize(mammals, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
mean(mammals$adult_body_mass_g, na.rm = TRUE)

mammals_gound_order <- group_by(mammals, order)
glimpse(mammals_gound_order)
mammals_summarize <- summarize(mammals_gound_order, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))

mammals_summarize
# add length colunm (mean)
mammals_summarize <- 
  summarize(mammals_gound_order, 
            mean_mass = mean(adult_body_mass_g, na.rm = TRUE),
            mean_len = mean(adult_head_body_len_mm, na.rm = TRUE))

mammals_summarize
# plot it
ggplot(mammals_summarize,aes(x=mean_mass, y= mean_len)) +
  geom_point()

# load dplyr

a <- c(1,2,3)
a
mean(a)
# is the same as

a %>% mean()
b <- range(a)
b
c <- diff(b) #difference from the bigest to smallest
c
c <- a %>%
  range() %>%
  diff() 
c

mammals_mutate <- 
mammals %>%
  # group by order
  group_by(order) %>%
  # find the mean mass and mean length for each order
mutate(mean_mass = mean(adult_body_mass_g, na.rm =TRUE),
          mean_len = mean(adult_head_body_len_mm, na.rm = TRUE))
glimpse(mammals_mutate)
mammals_mutate$mean_mass
mammals_mutate$norm_mass <- mammals_mutate$adult_body_mass_g/mammals_mutate$mean_mass
mammals_mutate$norm_mass


mammals_mutate %>%
  arrange(norm_mass)%>%
  glimpse()

mammals_mutate %>%
  arrange(desc(norm_mass)) %>%
  glimpse()

theme_set(theme_bw)


ggplot(mammals, aes(x=adult_head_body_len_mm,y = adult_body_mass_g)) # it's wrong

View(mammals)
#plot mean mass by mean length
ggplot(aes(x = mean_mass,y=mean_len)) + geom_point()

#scatterplot of weigth vs litter size
# but only with the orders "Rodentia", and "Cetacea"
# set the color of the points by order
# log-transform both axes
# use pipes
whales_n_tails = filter(mammals, order == "Rodentia" | order =="Cetacea")

whales_n_tails <- mammals %>%
  filter(order = "Rodentia" | order =="Cetacea") %>%
  ggplot(aes(x=adult_body_mass_g, y=litter_size)) + 
  geom_point()+
  scale_y_log10()+
  scale_x_log10()
  
whalse_n_tails <- filter(mammals, order == "Rodentia" | order =="Cetacea")
ggplot(whalse_n_tails,aes(x=adult_body_mass_g, y=litter_size)) + 
  geom_point()

ggplot(mammals, aes(x = adult_head_body_len_mm, y= adult_body_mass_g))+
  geom_point(aes(color = habitat))+
  facet_wrap(~order)

ggplot(mammals, aes(x = adult_head_body_len_mm, y= adult_body_mass_g))+
  geom_point(aes(color = order))+
  scale_y_log10()+
  scale_x_log10()+
  facet_grid(.~habitat)
  theme_grey()

ggsave("Mass_v_length1.pdf", height = 8, width = 6)  

ggsave("Mass_v_length2.pdf", height = 6, width = 8)













