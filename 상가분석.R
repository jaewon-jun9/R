build<- read.csv(file.choose(),header=T)
build
build[is.na(build)] <-0
build<-build[-1]
build
library(arules)
#트랜젝션 변환
trans <- as.matrix(build, "Transaction")
rules1<-apriori(trans, parameter = list(supp=0.2,conf=0.6,target="rules"))
inspect(sort(rules1))


rules2<-subset(rules1, subset = lhs %pin% '보습학원' & confidence >0.7)
inspect(sort(rules2))

rules3<-subset(rules1, subset = lhs %pin% '편의점' & confidence >0.7)
rules3
inspect(sort(rules3))

#비주얼라이제이션
b2<- t(as.matrix(build)) %*% as.matrix(build)
install.packages("sna")
install.packages("rgl")
b2.w<-b2-diag(diag(b2))
gplot(b2.w ,displaylabels = T , vertex.cex = sqrt(diag(b2)),vertex.col = "green", edge.col="blue", boxed.labels=F, arrowhead.cex=.3 ,label.pos=3 ,edge.lwd=b2.w*2)
