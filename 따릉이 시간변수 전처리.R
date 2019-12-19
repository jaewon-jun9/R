#setwd("c:\\bike/done/")
#d=NULL
d<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
head(d)
View(d)

name=c("bike_id","start_stn","end_stn","eq","use_time_o","b_year","b_month","b_day","b_hour","b_min","r_year","r_month","r_day","r_hour","r_min","use_time_m")

#시간변수 다루기 포짓형으로 다룰 수 있다고 배웠으나 데이터 분석용 소스의 경우 텍스트 형식으로 
#저장되어 있는 경우가 많다. 그러므로 문자열 함수를 통해서 다룰 수도 있다.
#따릉이 데이터의 경우 시간을 기록하는 변수는 다음 세 가지 형태를 보인다.
#
d=d[-2]
#> nchar(d$V4[840])
#[1] 16
#> d$V4[840]
#[1] "2015-09-20 16:04"
#> nchar(d$V4[2945840])
#[1] 19
#> d$V4[2945840]
#[1] "2017-06-09 23:28:07"
#> nchar(d$V4[33258898])
#[1] 15
#> d$V4[33258898]
#[1] "2019-09-30 1:12"
#> nchar(d$V4[33258965])
#[1] 16
# d$V4[33258965]
#1] "2019-09-30 23:58"

#table함수를 통해 엉뚱한  값이 있는지 확인
table(d$i)
table(d$h)
#헤더가 있는것 확인
y=d[d$i == "year", ]
z=d[d$k == "month", ]
y
z
z=d[d$u == 8671, ]
tail(d[d$a == 2, ])
summary(d)
#뒷부분 투처 제거해야 함
d=d[-6662837,]
d=d[-2042680,]
d=d[-1687992,]
d=d[-1687992,]
d=d[-1045022,]
table(nchar(d$b)) #테이블 함수로 확인 하면 세 분류로 집계해 준다.
table(nchar(d$c))

nchar(d$V4[840]) #실제 데이터에서 모습 확인
d$V4[840]
nchar(d$V4[2945840])
d$V4[2945840]
nchar(d$V4[33258898])
d$V4[33258898]
nchar(d$V4[33258965])
d$V4[33258965]

#연월 일은 앞으로 부터의 길이가 같으므로 그냥 처리
d$year=substr(d$c,1,4)
d$mon=substr(d$c,6,7)
d$day=substr(d$c,9,10)
head(d)
#시의 경우 한글자 인 경우가 있으므로 조건문을 걸어서 파생변수 생성
d$hour = ifelse(nchar(d$c) == 15, substr(d$c,12,12),substr(d$c,12,13))
#분의 경우 시의 길이에 의해 영향을 받으므로 구분하여 처리
d$min = ifelse(nchar(d$c) == 15, substr(d$c,14,15),substr(d$c,15,16))
head(d)
#사용시간 0으로 나오는 곳에 사용시간 부여하기
#폐기
d$u = (as.numeric(d$hour)-as.numeric(d$m))*60-as.numeric(d$n)+as.numeric(d$min)
#하루를 넘어간 경우 보정해주기 시간을 분으로 변환해서 더함
#폐기
d$u = ifelse(d$u<0,d$u+(d$day-d$l)*1440,d$u+0)
#하루를 넘어가면서 월이 바뀐 경우의 처리
#폐기
d$u = ifelse((d$l==31|d$l==30|d$l==29|d$l==28) & d$day==1,(as.numeric(d$hour)-as.numeric(d$m))*60-as.numeric(d$n)+as.numeric(d$min)+1440,d$u+0)
#이상한부분 조건 걸어서 보기
x=d[d$u < 0, ]
tail(x,20)
x=d[d$u > 1440|d$h > 1440, ]
x
q=d[d$h == 0 & d$u >= 1400,]
q
#포짓 임시로 사용하기
#연습
as.POSIXct(paste(d$year[1],d$mon[1],d$day[1],d$hour[1],d$min[1],"00"),format="%Y %m %d %H %M %S")
as.POSIXct(paste(d$i[1],d$k[1],d$l[1],d$m[1],d$n[1],"00"),format="%Y %m %d %H %M %S")
as.POSIXct(paste(d$year[1],d$mon[1],d$day[1],d$hour[1],d$min[1]),format="%Y %m %d %H %M")
as.POSIXct(paste(d$i[1],d$k[1],d$l[1],d$m[1],d$n[1]),format="%Y %m %d %H %M")
as.POSIXct(paste(d$year[1],d$mon[1],d$day[1],d$hour[1],d$min[1],"00"),format="%Y %m %d %H %M %S")-as.POSIXct(paste(d$i[1],d$k[1],d$l[1],d$m[1],d$n[1],"00"),format="%Y %m %d %H %M %S")

