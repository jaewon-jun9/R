#사용할 속성을 비율 값으로 요약
bike<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
str(bike)

bikeL=bike

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
