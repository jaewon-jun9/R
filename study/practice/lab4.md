[문제1] 다음과 같이 값이 구성되는 리스트를 정의하여 L1 에 저장한다.

![img](./images/clip_image008.jpg)

 3000 을 추출하여 2를 곱한 후에 result1 변수에 저장한다.

 ```r
#문제1
L1<-list(name="scott", sal=3000)
L1
result1<-l1$sal[[1]]*2
 ```



[문제2] 다음과 같이 값이 구성되는 리스트를 정의하여 L2 에 저장한다.

![img](./images/clip_image009.jpg)

 ```R
#문제2
L2<-list("scott",c(100,200,300))
 ```

[문제3] 다음 리스트에서 A를 "Alpha"로 대체한다.(L3)

​      list(c(3,5,7), c(“A”, “B”, “C”))

 ```R
#문제3
L3<-list(c(3,5,7), c("A", "B", "C"))
L3[[2]][[1]]<-"Alpha"
 ```

[문제4] 다음 리스트에서 첫 번째 원소(alpha)의 각 값에 10을 더하여 출력한다.(L4)

​      list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))

```R
#문제4
L4<-list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha+10
```

[문제5] 다음 리스트는 math, writing, reading의 중간고사 및 기말고사 점수이다. (L5)

전체 평균을 계산하여 출력한다.

   (힌트 **: unlist()** 함수를 활용한다. unlist() : 리스트를 벡터형식의 데이터셋으로 풀어주는 함수)

​      list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))

```R
#문제5
L5<-list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
math<-unlist(L5$math)
writing<-unlist(L5$writing)
reading<-unlist(L5$reading)
mean(math)
mean(writing)
mean(reading)
```

[문제6] 힌트 : 연산자를 잘 활용해 봅시다요…

\1. time 이라는 변수에 32150 이라는 값(초)을 초기화 한다. 

\2. time 변수의 값으로 "XX시간 XX분 XX초" 형식으로 변환하여 출력한다.

```R
#문제6
time<-32150
hour<-time %/% 3600
min<-(time %% 3600)%/%60
sec<-((time %% 3600)%%60)
paste(hour,"시간",min,"분",sec,"초")
```

