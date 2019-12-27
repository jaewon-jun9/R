#사용할 속성을 비율 값으로 요약
bikeL<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
str(bikeL)


bikeL[bikeL$start_stn == 376,]
bikeremv=bikeL[bikeL$end_stn == 376|bikeL$end_stn == 1301|bikeL$end_stn == 1335|bikeL$end_stn == 1704|bikeL$end_stn == 1817|bikeL$end_stn == 1990|bikeL$end_stn == 2602,]
write.csv(bikeremv, file = "bikeremv.csv", row.names = T)

bikeL2=bikeL[!(bikeL$end_stn == 376|bikeL$end_stn == 1301|bikeL$end_stn == 1335|bikeL$end_stn == 1704|bikeL$end_stn == 1817|bikeL$end_stn == 1990|bikeL$end_stn == 2602),]
str(bikeL2)

bikeL=bikeL2

summary(bikeL[bikeL$end_stn == 376|bikeL$end_stn == 1301|bikeL$end_stn == 1335|bikeL$end_stn == 1704|bikeL$end_stn == 1817|bikeL$end_stn == 1990|bikeL$end_stn == 2602,])

bikeL$bike_id=as.factor(bikeL$bike_id)
bikeL$eq=as.factor(bikeL$eq)
bikeL$start_stn=as.factor(bikeL$start_stn)
bikeL$end_stn=as.factor(bikeL$end_stn)
bikeL$b_year=as.factor(bikeL$b_year)
bikeL$b_month=as.factor(bikeL$b_month)
bikeL$b_hour=as.factor(bikeL$b_hour)
bikeL$b_weekday=as.factor(bikeL$b_weekday)
bikeL$r_year=as.factor(bikeL$r_year)
bikeL$r_month=as.factor(bikeL$r_month)
bikeL$r_hour=as.factor(bikeL$r_hour)
bikeL$r_weekday=as.factor(bikeL$r_weekday)

str(bikeL)

stn_names=unique(bikeL$start_stn)
stn_namee=unique(bikeL$end_stn)

summary(stn_names)
summary(stn_namee)
library(dplyr)


#출발
bikeweekb = aggregate(b_weekday~start_stn,bikeL,summary)#정류장별로 요일에 대해 각 요일이 몇 번인지
bikemonthb = aggregate(b_month~start_stn,bikeL,summary)#정류장별로 월에 대해 각 월이 몇 번인지
bikehourb = aggregate(b_hour~start_stn,bikeL,summary)#정류장별로 시에 대해 각 시간대 가 몇 번인지

write.csv(bikeweekb, file = "bikeweekb.csv", row.names = T)
write.csv(bikemonthb, file = "bikemonthb.csv", row.names = T)
write.csv(bikehourb, file = "bikehourb.csv", row.names = T)

bikehead=head(bikeL,50)

#도착
bikeweekr = aggregate(r_weekday~end_stn,bikeL,summary)#정류장별로 요일에 대해 각 요일이 몇 번인지
bikemonthr = aggregate(r_month~end_stn,bikeL,summary)#정류장별로 월에 대해 각 월이 몇 번인지
bikehourr = aggregate(r_hour~end_stn,bikeL,summary)#정류장별로 시에 대해 각 시간대 가 몇 번인지

write.csv(bikeweekr, file = "bikeweekr.csv", row.names = T)
write.csv(bikemonthr, file = "bikemonthr.csv", row.names = T)
write.csv(bikehourr, file = "bikehourr.csv", row.names = T)



#summary(bikeL[bikeL$start_stn == "101"&bikeL$r_weekday == "6",])

#summary(bikeL[bikeL$start_stn == "101"&bikeL$r_month == "12",])


month=arrange(bikeL,b_month)


bikeweek = aggregate(r_weekday~start_stn,arrange(bikeL,r_weekday),summary)#정류장별로 요일에 대해 각 요일이 몇 번인지
bikemonth = aggregate(r_month~start_stn,bikeL,summary)#정류장별로 월에 대해 각 월이 몇 번인지
bikehour = aggregate(r_hour~start_stn,bikeL,summary)#정류장별로 시에 대해 각 시간대 가 몇 번인지

write.csv(bikeweek, file = "bikeweek.csv", row.names = T)
write.csv(bikemonth, file = "bikemonth.csv", row.names = T)
write.csv(bikehour, file = "bikehour.csv", row.names = T)

bikehead=head(bikeL,50)



bikehead
stn_names=unique(bikehead$start_stn)

table(bikehead[bikehead$start_stn==stn_names,])

aggregate(r_weekday~start_stn,bikehead,summary)



bikehead[bikehead$start_stn == 105,]

table(str(a))



summary(bikehead)





library(doBy)

summaryBy(b_month.~start_stn,bikehead)


?n
library(data.table)
data <- data.table(bikehead)
data[, n(),by=start_stn]

















bikehead
stn_names=unique(bikehead$start_stn)

table(bikehead[bikehead$start_stn==stn_names,])

aggregate(r_weekday~start_stn,bikehead,summary)



bikehead[bikehead$start_stn == 105,]

table(str(a))



summary(bikehead)





library(doBy)

summaryBy(b_month.~start_stn,bikehead)


?n
library(data.table)
data <- data.table(bikehead)
data[, n(),by=start_stn]





