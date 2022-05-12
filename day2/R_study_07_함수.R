y<-sqrt(100)
y1<-sqrt(x=2)

d<-c(1,7,4,2,3,NA)
d
# NA(결측값)는 sort시 출력 X
# sorts 
sort(d)
sort(x=d) #기본값(내림차순)
sort(x=d, decreasing = T) # 내림차순
sort(x=d, decreasing = F) # 오름차순

# 문자열 붙이기 함수 paste(값1, 값2, ...,sep = 지정구분자)
# 기본 구분자 ' '(공백백) 
str<-paste('Hello','world','!','This','is','R')
str
str1<-paste('Hello','world',sep = '/')
str1

a<-'나이는'
b<-20
c<-'입니다'
paste(a,b,c) # cat과 유사하나 문자열 붙이기 함수임

a<-1:12
b<-'월'
c<-paste(a,b,sep = '')
c

## 월별 매출액 분석
sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales)<-paste(1:12, '월', sep="")
sales

sales['7월']

sales['1월'] + sales['2월']

max.month<-sort(sales, decreasing = T)
max.month[1]

# 매출액 상위권 3달 합계
sum(head(max.month,3))

# 전반기 매출액
sum(sales[1:6])

# 1분기 매출액
sum(sales[1:3])


