bikeL<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
head(bikeL)
name=c("bike_id","start_stn","end_stn","eq","use_time_o","b_year","b_month","b_day","b_hour","b_min","b_weekday","r_year","r_month","r_day","r_hour","r_min","r_weekday","use_time_m")
names(bikeL)=name
summary(bikeL)

par(mfrow = c(2, 2))

28529/(89004+28529)

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

summary(bikeL)

bikeL207=bikeL[bikeL$start_stn == "152",]
summary(bikeL207)
library(stats)
bikelogit<-glm(eq ~ b_month+b_hour+b_weekday , data = bikeL207, family = 'binomial') #b_year+b_month+
summary(bikelogit)
bikelogit
a=bikeL207$eq[1:100]==1
b=fitted(bikelogit)[c(1:100)]>0.5
table(a==b)

table(bikeL207$eq[1:100])







exp(0.04576)
exp(0.07145)
as.numeric(d$Species)
ifelse()



drink<- read.csv(file.choose(), header=T ,stringsAsFactors = T) #csv
str(drink)

names(drink)=c("age","marr","child","hp","spirit","grade","sex","late")

lodrink<-glm(지각여부~. , data = drink, family = 'binomial')
summary(lodrink)

predict(lodrink,drink, type = "response") >= 0.5

install.packages("ggplot2")


library(aod)
library(ggplot2)
# view the first few rows of the data
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata) # 데이터의 대략적인 분포 확인
summary(mydata) # 데이터 구조 확인
str(mydata) # 변수별 표준편차 확인
sapply(mydata, sd) # contingency table : xtabs(~ x + y, data)
xtabs(~admit+rank, data=mydata)
mydata$rank <- factor(mydata$rank)
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
summary(mylogit)