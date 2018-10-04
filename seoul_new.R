if("KoNLP" %in% installed.packages("KoNLP") == FALSE)install.packages("KoNLP")
library(KoNLP)
if("tm" %in% installed.packages("tm") == FALSE)install.packages("tm")
library(tm)
if("wordcloud" %in% installed.packages("wordcloud") == FALSE)install.packages("wordcloud")
library(wordcloud)


target <- readLines("https://www.dropbox.com/s/fp90obdsboz4zwn/seoul_new.txt?dl=1")
target
useSejongDic()
# target <- gsub("\\W","",target) 
target <- gsub("\\d","",target) 
target <- sapply(target, extractNoun, USE.NAMES = F)
target
target<-unlist(target)
class(target)
target <- Filter(function(x){!nchar(x) == 1},target)
head(sort(target,decreasing=T),20)
target


###########
# Sequence
seq <- c(1:10)

# PRINT 1000
for (i in seq) {
  print(i)
}

# A sum variable
sum<-0

# Sum loop
for ( i in seq) {
  sum<-seq[i] + seq[i]
  print(sum)
}

# 킬러
getwd()
killer <- readLines("killer.txt")
killer 
for(i in 1:length(killer)){ #1부터 10까지 삭제가능?
 target <- gsub(killer[i],"",target)  
}
target 
target <- unlist(target)
target <- Filter(function(x){!nchar(x)==0},target)

# 태그모음 만드는방법
write(unlist(target),"seoul_new_result.txt")
target<- read.table("C:\\Users\\K\\Documents\\seoul_new_result.txt")
target<- table(target)
target
pal<- brewer.pal(8,"Dark2")
wordcloud::wordcloud(
  names(target),
  freq = target,
  min.freq = 1,
  max.words = 300,
  random.order = F,
  rot.per = .1,
  scale = c(4,0,3),
  color = pal
)


