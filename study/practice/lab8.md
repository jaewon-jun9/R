[ 문제1 ]

다음의 기능을 지원하는 함수 mySum()을 생성한다.

 

아규먼트 : 벡터 한 개

리턴값 : 리스트 한 개 또는 NULL

 

(1) 전달된 벡터에서 짝수번째 데이터들의 합과 홀수번째 데이터들의 합을 구하여 

   list 객체로 리턴하는데 각각 oddSum과 evenSum 이라고 변수명을 설정한다.

 

(2) 벡터가 온 경우에만 기능을 수행하며 벡터가 오지 않은 경우에는 "벡터만 처리 가능!!"이라는

   메시지로 에러를 발생시킨다.

 

(3) 전달된 벡터에 NA 값이 하나라도 존재하는 경우에는 "NA를 최저값으로 변경하여 처리함!!" 이라는 

   메시지를 경고를 발생시킨다. 그리고 NA 는 최저값으로 설정하여 기능을 수행한 후에 결과를 리턴한다.

 

(4) NULL이 온 경우에는 NULL을 리턴한다.

 ```R
#문제1
mySum<-function(...){
  mySumData<-c(...)
  if(is.null(mySumData))stop()
  if(!is.vector(mySumData) | is.list(mySumData)){
      stop("벡터만 처리 가능!!")
      return()
    } 
  if (!is.numeric(mySumData)) {
        stop("숫자 벡터를 전달하숑!")
        return()
      }
  oddSum<-0
  evenSum<-0
  mySumData_min <- min(mySumData,na.rm = T)
  if(any(is.na(mySumData))){
    warning("NA를 최저값으로 변경하여 처리함.")
  }
    for(item in mySumData){
      if(is.na(item))item<-mySumData_min
      if(item%%2 == 0){
        evenSum<-evenSum+item
      } else {
        oddSum<-oddSum+item
        }
    }
    result<-list(evenSum=evenSum,oddSum=oddSum)
    return(result)
  }
  
mySum()
mySum(NULL)
mySum("1","2")
mySum(1,2,NA)
mySum(2,3,5,6,NA,8,9,NA,NA)
mySum(1,2,3,1,5,6,8,9)
mySum(2,3,5,6,NA,8,9,NA,NA)
 ```



[ 문제2 ]

다음의 기능을 지원하는 함수 myExpr()을 생성한다.

 

아규먼트 : 함수 한 개

리턴값 : 한 개의 숫자값

 

(1) 아규먼트로 함수를 전달받는다. 

(2) 아규먼트가 함수가 하니면 "수행 안할꺼임!!" 이라는 메시지로 에러를 발생시킨다.

(3) 1부터 45 사이의 난수 6개를 추출하여 아규먼트로 전달된 함수를 호출하고 그 결과를

   리턴한다.

```R
#문제2
myExpr<-function(f1){
  if(!is.function(f1))stop("수행 안할거임!!")
  randomNumber1<-sample(1:45,6)
  return(f1(randomNumber1))
}
myExpr(mySum)
myExpr(v1)
```

 

[ 문제3 ]

다음 사양의 함수 createVector() 을 생성한다.

 

아규먼트 : 가변(숫자, 문자열, 논리형(데이터 타입의 제한이 없다.))

리턴 값 : 벡터

 

(1) 전달된 아규먼트가 없으면 NULL을 리턴한다.

(2) 전달된 아규먼트에 하나라도 NA 가 있으면 NA를 리턴한다.

(3) 전달된 데이터들을 가지고 벡터를 생성하여 리턴한다.

 

 ```R
#문제3
createVector<-function(...){
  x<-c(...)
  if(any(is.na(x)))return(NA)
  result<-x
  return(result)
}
createVector()
createVector(1,2,3,4)
createVector(1,2,3,4,NA)
 ```



 

[ 문제4 ] – 함수 문제 아님

iotest1.txt 파일에 저장된 데이터들을 읽고 다음과 같은 형식으로 결과를 출력하는

R 코드를 구현한다. 

 

   오름차순 : ….

   내림차순 : ….

   합 : ...

   평균 : ...   

 ```R
#문제4
ioTest1<-scan(file = "c:/rstudy/data/iotest1.txt")
print(sort(ioTest1))
print(sort(ioTest1,decreasing = T))
sum(ioTest1)
mean(ioTest1)
 ```



[ 문제5 ] – 함수 문제 아님

iotest2.txt 파일에 저장된 데이터들을 읽고 다음과 같은 형식으로 결과를 출력하는

R 코드를 구현한다. 

 

   “가장 많이 등장한 단어는 XX 입니다.”

 ```R
#문제5
ioTest2<-scan(file = "c:/rstudy/data/iotest2.txt",what = "")
uniqueName<-unique(ioTest2)
c1<-rep(0,length(uniqueName))
for(i in 1:length(uniqueName)){
c1[i]<-(sum(uniqueName[i]==ioTest2))
}
uniMrt<-rbind(uniqueName,c1)
print(uniMrt)
x<-uniMrt[1,order(-c1)[1]]
cat("가장 많이 등장하는 단어는",x,"입니다.\n")

#uniMrtC<-cbind(uniqueName,c1)
#print(uniMrtC)
#y<-uniMrtC[order(-c1)[1],1]
#cat("가장 많이 등장하는 단어는",y,"입니다.\n")

#uniMrtC_order<-uniMrtC[order(-c1,uniqueName),]
#uniMrtC_order
#cat("가장 많이 등장하는 단어는",uniMrtC_order[1,1],"입니다.\n")
#uniMrt_order<-uniMrt[,order(-c1,uniqueName)]
#uniMrt_order
#cat("가장 많이 등장하는 단어는",uniMrt_order[1,1],"입니다.\n")

 ```



 

