library(lubridate)
library(ggplot2)
san <- read.csv(file="sanfrancisco_incidents_summer_2014.csv",head=TRUE,sep=",")
sanS <- subset(san, select = c(PdDistrict))
msan <- table(sanS)
u <- as.data.frame(msan)
print(ggplot(u, aes(x=sanS, y=Freq)) + geom_bar(stat="identity",position="dodge"))

