## 패키지 설치 및 로드
install.packages("ggplot2")
library(ggplot2)
library(dplyr)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()


# cowsay 패키지지
install.packages("cowsay")
library(cowsay)

say(what = 'Hi', by = 'cat')
say(what = 'Hi', by = 'frog', what_color = 'green', by_color = 'green')
say(what = 'Hi', by = 'chicken', by_color = 'blue')


## 시스템 함수
Sys.Date()
Sys.time()


## 생일 맞추기 : ((m*4)+9)*25 + d
# (((m*4)*25) + (9*25) d - > (m*100) + 225 + d
val=931
d<-(val-225)%%100
m<-((val-225)-((val-225)%%100))/100
cat(m,'월',d, '일')

print(m,d)

# 소윤 : 931
(931-225)%%100
# 주연 : 754
# 민철 : 1029
# 석준 : 1139
# 현석 : 1442


# 9월 21일
# 900+225+21
# (1146-225-21)/100
# (1146-900)-225



