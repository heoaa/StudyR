## 외부 파일 함수 실행
getwd()
setwd('./day4')
getwd()

# 함수파일 호출
# 해당 파일에 저장되어 있는 함수 또는 명령문 실행
source('myfunc.R')

result <- mydiv(109, 6)
result


## 자격증 합격여부
sub1 <- c(14,16,12,20,8,6,12,18,16,10)
sub2 <- c(18,14,14,16,10,12,10,20,14,14)
sub3 <- c(44,38,30,48,42,50,36,52,54,32)
score <-data.frame(sub1, sub2, sub3)

source('determine.R')
result <- determine(score)
result


## 조건에 맞는 데이터 위치 리턴 함수
score2 <- c(76,84,69,50,95,60,82,71,88,84)
score2

# 조건에 만족하는 값의 위치(인덱스)_해당되는 모든 값의 위치 출력
which(score2 == 69)
which(score2 == 76)
which(score2 == 84)
which(score2 >= 80)
max(score2)
which.max(score2)   # max값의 위치

idx <- which(score2 <= 60)
idx
score2[idx]

score2[idx] <- 61
score2

idx <- which(score2 >= 80)
idx
score2[c(2,5,7,9,10)]

## iris 꽃잎의 길이가 5.0 이상인 것
idx <- which(iris$Petal.Length > 5.0)
idx
iris.big.1 <- iris[idx,]
str(iris.big.1)

# 위와 동일
str(subset(iris, iris$Petal.Length > 5.0))


## 언어 발달 상황 진단 프로그램 p 07_69
install.packages('Stat2Data')
library(Stat2Data)
data(ChildSpeaks)
str(ChildSpeaks)

# 말문 트인 시기(Age) 등급 환산
idx <- which(ChildSpeaks$Age < 9)
idx
ChildSpeaks[idx,]
ChildSpeaks[idx,'m1'] <- 5

idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 14)
idx
ChildSpeaks[idx,'m1'] <- 4

idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21)
idx
ChildSpeaks[idx,'m1'] <- 3

idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27)
idx
ChildSpeaks[idx,'m1'] <- 2

idx <- which(ChildSpeaks$Age >= 27)
idx
ChildSpeaks[idx,'m1'] <- 1

ChildSpeaks <- ChildSpeaks[,-5] # 잘못 생성한 m2 삭제

# 언어이해력 점수(Gesell) 등급 환산
idx <- which(ChildSpeaks$Gesell < 70)
idx
ChildSpeaks[idx,'m2'] <- 1

idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
idx
ChildSpeaks[idx,'m2'] <- 2

idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
idx
ChildSpeaks[idx,'m2'] <- 3

idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
idx
ChildSpeaks[idx,'m2'] <- 4

idx <- which(ChildSpeaks$Gesell >= 130)
idx
ChildSpeaks[idx,'m2'] <- 5

# total 열 추가 (m1 + m2)
ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2

# result 열 추가, 총점을 기준으로 언어 발달 상황 진단 결과 저장
idx <- which(ChildSpeaks$total < 3)
ChildSpeaks[idx,'result'] <- '매우느림'

idx <- which(ChildSpeaks$total >= 3 & ChildSpeaks$total < 5)
ChildSpeaks[idx,'result'] <- '느림'

idx <- which(ChildSpeaks$total >= 5 & ChildSpeaks$total < 7)
ChildSpeaks[idx,'result'] <- '보통'

idx <- which(ChildSpeaks$total >= 7 & ChildSpeaks$total < 9)
ChildSpeaks[idx,'result'] <- '빠름'

idx <- which(ChildSpeaks$total >= 9)
ChildSpeaks[idx,'result'] <- '매우빠름'


ChildSpeaks
ChildSpeaks[which.min(ChildSpeaks$total),]


## 종업원의 팁 분석하기 p07_75
install.packages("reshape2")
library(reshape2)
str(tips)

# 성별에 따른 팁 정도 비교
unique(tips$sex)
levels(tips$sex) # 유사함수
data(tips)

idx <- which(tips[,'sex'] == 'Female')
avg.female <- mean(tips[idx, 'tip'])  # female 팁 평균

idx <- which(tips[,'sex'] == 'Male')
avg.male <- mean(tips[idx, 'tip'])  # male 팁 평균

# 흡연 유무에 따른 팁 정도 비교
unique(tips$smoker)

idx <- which(tips[,'smoker'] == 'Yes')
avg.smoker <- mean(tips[idx, 'tip'])  

idx <- which(tips[,'smoker'] == 'No')
avg.nosmoker <- mean(tips[idx, 'tip'])  


# 종류별로 평균을 구해 결과를 돌려주는 함수로 중복 줄이기
source('meanbycol.tip.R')

meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size')
meanbycol.tip('day')
