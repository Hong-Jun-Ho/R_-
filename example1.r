setwd("C:/Users/GD7/Documents/r") 
install.packages("KoNLP") ## 패키지 설치 
library(KoNLP) ## 설치된 패키지 로드 
library(wordcloud)
useSejongDic() ## 한글이 저장되어 있는 세종사전을 사용함
mergeUserDic(data.frame("서진수","ncn"))
mergeUserDic(data.frame(readLines("mergefile.txt"),"ncn"))

data1<- readLines("seoul_new.txt") #데이터 파일 불러오는방법 
data2<- sapply(data1,extractNoun,USE.NAMES = F) # sapply 함수는 여러건의 데이터를 한꺼번에 저장하는 함수 
                                                # extracNoun 함수는 문장을 단어로 만든 후 명사만 추출하는 함수 
head(data2,30)
head(unlist(data2),30) # unlist 라는 함수를 사용하면 기존 리스트를 제거하고 새롭게 list하여 출력됩니다. 
data3<-unlist(data2)

# 출력 결과에서 원하지 않는 내용 걸러 내기 

data3<-gsub("\\d+","",data3) ## 모든 숫자 없애기 
data3<-gsub("서울시","",data3) ## gsub("변경전 글자","변경후 글자", "원본데이터")
data3<-gsub("서울","",data3)
data3<-gsub("요청","",data3)
data3<-gsub("제안","",data3)
data3<-gsub(" ","",data3)
data3<-gsub("-","",data3)
data3<-gsub("한","",data3)
data3<-gsub("집","",data3)
data3<-gsub("동","",data3)
data3<-gsub("내","",data3)
data3<-gsub("적","",data3)
data3<-gsub("장","",data3)
data3<-gsub("앞","",data3)
data3<-gsub("년","",data3)
data3<-gsub("들","",data3)
data3<-gsub("동","",data3)
data3<-gsub("호","",data3)
data3<-gsub("구","",data3)
data3

write(unlist(data3),"seoul_2.txt") # 열어보면 "" 공백값이 엄청 많음 이 부분을 모두 제거해야함 
data4<-read.table("seoul_2.txt") # read.table 명령으로 공백부분 제거 
data4

nrow(data4) # data4 변수에 데이터가 몇 건이 있는 지 조회 해 보는 것 
wordcount<-table(data4)
wordcount

head(sort(wordcount,decreasing = T),20)
data3<-gsub("OO","",data3)  
data3<-gsub("개선","",data3)  
data3<-gsub("문제","",data3)  
data3<-gsub("관리","",data3)  
data3<-gsub("민원","",data3)  
data3<-gsub("이용","",data3)  
data3<-gsub("관리","",data3)  
data3<-gsub("시장","",data3) 
data3<-gsub("이","",data3) 
data3<-gsub("안","",data3) 
data3<-gsub("강","",data3) 
data3<-gsub("시","",data3) 
data3<-gsub("기","",data3) 
data3<-gsub("물","",data3) 
data3<-gsub("가","",data3) 
data3<-gsub("아","",data3) 
data3<-gsub("전","",data3) 
write(unlist(data3),"seoul_3.txt")
data4<-read.table("seoul_3.txt")
data4 
nrow(data4) # data4 변수에 데이터가 몇 건이 있는 지 조회 해 보는 것 
wordcount<-table(data4)
head(sort(wordcount,decreasing = T),20)

library(RColorBrewer)
palete<-brewer.pal(9,"Set3")  

# 아래 worldcloud 에서 min.freq에 있는 항목이 언급된 횟수로 최소 1회 이상 언급된 단어만
# 출력하라는 예입니다. 

wordcloud(names(wordcount),freq = wordcount,scale = c(5,1),rot.per = 0.25,min.freq = 3,
          random.order=T,random.color=T,colors=palete)

legend(0.3,1,"서울시 응답소 요청사항 분석",cex=0.8,fill=NA,border=NA,bg='white',text.col="red",
       text.font=2,box.col="red")

























  
  
  
  
  
  
  
  
  
  
  
  

