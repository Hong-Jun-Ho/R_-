getwd()
library(KoNLP)
library(wordcloud)
useSejongDic()
data1<-readLines(file.choose())
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2
data3<-unlist(data2)
data3
data3<-gsub("쌍수","쌍꺼풀",data3)
data3<-gsub("쌍커풀","쌍꺼풀",data3)
data3<-gsub("메부리코","매부리코",data3)
data3<-gsub("하이닥","",data3)
data3<-gsub("네이버","",data3)
data3<-gsub("\\d+","",data3)

data3
txt<-readLines(file.choose(),encoding = "UTF-8")z
txt
cnt_txt<-length(txt)
i<-1
for(i in 1:cnt_txt){
  data3<-gsub((txt[i]),"",data3)
}
data3
data3<-gsub("","",data3)
data3
data3<-gsub(" ","",data3)
data3
data3<-gsub("||","",data3)
data3<-gsub("\\.","",data3)
data3
write(unlist(data3),"remarke_22.txt")

data4<-read.table(file.choose())

data4

nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing = T),20)
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq = wordcount,scale = c(5,1),rot.per = 0.25,min.freq = 4,
          random.order = F,random.color = T,colors = palete)
legend(0.2,0.9,"여고생들이 선호하는 성형수술 부위",cex=1,fill=NA,border=NA,bg="white",
       text.col="red",text.font=2,box.col="red")
