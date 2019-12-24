library(stats)
bikeL<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
head(bikeL,50)
name=c("bike_id","start_stn","end_stn","eq","use_time_o","b_year","b_month","b_day","b_hour","b_min","b_weekday","r_year","r_month","r_day","r_hour","r_min","r_weekday","use_time_m")
names(bikeL)=name
str(bikeL)
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

bikeLsub=bikeL[(bikeL$use_time_o < 44&bikeL$use_time_o > 0&bikeL$eq == "0"|bikeL$use_time_o < 135&bikeL$use_time_o > 0&bikeL$eq == "1")&bikeL$b_year=="2019"&bikeL$start_stn=="207",]
summary(bikeLsub)

bikesvm<-svm(eq ~ b_month+b_hour+b_weekday , type="C-classification" ,data = bikeLsub) #b_year+b_month+
sum(bike$eq != predict(bikesvm, bikeLsub))

biksvm<-ksvm(eq ~ b_month+b_hour+b_weekday , kernel="rbfdot",data = bikeLsub) #b_year+b_month+
sum(bike$eq != predict(biksvm, bikeLsub))

bikelogit<-glm(eq ~ b_month+b_hour+b_weekday , data = bikeLsub, family = 'binomial') #b_year+b_month+
summary(bikelogit)
bikelogit
a=bikeLsub$eq
b=ifelse(fitted(bikelogit)>0.5,1,0)
q=table(a[1:266]==b[1:266])
q[2]/(q[1]+q[2])#맞춘 비율
table(bikeLsub$eq)[2]/(table(bikeLsub$eq)[1]+table(bikeLsub$eq)[2])#투입 비율

plot(bikelogit)

#table(a==b)

head(bikeLsub)

g=fitted(bikelogit)>0.5
h=predict(bikelogit, bikeLsub, type = "response")>0.5
g==h

table(bikeLsub$eq,predict(bikelogit, bikeLsub, type = "response")>0.5)

rgr<- lm(use_time_m~b_month+b_hour+b_weekday, data=bikeLsub)
summary(rgr)


head(bikeLsub,100)
fitted(rgr)[1:100]
predict(m,newdata = data.frame(speed=200))



















bikeL207=bikeL[bikeL$start_stn == "207"&bikeL$use_time_o < 44&bikeL$use_time_o > 0&bikeL$eq == "0"|bikeL$start_stn == "207"&bikeL$use_time_o < 135&bikeL$use_time_o > 0&bikeL$eq == "1",]
summary(bikeL207)

bikelogit<-glm(eq ~ b_month+b_hour+b_weekday , data = bikeL207, family = 'binomial') #b_year+b_month+
summary(bikelogit)
bikelogit
a=bikeL207$eq
b=ifelse(fitted(bikelogit)>0.5,1,0)
q=table(a==b)
q[2]/(q[1]+q[2])

table(bikeL207$eq)[1]/(table(bikeL207$eq)[1]+table(bikeL207$eq)[2])







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