# 매트릭스 복습

z <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z

x <- c(20, 25, 30, 35)
x

m1 <- cbind(z, x)  # 열기준 결합
m1

y <- (36:41)
y

m2 <- rbind(m1, y)  # 행기준 결합
m2


# 값 추출
m2[1,3]
m2[1,6]
m2[1,7]

z[4,5]
z[,5]

z[2,1:3]
z[1,c(1,2,4)]

z
z[1:2,]
z[1:2, c(1,2)]


# 매트릭스 이름붙이기
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60), nrow = 4)
score

rownames(score) <- c('John', 'Tom', 'Mark', 'Jane')
colnames(score) <- c('English', 'Math', 'Science')
score

score['John', 'Math']
score['Tom', 'Science']

score['Tom',]
score[,'English']

rownames(score)
colnames(score)
colnames(score)[2]


# 햄버거 영양 성분 정보 제공하기
burger <- matrix(c(514,533,566,
                   917,853,888,
                   11,13,10), nrow = 3)
burger

rownames(burger) <- c('Mcdonald', 'Lotteria', 'Bugerking')
colnames(burger) <- c('열량(kcal)', '나트륨(na)', '포화지방(fat)')
burger

burger['Mcdonald', '나트륨(na)']
burger['Mcdonald',]
burger[,'열량(kcal)']


## 데이터프레임
physicals <- matrix(c(168.4,169.5,62.4,65.5,'M', 'F'), nrow = 2)
physicals   # 전부 문자열로 바뀜(매트릭스)

city <- c('Seoul', 'Tokyo', 'Washington')
rank <- c(1,3,2)
city.info <- data.frame(city, rank)
city.info


## iris dataset
iris
head(iris)
tail(iris)
str(iris)  # 변수 타입(정보) 확인

str(burger)
str(c('John', 'Tom', 'Mark', 'Jane'))

iris[140,]
iris[,5]
levels(iris[,5])
iris[,c(1,2)]
iris[,c('Sepal.Length', 'Petal.Length','Species')]
val <- head(iris[,c('Sepal.Length', 'Petal.Length','Species')])
val[1,3]
head(iris[,c('Sepal.Length', 'Petal.Length','Species')])[1,]
str(head(iris[,c('Sepal.Length', 'Petal.Length','Species')]))


## 햄버거 영양 성분 정보 추가
kcal <- c(514,533,566)
na <- c(917,853,888)
fat <- c(11,13,10)
menu <- c('새우버거','불고기버거','치킨버거')
burger.2 <- data.frame(kcal, na, fat, menu)
burger.2

rownames(burger.2) <- c('맥도날드', '롯데리아', '버거킹')
burger.2

burger.sum <- burger.2[,'na']*burger.2[,'fat']
burger.sum

burger.2['맥도날드',]


##
dim(iris) # 행, 열개수 출력
dim(burger.2)
nrow(iris) # 행 개수
ncol(iris) # 열 개수
colnames(burger.2) # 열 이름 출력
rownames(burger.2) # 행 이름 출력
head(iris, 5) # 상위 5행 출력
tail(iris, 3) # 하위 3행 출력

str(iris) # 데이터셋 요약 정보보
iris$Sepal.Length
levels(iris$Species)

# 행별, 열별 합계, 평균 산술계산
colSums(iris[,-5])
head(iris)

colMeans(iris[,-5])

z <- matrix(1:20, nrow=4, ncol=5)
z
t(z)  ## 행과 열 방향 변환

iris.subset.1 <- subset(iris, Species =='setosa')
iris.subset.1

iris.subset.2 <- subset(iris, Sepal.Length >5.0 & Sepal.Width>4.0)
iris.subset.2
str(iris.subset.2)


iris.subset.2$Sepal.Length
iris.subset.2[,c(1,2,5)]


a <- matrix(1:20, 4, 5)
b <- matrix(21:40, 4,5)
a
b
a+b
a*b
a.2 <- a*2
a
a.2


class(iris) # 데이터셋 자료구조 확인
str(iris)  # 자료구조화 데이터 형식 확인

is.matrix(iris)  # 데이터셋이 매트릭스인지 확인
is.matrix(a)
is.data.frame(iris)  # 데이터셋이 데이터프레임임인지 확인
is.data.frame(a)

## LAB 벚나무 판매
class(trees)
str(trees)

# 화원 나무의 직경 평균
girth.mean <- mean(trees[,1])  # or mean(trees$Girth)
candidate <- subset(trees, Girth >= girth.mean & 
                      Height >= 80 &
                      Volume >= 50)
candidate
nrow(candidate)


## 종업원 팁 계산
install.packages("reshape2")
library(reshape2)
tips

str(tips)
head(tips)
tail(tips)
levels(tips$day)

# 요일별 팁 빈도
table(tips$day)
str(table(tips$day))

# 요일별 시간대에 따른 팁 빈도
dinner <- subset(tips, time == 'Dinner')
lunch <- subset(tips, time == 'Lunch')

table(dinner$day)
table(lunch$day)

# 열평균
# dinner.data <- dinner[c('total_bill', 'tip', 'size')]
# lunch.data <- lunch[c('total_bill', 'tip', 'size')]
# colMeans(dinner.data)
# colMeans(lunch.data)
colMeans(dinner[c('total_bill', 'tip', 'size')])
colMeans(lunch[c('total_bill', 'tip', 'size')])

# 결제 금액 대비 평균 팁
tip.rate <- tips$tip/tips$total_bill
mean(tip.rate)*100 
