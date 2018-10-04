## -------------------------------------------------------------------------------
# k__haching__rl
# [6] 평균월급 구하기
# http://www.data.go.kr
## -------------------------------------------------------------------------------
# step 1
var.csv <- "https://www.dropbox.com/s/9gchq4nbt67lpxu/example_salary.csv?dl=1"
var.salary <- read.csv( #r은 var가 의미없음. 그냥 의미있어보이게 하려고 준거
  var.csv,
  stringsAsFactors = T, # 성별 나이
  na = "-" #na는 not avaliable
)
head(var.salary)

# step2 구조파악 영어로바꾸기
# [1] "연령"                "월급여액..원."       "연간특별급여액..원."
# [4] "근로시간..시간."     "근로자수..명."       "경력구분"           
# [7] "성별"    

colnames(var.salary) <- c(
  "age","wage","special","workingTime","workerCount","Career","gender"
)
colnames(var.salary) 

# step3 검색대상을 data.frame 으로 전환하기
attach(var.salary) #인스턴스변수처럼됨 전역이됨. 

# step4 전체 임금 평균 구하기 (Y축의 높이를 결정)
wage.range <- range(wage,na.rm =T) 
wage.range #최소외 최대

  #  1117605 4064286
highWage <- which(wage==4064286);

  # index값 
var.salary[highWage,]

  # 4분위 구하기  (전체를 4등분) 내가 할려고 하는 데이터값이 어디부위에 속하냐
qnt = quantile(wage,na.rm=T) #set
qnt #get

# step5 리스트에 담기
wage.list <- list(
  평균월급 = mean(wage,na.rm = T),
  월급중앙값 = median(wage, na.rm = T),
  월급범위 = range(wage, na.rm = T),
  월급사분위 = quantile(wage, na.rm = T)
)
wage.list

wagePerGrader <- tapply(wage, gender, mean, na.rm=T) #table apply
wagePerGrader



#     남      여  차트를 분해해야해 남여 따로주려면
# 2477332 1865823 

t <- reshape2::melt(wagePerGrader)
t
ggplot2::ggplot(
  t,
  aes(x=Var1,y=value,fill=Var1)
)+geom_bar(
  stat = "identity"
)


wagePerCareer <- tapply(wage, Career, mean, na.rm=T) #table apply
wagePerCareer
t <- reshape2::melt(wagePerCareer)
t
ggplot2::ggplot(
  t,
  aes(
    x = Var1,
    y = value,
    group = 1
  )
)+geom_line(
  color = 'blue',
  size = 2
)+coord_polar()+
  ylim(0,max(t$value))
