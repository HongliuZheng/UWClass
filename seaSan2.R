library(lubridate)
library(ggplot2)
sea <- read.csv(file="seattle_incidents_summer_2014_modified.csv",head=TRUE,sep=",")
seaS <- subset(sea, select = c(DistrictSector))
msea <- table(seaS)
t <- as.data.frame(msea)
t[1, 1] <- NA
tt <- na.exclude (t)
print(ggplot(tt, aes(x=seaS, y=Freq)) + geom_bar(stat="identity",position="dodge"))
