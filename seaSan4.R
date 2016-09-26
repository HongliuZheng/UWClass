library(lubridate)
library(ggplot2)
san <- read.csv(file="sanfrancisco_incidents_summer_2014.csv",head=TRUE,sep=",")
sanS <- subset(san, select = c(PdDistrict, Category))
msan <- table(sanS)
u <- as.data.frame(msan)
print(ggplot(u, aes(x=PdDistrict, y=Freq)) + geom_point(aes(colour =  Category))+ 
theme(axis.title.x=element_text(size=16, lineheight=.9, colour="red")) +
theme(axis.title.y=element_text(size=16, lineheight=.9, colour="red")))