a+60
#이용시간 만들기
#연습
d2=head(d,100)
#d2$u = as.POSIXct(paste(d2$year,d2$mon,d2$day,d2$hour,d2$min),format="%Y %m %d %H %M")-as.POSIXct(paste(d2$i,d2$k,d2$l,d2$m,d2$n),format="%Y %m %d %H %M")
d2$u/60
#d2$u1=paste(d2$year,d2$mon,d2$day,d2$hour,d2$min)#,format="%Y %m %d %H %M %S")
#d2$u2=paste(d2$i,d2$k,d2$l,d2$m,d2$n)
#이용시간 생성
d$u = as.numeric(as.POSIXct(paste(d$year,d$mon,d$day,d$hour,d$min),format="%Y %m %d %H %M")-as.POSIXct(paste(d$i,d$k,d$l,d$m,d$n),format="%Y %m %d %H %M"))/60
d$w = as.numeric(format(as.POSIXct(paste(d$i,d$k,d$l),format="%Y %m %d"),"%u"))
d$we = as.numeric(format(as.POSIXct(paste(d$year,d$mon,d$day),format="%Y %m %d"),"%u"))
head(d)
d2$w = weekdays(as.POSIXct(paste(d2$i,d2$k,d2$l),format="%Y %m %d"))
d2$w[1]
?weekdays

#요일 숫자로
d2$w=format(as.POSIXct(paste(d2$i,d2$k,d2$l),format="%Y %m %d"),"%u")



#초로 들어옴
#분으로 변경
#d$u=d$u/60
head(d)
#d$u-d$h
#반납시간이 더 빠른 경우 정정하기
d$hour=ifelse(d$u<0,d$m+(d$n+d$h)%/%60,d$hour)
d$min=ifelse(d$u<0,(d$n+d$h)%%60,d$min)

?ifelse

x=d[d$u == 0 & d$e!=d$f, ]
x

15625*600

#x[x$u<0&x$u>-10,15]=x[,15]
x=d2
170%%60
170%/%60
x$hour=ifelse(x$u<0,x$m+(x$n+x$h)%/%60)
x$min=ifelse(x$u<0,(x$n+x$h)%%60)
x

ifelse(x$min>59, x$hour=x$hour+1}
x
if(x[14]>59){x$min=x$min-60}

 
if(x$min>59){x$min=x$min%%60}

x
x=d[d$u < 0, ]
tail(x,20)

str(x)


#숫자형으로 전환하여 용량 감소 가능한지 시험
d$e=as.numeric(d$e)
d$f=as.numeric(d$f)
d$g=as.numeric(d$g)
d$h=as.numeric(d$h)
d$i=as.numeric(d$i)
d$k=as.numeric(d$k)
d$l=as.numeric(d$l)
d$m=as.numeric(d$m)
d$n=as.numeric(d$n)
d$year=as.numeric(d$year)
d$mon=as.numeric(d$mon)
d$day=as.numeric(d$day)
d$hour=as.numeric(d$hour)
d$min=as.numeric(d$min)
str(d)
#a   e   f g   h    i k  l m  n year mon day hour min   u
#1 186 115 115 1  98 2015 9 19 0 59 2015  09  19    2  39 100
#2 403 112 102 0 286 2015 9 19 1 22 2015  09  19    6  09 287
#3 485 112 102 0 276 2015 9 19 1 32 2015  09  19    6  09 277
#4 292 221 221 1  63 2015 9 19 7 52 2015  09  19    8  56  64
#5 270 221 210 0   8 2015 9 19 8 56 2015  09  19    9  05   9
#6   5 106 112 0  12 2015 9 19 8 58 2015  09  19    9  11  13
View(d)




d$r = d$V8
#자리바꾸기

d[c(18,17)]=d[c(17,18)] # 서로 바꾼다
head(d)

summary(d)

table(d$V11)
namecol=names(d)

names(d)=c("a","e","f","g","h","i","k","l","m","n","w","year","mon","day","hour","min","we","u")  
 

d$V11=as.numeric(d$V11)
#d=d[-2]
#head(d)
#head(d[-17])
#head(d)
#if(nchar(d$V4) == 15){d$h=substr(d$V4,11,11)}

#head(d)

#===========================================================================================



View(d)



#head(d_1)
#str(d_1)
d=d[-2]
d=d[-1,]
d=d[-1]
head(d)
#d_name=names(d)
#names(d_1)=d_name
#d=rbind(d,d_1)
#head(d)
tail(d)
write.csv(d, file = "bikeW.csv", row.names = F, col.names =  F)
?write.csv
#d=d[-1]
#d=d[-9]
#d$V13[23412361]=2019
#d$V14[23412361]=6
#d$V15[23412361]=16
#d$V16[23412361]=0

#d=d[-24000348,]


return_oneway=d[d$g == 0, ]
return_oneway
write.csv(return_round, file = "bike_round.csv", row.names = F)
return_round=d[d$g == 1&d$u!=0&d$u<=135, ]#1분이내 반납제거#1440이하
return_oneway=d[d$g == 0&d$u!=0&d$u<=400, ]#1분이내 반납제거#1440이하

summary(return_round)
summary(return_oneway)

return_round=d[d$g == 1&d$u!=0&d$u<=135, ]#1분이내 반납제거#135이하#기준시간 135로 잡음
boxplot(return_round$u)
boxplot(return_oneway$u)
summary(return_round)

head(return_round)
tail(return_round)

return_oneway=d[d$g == 0&d$u!=0&d$u<=44, ]#1분이내 반납제거#44이하
boxplot(return_oneway$u)
head(return_oneway)
tail(return_oneway)

summary(return_oneway)
summary(return_round)