## 데이터입출력

age <- c(28,17,35,46,23,67,30,50)
age

str(age)

min(age)
max(age)

cat(' 가장 젊은 나이는', min(age), '세,\n',
    '가장 고령 나이는', max(age), '세 입니다')

# 화면에서 데이터 입력받기
install.packages("svDialogs")
library(svDialogs)

user.input <- dlgInput('수입을 입력하세요')$res
user.input
income <- as.numeric(user.input)
income
tax <- income * 0.05
tax

# 1e+4부터 출력을 10000로 변경하는 옵션
options(scipen = 1)

cat('세금', tax, '원')


x <- 1
y=10
print(x)
cat(x)

print(iris[1:6,])
head(iris)

cat(iris[1:6,])


## LAB 체질량 지수 계산

library(svDialogs)

heigth.in <- dlgInput('키를 입력하세요(cm)')$res)
weigh.in <- dlgInput('키를 입력하세요(kg)')$res)

heigth <- as.numeric(heigth)
weight <- as.numeric(weight)

height <- height/100
bmi <- weight/(height^2)

cat('키', height, 'cm, 몸무게', weight,'kg 입니다.')

# 숫자 천단위마다 콤마
#install.packages(formattable)
library(formattable)

## 파일 입출력

# 현재 작업 폴더 확인
getwd()

# 작업 폴더 변경 setwd('경로')

## csv파일 읽기
getwd()
air <- read.csv('./day3/airquality.csv', header = T)   # 첫행 헤더글 유무
str(air)
head(air)
tail(air,3)

# 품종이 setosa인 것만 저장
setosa.iris <- subset(iris, Species == 'setosa') 
str(setosa.iris)
setosa.iris
# row.names = F : 행번호가 같이 저장 안됌
write.csv(setosa.iris, './day3/setosa_iris.csv', row.names = F)


# xlsx 파일 읽기
#install.packages("xlsx")
#library(xlsx)
#airquality.xlsx <- read.xlsx('./day3/airquality.xlsx', header = T, sheetIndex=1)


# LAB 다이아몬드 정보
library(ggplot2)
str(diamonds)
head(diamonds)

levels(diamonds$cut)
levels(diamonds$color)
levels(diamonds$clarity)

dia_new <- subset(diamonds, cut =='Premium' & carat >= 2)
str(dia_new)
write.csv(dia_new, './day3/shiny_diamonds.csv', row.names = F)

# color가 D나 H가 아닌 나머지
dia_new_withoutDH <- subset(dia_new, color != 'D' & color != 'H')
str(dia_new_withoutDH)

write.csv(dia_new_withoutDH, './day3/shiny_diamonds_withoutDH.csv',
          row.names = F)
