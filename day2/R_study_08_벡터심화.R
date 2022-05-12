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
