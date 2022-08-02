## 막대그래프
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
                     'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING',
                     'SUMMER', 'SUMMER')
f.season <- table(favorite.season)
str(f.season)
f.season

barplot(f.season, main = '좋아하는 계절')

# 파라미터
barplot(f.season, main = '좋아하는 계절', 
        col = rainbow(4),
        xlab = '계절', ylab = '빈도수', 
        horiz = F, 
        names = c('가을', '봄', '여름', '겨울'), 
        las = 1) # 축명_가로세로 변경


## 중첩 막대그래프
age.A <- c(13709,10974,7979,5000,4250)
age.B <- c(17540,29701,36209,33947,24487)
age.C <- c(991,2195,5366,12980,19007)

ds <- rbind(age.A, age.B, age.C)
str(ds)

colnames(ds) <- c('1970', '1990', '2010', '2030', '2050')
ds

par(mfrow=c(1,1), mar=c(5,5,5,7)) # plot 여백 조정
barplot(ds, main = '인구수 추정')

# 파라미터
barplot(ds, main = '인구수 추정', col = rainbow(3),
        xlab = '연도', ylab = '인구수', 
        horiz = F,
        beside = F,  # 누적막대그래프 | 그룹별 막대그래프 택1
        legend.text = c('0~14세', '15~64세', '65세 이상'),  # 범례 표시(T | F | c(지정))
        args.legend = list(x='topright', bty='y',           # x로 범례 기본 위치 설정
                           inset=c(-0.27,-0.10)))           # inset으로 세부 위치 조정

# 연습
ha <- c(54659,61028,53307,46161,54180)
he <- c(31215,29863,32098,39684,29707)
mc <- c(15104,16133,15222,13208,9986)
vs <- c(13470,14231,13401,13552,13193)
bs <- c(16513,14947,15112,14392,17091)

ds <- rbind(ha, he, mc, vs, bs)
colnames(ds) <- c('19.1Q', '19.2Q', '19.3Q', '19.4Q', '20.1Q')
ds

par(mfrow=c(1,1), mar=c(5,5,5,5))
barplot(ds, main = '사업부문별 매출액',
        col = rainbow(5),
        horiz = T, las = 1, xlab = '(단위: 억 원)', beside = T,
        legend.text = c('H&A','HE','MC','VS','BS'),
        args.legend = list(x='topright', bty='n', inset=c(-0.18,-0.08)))


## 히스토그램
head(cars)
dist <- cars[,2]
dist
par(mfrow=c(1,1), mar=c(5,5,5,5))

hist(dist, main = '히스토그램(제동거리)')

# 파라미터
hist(dist, main = '히스토그램(제동거리)', 
     xlab = '제동거리', ylab = '빈도수',
     border = 'blue', col = 'skyblue', las = 1,
     breaks = 10) # 막대수 조절

# 연습
library(Stat2Data)
data(Diamonds)
str(Diamonds)
head(Diamonds)

ds <- Diamonds$PricePerCt

hist(ds, main = '다이아몬드 시세(캐럿당)', breaks = 9, col = 'green',
     xlab = '캐럿당 가격($)', ylab = '빈도수', las = 1)

color <- rep('#a8dadc', 9)
color[3] <- '#1d3557' 

# 빈도수 많은 막대 구분
hist(ds, main = '다이아몬드 시세(캐럿당)', breaks = 9,
     xlab = '캐럿당 가격($)', ylab = '빈도수', las = 1,
     col = color, border = '#457b9d')


## 파이차트
favorite.season
ds <- table(favorite.season)
ds

pie(ds, main = '선호계절', radius = 1, col = rainbow(4))

# 3차원 파이차트
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

## 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)

plot(x=month, y=late, main = '지각생 통계', type = 'o',)

# 파라미터
plot(x=month, y=late, main = '지각생 통계',
     type = 'o',   # 그래프 종류 선택(l, s, o, b 등)
     lty=1,   # 선 종류 선택
     lwd=2,   # 선의 굵기 
     xlab = '월별', ylab = '지각생 수')

# 연습(선그래프 2개 이상)
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(x=month, y=late1, main = '지각생 통계',
     type = 'b', lty=1, lwd=2, col ='red',
     xlab = '월별', ylab = '지각생 수',
     ylim = c(1,15))  # y축 범위 지정
lines(month, late2, type = 'b', 
      lty=1, lwd=2, col = 'blue')


## 산점도
head(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg

plot(wt, mpg, main = '중량-연비 Scatter plot')
plot(mtcars$wt, mtcars$mpg)
plot(mtcars[,c('wt','mpg')])
plot(mpg~wt, data = mtcars)

# 파라미터
plot(wt, mpg, main = '중량-연비 Scatter plot',
     xlab = '중량', ylab = '연비(mpg)', las = 1,
     col = 'red', pch = 19) # point 컬러, 종류

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


## 다중그래프
par(mfrow=c(2,2), mar=c(3,3,4,2))  # 화면분할(2x2)
par(mfrow=c(2,2))

# 그래프 1 (히스토그램은 벡터형식 )
hist(iris$Sepal.Length, main = '붓꽃 꽃받침 길이', col = 'orange')

# 그래프 2 (막대그래프는 테이블형식)
head(mtcars)
barplot(table(mtcars$cyl), main = '자동차 실린더', 
        col = c('red', 'green', 'blue'))

# 그래프 3
barplot(table(mtcars$gear), main = '자동차 기어수',
        col = rainbow(3), horiz = T)

# 그래프 4
pie(table(mtcars$cyl), main = '자동차 실린더', 
    col = topo.colors(3),   # topo팔레트
    radius = 1.05)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 분할 취소
par(mfrow=c(1,1))

