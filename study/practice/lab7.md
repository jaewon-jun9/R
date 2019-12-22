[ 문제1 ]

다음 사양의 함수 exam5( )을 생성한다.

   매개변수 : 2 개(한 개는 필수, 또 다른 한 개는 선택(기본값 설정)

   리턴 값 : 없음(NULL 리턴)

기능 : 첫 번째 아규먼트는 숫자를 두번째 아규먼트는 문자를 입력받아서

​      숫자의 개수만큼 문자를 출력하는 기능을 처리한다.(행바꿈 없이)

​      문자가 전달되지 않으면 기본값은 "#" 로 처리한다.

​      숫자로 음의 값이 전달되면 아무것도 출력하지 않는다.

 ```R
#문제1
exam5<-function(num,mark="#"){
  if(num>0){print(rep(mark,num))}
  else{
    return()
    }
}
exam5(10,"G")
exam5(10)
exam5(-10)
 ```

[ 문제2 ]

다음 사양의 함수 exam6( )를 생성한다.

  매개변수 : 1 개

  리턴 값 : 없음(NULL 리턴)

기능 : 아규먼트로 전달되는 벡터에는 학생들의 점수(0~100)가 들어 있다.

​      점수에 따라서 결과를 출력한다.

​      85~100 "상"

​      70~84 "중"

​      ~69  "하"

​      출력형식 : "xx 점은 x등급입니다." 

​      NA 값이 존재하는 경우엔

​             "NA 는 처리불가" 를 출력한다.

​      모든 출력은 print() 함수를 사용한다.

 ```R
#문제2
exam6<-function(...){
  data<-list(...)
  for(item in data){
    if(!is.numeric(item)){
      print("NA는 처리불가입니다.")
    }else if(item>84){
        print(paste(item,"점은 상등급입니다."))
      }else if(item>69){
        print(paste(item,"점은 중등급입니다."))
      }else
        print(paste(item,"점은 하등급입니다."))
    }
}
exam6(10,20,30,"f","g",70,"h",90)
 ```

[ 문제3 ]

 다음 사양의 함수 countEvenOdd() 을 생성한다.

매개변수 : 1 개

​     리턴값 : 리스트

기능 : 숫자벡터를 아규먼트로 받아 짝수의 갯수와 홀수의 갯수를 카운팅하여 

리스트(각 변수명 : even, odd)로 리턴한다.

​        전달된 데이터가 숫자 백터가 아니면 NULL 을 리턴한다.

 ```R
#문제3
countEvenOdd = function(...) {
  eo = c(...)
  if (!is.numeric(eo)) {
    return()
  }
  even = 0
  odd = 0
  for (i in eo) {
    if (i %% 2 == 0) {
      even = even + 1
    } else {
      odd = odd + 1
    }
  }
  lst = list(even = even, odd = odd)
  return(lst)
}
countEvenOdd(2,3,4,5,6,7,8)
countEvenOdd(1,2,3,4,5,"h")
countEvenOdd(1,2,3,4,5,6)
countEvenOdd(0,1,2,3,4,5,6,0)
 ```

[ 문제4 ]

다음 사양의 함수 vmSum() 을 생성한다.

​    매개변수 : 1 개

   리턴 값 : 숫자벡터

   기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.

​       벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 리턴한다.

​       벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 

​        메시지를 출력하고 0 을 리턴한다.

전달된 숫자 벡터의 모든 값을 더하여 리턴한다.

 ```R
#문제4
vmSum = function(...) {
  x<-c(...)
  if ((!is.vector(x)) | (is.list(x))) {
    print('벡터만 전달하숑!')
    return()
  } else {
    if (!is.numeric(x)) {
      print('숫자 벡터를 전달하숑!')
      return(0)
    } else {
      return(sum(x))
    }
  }
}
vmSum(1,2,3,4,5)
 ```

[ 문제5 ]

다음 사양의 함수 vmSum2() 을 생성한다.

​    매개변수 : 1 개

   리턴 값 : 숫자벡터

   기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.

​       벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 가지고 error 를 발생시킨다.

​       벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 

​        메시지를 가지고 warning 을 발생시키고 0 을 리턴한다.

전달된 숫자 벡터의 모든 값을 더하여 리턴한다.

```R
#문제5
vmSum2 = function(...) {
  x<-c(...)
  if ((!is.vector(x)) | (is.list(x))) {
    stop("벡터만 전달하숑!")
  } else {
    if (!is.numeric(x)) {
      warning('숫자 벡터를 전달하숑!')
      return(0)
    } else {
      return(sum(x))
    }
  }
}
vmSum2(v1)
vmSum2("1","2","3")
vmSum2(1,2,3,4,5)
```



 

 

 