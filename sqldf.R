install.packages("sqldf", dependencies = TRUE)

library("sqldf")
library(RSQLite)

help(RSQLite)
getwd()
setwd("/Users/linyinglu/Desktop/untitled folder/workshop")
getwd()
mammals <- read.csv("mammals.csv", header = TRUE)
head(mammals)
db <- dbConnect(SQLite(), dbname="Mammaldb.sqlite")
dbWriteTable(con = db, name = "Mammalcsv", value = mammals, row.names = FALSE)
dbReadTable(db, "Mammalcsv")

dbListTables(db)
dbListFields(db, "Mammalcsv")

#select
dbGetQuery(db, "select * from Mammalcsv limit 10")
dbGetQuery(db, "Select distinct(species) from Mammalcsv where `order`='Carnivora';")
results <- dbGetQuery(db, "Select `order`,species, avg(litter_size) from Mammalcsv group by `order`;")
results <- dbGetQuery(db, "Select `order`,species, avg(litter_size) from Mammalcsv group by `order`, species;")
head(results)















