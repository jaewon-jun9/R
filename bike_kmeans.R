#지수표기 X
options(scipen = 100)
#출발
bikeb<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv bikemds2.csv
head(bikeb)
row.names(bikeb)=bikeb$start_stn #정류장 이름 정보가 없어져도 열이름에 남기기 위해
bike_train_scaleb<-as.data.frame(sapply(bikeb[,-1],scale)) #스케일 적용시
row.names(bike_train_scaleb)=bikeb$start_stn #스케일 적용한거에도 정류장 번호 줄 수 있음
head(bike_train_scaleb)
bikedistb<-dist(bike_train_scaleb, method = "euclidean") #스케일 적용한 거리 구하기

km.out.withness<-c()
km.out.between<-c()
for (i in 2:15){ #군집수를k=2~15까지변화시켜가며클러스터링시행
  set.seed(1)
  km.out<-kmeans(bikedistb, centers=i)
  km.out.withness[i-1]<-km.out$tot.withinss#군집내제곱합의합
  km.out.between[i-1]<-km.out$betweenss#군집간제곱합의합
}
data.frame(km.out.withness, km.out.between)
plot(km.out.withness,type="o")
plot(km.out.between,type="o")


reb <- kmeans(bikedistb,4)
table(reb$cluster)

write.csv(reb$cluster,file = "bikekmeans_start.csv")
bikeb$clust=reb$cluster
write.csv(bikeb,file = "bike_start_clust.csv")

#도착
biker<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv bikemds2.csv
head(biker)
row.names(biker)=biker$end_stn #정류장 이름 정보가 없어져도 열이름에 남기기 위해
bike_train_scaler<-as.data.frame(sapply(biker[,-1],scale)) #스케일 적용시
row.names(bike_train_scaler)=biker$end_stn #스케일 적용한거에도 정류장 번호 줄 수 있음
head(bike_train_scaler)
bikedistr<-dist(bike_train_scaler, method = "euclidean") #스케일 적용한 거리 구하기

km.out.withness<-c()
km.out.between<-c()
for (i in 2:15){ #군집수를k=2~15까지변화시켜가며클러스터링시행
  set.seed(1)
  km.out<-kmeans(bikedistr, centers=i)
  km.out.withness[i-1]<-km.out$tot.withinss#군집내제곱합의합
  km.out.between[i-1]<-km.out$betweenss#군집간제곱합의합
}
data.frame(km.out.withness, km.out.between)
plot(km.out.withness,type="o")
plot(km.out.between,type="o")


rer <- kmeans(bikedistr,4)
table(rer$cluster)

write.csv(re$cluster,file = "bikekmeans_end.csv")
biker$clust=rer$cluster
write.csv(biker,file = "bike_end_clust.csv")
