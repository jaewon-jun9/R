다음의 요구 사항대로 구현하고 모든 소스와 생성된 csv 파일을 제출한다.

다음은 https://comic.naver.com/genre/bestChallenge.nhn 사이트의 콘텐츠 일부이다.

박스로 표시된 내용을 추출하고 “comicName,  comicSummary, comicGrade” 열명으로 DataFrame을 생성하여

navercomic.csv로 저장하고 소스는 navercomic.R로 저장한다. 

모든 페이지를 크롤링하고 스크래핑한다.





![image-20200128214359908](F:\code\R\study\practice\images\image-20200128214359908.png)

```R
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
pageNum = 1 #하단 페이지 넘버중 가장 큰수를 넣기위한 변수, 초기치로 countPage 변수 보다 크게 잡아야 while 구문이 돌아감
countPage = 0 #현재 페이지를 카운트 하기 위한 변수
bestpage <- NULL #저장용 변수 초기화
while (pageNum>countPage) { #현재 페이지와 하단 페이지 넘버중 가장 큰 숫자를 비교
  url<-paste(site,countPage+1,sep="") #paste함수로 페이지 번호를 주소에 붙이기, 1페이지 부터 시작하므로 +1을 사용하여 주소 완성
  text <- read_html(url) #페이지 읽어오기
  nodes<-html_nodes(text, ".challengeInfo > h6 > a") #제목 가져오기 위한 노드
  comicName<-html_text(nodes, trim=T) #trim=T를 통해 제목을 정리된 상태로 가져옴
  comicName<-gsub("\t", "" ,comicName) #탭문자 제거
  comicName<-gsub("\r\n", "" ,comicName) #줄바꿈 제거
  comicName<-gsub("\n", "" ,comicName) #줄바꿈 제거
  nodes<-html_nodes(text, ".summary") #요약문 가져오기 위한 노드
  comicSummary<-html_text(nodes, trim=T)
  comicSummary<-gsub("\t", "" ,comicSummary)
  comicSummary<-gsub("\r\n", "" ,comicSummary)
  comicSummary<-gsub("\n", "" ,comicSummary)
  nodes<-html_nodes(text, ".rating_type") #평점 가져오기 위한 노드
  comicGrade<-html_text(nodes, trim=T)
  comicGrade<-gsub("평점", "" ,comicGrade) #"평점" 이라는 텍스트 제거
  comicGrade<-gsub("\\s", "" ,comicGrade) #공백문자 모두제거 \n \r \t 등이 모두 제거됨
  comicpage  <- data.frame(comicName,comicSummary,comicGrade) #데이터 프레임 생성
  bestpage <-rbind(bestpage,comicpage) #저장용 변수에 병합 rbind를 사용하여 기존 데이터 아래 쪽에 새로운 다수의 행을 추가
  nodes<-html_nodes(text, "#content > div.paginate > div > a > em") #하단의 페이지 번호를 모두 가져옴
  pageNum<-max(as.numeric(html_text(nodes, trim=T))) #가져온 페이지 번호중 가장 큰 값을 pageNum에 넣음
  countPage<-countPage+1 #페이지 숫자를 1 증가
} #마지막 페이지에 도달하면 pageNum>countPage 이 부정되어 while문 종료
write.csv(bestpage, "navercomic.csv") #CSV 파일로 출력
```

