## 그래프2

# 원그래프(Pie chart)
favorite.season
ds <- table(favorite.season)
ds

pie(ds, main = '선호계절', radius = 1, col = rainbow(4))

# 3차원 원그래프
install.packages("plotrix")
library(plotrix)

pie3D(ds, main = '선호계절', radius = 1.2, 
      col = c('brown', 'lightgreen', 'skyblue', 'white'),
      labels=names(ds), labelcol = 'blue', 
      labelcex = 1,  # 레이블 폰트 크기
      theta = 1,  # 각도
      explode = 0.1,  # 파이 간 간격
      border = 'yellow',  # 선 색깔
      height = 0.15,
      shade = 0.7) # 음영, 그림자


# 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)

plot(x=month, y=late, main = '지각생 통계',
     type = 'o',   # 그래프 종류 선택(l, s, o, b 등)
     lty=1,   # 선 종류 선택
     lwd=2,   # 선의 굵기 
     xlab = '월별', ylab = '지각생 수')

# 선그래프 2개 이상
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(x=month, y=late1, main = '지각생 통계',
     type = 'b', lty=1, lwd=2, col ='red',
     xlab = '월별', ylab = '지각생 수',
     ylim = c(1,15))  # y축 범위 지정
lines(month, late2, type = 'b', 
      lty=1, lwd=2, col = 'blue')


## LAB 과목에 대한 선호도 점수별 비율  p09_20
install.packages("DAAG")
library(DAAG)

View(science)
head(science)
str(science)

ds <- table(science$like)
ds

#
pie(ds, main = '선호 점수별 비율',
    col = rainbow(length(ds)), radius = 1)

#
library(plotrix)
ds2 <- table(science$State)
ds2
pie3D(ds2, main = '주별 학생 비율',
      labels = names(ds), labelcex = 1,
      explode = 0.1, radius = 1, theta = 0.6,
      shade = 0.7)


## 산점도
head(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg

plot(wt, mpg, main = '중량-연비 Scatter plot',
     xlab = '중량', ylab = '연비(mpg)', las = 1,
     col = 'red', pch = 19) # point 컬러, 종류

# 위와 동일
plot(mtcars$wt, mtcars$mpg)
plot(mtcars[,c('wt','mpg')])
plot(mpg~wt, data = mtcars)

# 여러 변수 간 산점도 **
vars <- c('mpg','disp','drat','wt')   # 대상 변수
target <- mtcars[, vars]
head(target)

plot(target, main = '변수간 산점도', col = 'blue', pch = 20)


# 그룹정보가 있는 산점도
head(iris)
levels(iris$Species)

iris.2 <- iris[,3:4]
group <- as.numeric(iris$Species)  # 숫자로 그룹별 코드 표현
group

color <- c('red', 'green', 'blue')
plot(iris.2, main = '붓꽃 꽃잎 길이-넓이 산점도',
     pch = group, col = color[group],
     xlab= '꽃잎 길이', ylab = '꽃잎 넓이', las = 1)

# 범례
legend(x='bottomright', legend = levels(iris$Species),
       col = color, pch = c(1:3))


## LAB 자동차 선팅 분석
library(DAAG)
str(tinting)
View(tinting)

plot(tinting$it, tinting$csoa)

group <- as.numeric(tinting$tint)
color.3 <- c('red', 'green', 'blue')
plot(tinting$it, tinting$csoa, pch = group,
     col = color.3[group])


group <- as.numeric(tinting$agegp)
color <- c('red', 'blue')
plot(tinting$it, tinting$csoa, pch = group,
     col = color[group])


##
library(DAAG)
str(socsupport)
help(socsupport)

ds <- table(socsupport$age)
pie3D(ds, main = '연령 분포', labels = names(ds),
      labelcex = 1.1, explode = 0.1,  radius = 1)


##
group <- as.numeric(socsupport$gender)
color <- c('blue', 'red')

plot(socsupport[,c('emotionalsat', 'tangiblesat', 'age')], 
     pch = group, col = color[group])
