bike<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
bikewe<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
bikemo<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv
bikeho<- read.csv(file.choose(), header=T ,stringsAsFactors = F) #csv

head(bike)
row.names(bike)=bike$start_stn
bikedist<-dist(bike[-1,], method = "euclidean")
two_coord <- cmdscale(bikedist)
plot(two_coord,type ="n")
text(two_coord, as.character((bike$start_stn)))

bhcl<-hclust(bikedist^2, method = "single")
plot(bhcl)

row.names(bikewe)=bike$start_stn
bikedist<-dist(bikewe[-1], method = "euclidean")
two_coord <- cmdscale(bikedist)
plot(two_coord,type ="n")
text(two_coord, as.character((bikewe$start_stn)))
bhcl<-hclust(bikedist^4, method = "single")
plot(bhcl)



row.names(bikemo)=bike$start_stn
bikedist<-dist(bikemo[-1], method = "euclidean")
two_coord <- cmdscale(bikedist)
plot(two_coord,type ="n")
text(two_coord, as.character((bikemo$start_stn)))
bhcl<-hclust(bikedist^4, method = "single")
plot(bhcl)




row.names(bikeho)=bike$start_stn
bikedist<-dist(bikeho[-1], method = "euclidean")
two_coord <- cmdscale(bikedist)
plot(two_coord,type ="n")
text(two_coord, as.character((bikeho$start_stn)))
bhcl<-hclust(bikedist^4, method = "single")
plot(bhcl)



#SVM
install.packages("kernlab")
library(kernlab)
m=ksvm(Species~.,data=iris)
m
head(predict(m,newdata=iris))
