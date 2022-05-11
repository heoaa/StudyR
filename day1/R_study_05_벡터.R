## 벡터 = 파이썬 리스트와 유사
# 학생성적
score <- c(68,95,83,76,90,80,85,91,82,70)
mean(score)
score

summary(score)


x<-c(1,2,3)
x.1<-1:3
x
x.1

y<-c('a','b','c')
y

z<-c(TRUE, FALSE, F, T)
z

y.1<-c('Hello','World','!','c')
y.1

# 문자가 하나라도 섞여있으면 문자로 전환
w<-c(1:5)
w

w.1<-c('7',8)
w.1

v1<-50:90
v2<-c(1,2,3,10:20)
v2

## seq(시작, 끝, 간격)
v3<-seq(1, 100, 2)
v3

v4<-seq(0.1, 1.0, 0.1)
v4

#v4.date<-seq.Date(data('2021-01-01'),'2021-01-31',by=1)

## rep(값, times=반복수) : times만큼 반복
v5<-rep(1, times=5)
v5

v6<-rep(1:5, times=3)
v6

v7<-rep(c(1,3,4), times=3)
v7

v8<-rep(seq(1,10,2), times=2)
v8

v9<-rep(c('a','b'), each=4)
v9

v9_<-rep(c(1,2,3), each=4)
v9_

## 벡터 이름붙이기
absent=c(8,2,0,4,1)
names(absent)<-c('Mon','Tue','Wed','Thu','Fri')
names(absent)

# 이름 붙인 이후로 names 함께 출력됨됨
absent

absent[1] # 인덱스는 1부터 출발
absent[2]
absent[3:5]
absent[6] # 입력하지 않은 값은 결측값(NA) 표시 _ 에러는 발생하지 않음
absent['Mon']


var.1<-10
var.1
var.1<-'10'
var.1
var.1<=T
var.1


