## 변수
total <- 5050
total
print(total)
# python의 print( , , )와 유사
cat('합계는', total)


# 한글 변수명은 피하기기
변수 <- 100
변수   # 에러
print(변수)
cat(변수, total)


a<-10
b<-20
c<-a+b
cat(a, '+', b, '=', c)


## 변수 특이점 : .(마침표) 허용
abs <- 50
kkk <- 30
mid.sum<-abs

# 논리형(줄여쓰기 가능)
a<-F
a
aa<-T
aa

10/0

val = NULL
val

age.1<-20
age.2<-25
print(age.1+age.2)
name.1<-'John'
print(name.1)
grade.1<-'3'
print(age.1+grade.1)   # 에러


5>3
2>7
TRUE + TRUE
T+T
a<-T
b<-F
a+b


# 소금= ()mg, 물 = ()ml : 농도 = ()%
# 소금의 양
salt <- 10 #mg
# 물의 양
water <- 100 #ml
# 결과
result <- (salt / (salt+water))*100
options(digits = 3)
cat('소금=', salt, 'mg', '물=', water, 'ml: 농도=', result, '%')
