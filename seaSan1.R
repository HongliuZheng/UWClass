library(lubridate)
library(ggplot2)
sea <- read.csv(file="seattle_incidents_summer_2014.csv",head=TRUE,sep=",")
san <- read.csv(file="sanfrancisco_incidents_summer_2014.csv",head=TRUE,sep=",")
seaS <- subset(sea, select = c(Month))
searow <- nrow(seaS)
msea <- c(0, 0, 0)
for (i in 1:searow)
  {
      if (seaS[i, 1] == 6)
      {
			msea[1] <- msea[1] + 1
      }
      else if (seaS[i, 1] == 7)
      {
			msea[2] <- msea[2] + 1
      }
      else
      {
			msea[3] <- msea[3] + 1
      }
  } 
sanS <- subset(san, select = c(Date))
sanrow <- nrow(sanS)
msan <- c(0, 0, 0)
for (j in 1:sanrow)
  {
      if (mdy(sanS[j, 1]) < mdy("06/30/2014"))
      {
			msan[1] <- msan[1] + 1
      }
      else if (mdy(sanS[j, 1]) < mdy("07/31/2014"))
      {
			msan[2] <- msan[2] + 1
      }
      else
      {
			msan[3] <- msan[3] + 1
      }
  } 
month <- c(6, 7, 8, 6, 7, 8)
mcity <- c("SF","SF","SF", "Seattle", "Seattle", "Seattle")
mdata <- c(msan, msea)
crimeByMonth <- data.frame(month, mcity, mdata)
print(ggplot(crimeByMonth, aes(x=month, y=mdata, fill=mcity)) + geom_bar(stat="identity",position="dodge"))
