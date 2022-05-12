## 벡터심화

# 산술연산
d<-c(1,4,3,7,8)
2*d
d-5

x <- c(1,2,3,4)
y <- c(5,6,7,8)
x+y
x*y
z <- x-y
z

# 벡터와 벡터 연산
m <- c(x,y)
m
n <- c(y,x)
n
p <- c(m,n,90,100)
p

# 벡터 연산 2
v1<-c(1,2,3)
v2<-c('John', 'Jane','Tom')
v3<-c(v1, v2)
v3

## 벡터 사용 함수수
datas=1:10
sum(datas)
sum(datas)
length(datas)
mean(datas)
median(datas)
max(datas)
min(datas)
sort(datas)
sort(datas, decreasing = T)
v2 <- sum(datas)/length(datas)
v2

var(datas)
sd(datas)
range(datas)


## 논리연산자
d<-1:9
d
d >= 5
d
d > 5
d
d[d>5]

d==5
condi <- d>5 & d<8
d[condi]



# LAB
install.packages('formattable')
library(formattable)

espresso <- c(4,5,3,6,5,4,7)
americano <- c(63,68,64,68,72,89,94)
latte <- c(61,70,59,71,71,92,88)

price <- c(2000, 2500, 3000)
names(price) <-c('esp', 'ame', 'lat')
price

sale.espresso <- price['esp'] * espresso
sale.espresso
sale.americano <- price['ame'] * americano
sale.americano
sale.latte <- price['lat'] * latte
sale.latte

sale.day <- sale.espresso + sale.americano + sale.latte
names(sale.day) <- c('Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun')
sale.day

# 일주일간 총 매출액
cat('총매출액', sum(sale.day), '원')

# 일평균 매출액
cat('일평균매출출액', mean(sale.day), '원')

# 평균이상 요일 구하기
result <- names(sale.day[sale.day >= mean(sale.day)])
cat('평균매출액보다 매출액이 높은 요일은', result)



cat('총매출액', sum(sale.day), '원')
cat('일평균매출출액', mean(sale.day), '원')
cat('평균매출액보다 매출액이 높은 요일은', result)
