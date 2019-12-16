#setwd("c:\\bike/done/")
#d=NULL
d_1<- read.csv(file.choose(), header=F ,stringsAsFactors = F) #csv
#head(d_1)
#str(d_1)
d_1=d_1[-1]
head(d_1)
d_name=names(d)
names(d_1)=d_name
d=rbind(d,d_1)
#head(d)
tail(d)
write.csv(d, file = "bike00.csv")
#d=d[-1]
#d=d[-9]
#d$V13[23412361]=2019
#d$V14[23412361]=6
#d$V15[23412361]=16
#d$V16[23412361]=0

#d=d[-24000348,]
