[ 실습1 ]

다음영화 사이트에 올려진 (http://movie.daum.net/) 댓글에 대하여 **고객 평점과 리뷰글**을 1페이지(10개)만 스크래핑하여 데이터프레임 형식으로 만들어 "daummovie1.csv" 로 저장한다.

 

https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen

또는

https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen

R 코드는 movie1.R 로 생성하여 csv 파일과 함께 제출하세요.

 

 ![image-20191231152958122](./images/image-20191231152958122.png)

 ```R
url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url)
text
#영화리뷰
nodes<-html_nodes(text,".desc_review")
review<-html_text(nodes, trim=T)
review<-gsub("\t", "" ,review)
review<-gsub("[\r\n]", "" ,review)
review<-gsub("\n", "" ,review)
#영화평점
nodes<-html_nodes(text,".emph_grade")
grade<-html_text(nodes, trim=T)
grade<-gsub("\t", "" ,grade)
grade<-gsub("[\r\n]", "" ,grade)
grade<-gsub("\n", "" ,grade)
page <- data.frame(grade,review)
write.csv(page, "daummovie1.csv")
 ```





 [ 실습2 ]

이번에는 평점과 리뷰글을 20페이지까지 스크래핑하여 데이터프레임으로 만들어 "daummovie2.csv" 로 저장한다.

R 코드는 movie2.R 로 생성하여 csv 파일과 함께 제출하세요.

 ```R
site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
mov.review <- NULL
for(i in 1:20){
  url<-paste(site, i, sep="")
  text <- read_html(url)
  text
  #영화리뷰
  nodes<-html_nodes(text,".desc_review")
  review<-html_text(nodes, trim=T)
  review<-gsub("\t", "" ,review)
  review<-gsub("[\r\n]", "" ,review)
  review<-gsub("\n", "" ,review)
  #영화평점
  nodes<-html_nodes(text,".emph_grade")
  grade<-html_text(nodes, trim=T)
  grade<-gsub("\t", "" ,grade)
  grade<-gsub("[\r\n]", "" ,grade)
  grade<-gsub("\n", "" ,grade)
  page <- data.frame(grade,review)
  mov.review<-rbind(mov.review, page)
}
write.csv(mov.review, "movie2.csv")
 ```

