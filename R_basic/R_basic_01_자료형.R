### 자료형
## NA(Not Available) : 데이터 값이 없음, 결측치

## NULL : 프로그래밍의 편의를 위해 미정(undefined) 값을 표현하는 데 사용

## 문자열 : ' ', " "

## 진리값 : TRUE, FALSE (T, F 약자 사용 가능)
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE
c(TRUE, TRUE) & c(TRUE, FALSE)
c(TRUE, TRUE) && c(TRUE, FALSE)


## 팩터(Factor) : 범주형 데이터(자료)를 표현하기 위한 데이터 타입
## 범주형 자료는 명목형(Nominal)과 순서형(Ordinal)으로 구분
# factor : 팩터 값을 생성
'factor(
   X,       # 팩터로 표현하고자 하는 값(주로 문자열 벡터로 지정)
   levels,  # 값의 레벨
   ordered  # TRUE면 순서형, FALSE면 명목형 데이터를 뜻한다. 기본값은 FALSE>다.
)
>> 팩터형 데이터 값'
day <- factor('mon',c('mon','tue','wen','thr','fri'))
day

nlevels(day)   # 팩터에서 레벨의 개수를 반환
levels(day)    # levels : 팩터에서 레벨의 목록을 반환
levels(day)[2]

levels(day) <- c('Mon','Tue','Wen','Thr','Fri')   # 레벨 값 수정

is.factor(day)  # 주어진 값이 팩터인지 판단

# ordered : 순서형 팩터를 생성
al <- ordered('a',c('a','b','c','d','e'))   # 또는
al
al <- factor('a',c('a','b','c','d','e'), ordered=TRUE)
al

is.ordered(al)  # 주어진 값이 순서형 팩터인지 판단


## 스칼라(Scalar) : 단일 차원의 값 = 길이가 1인 벡터
## 벡터 : 한 가지 스칼라 데이터 타입의 데이터를 저장

x <- c(1, 2, 3)   # c : 주어진 값들을 모아 벡터를 생성
x
y <- c('1','2','3')
y
z <- c(1,2,'3')   # 문자열이 하나라도 섞여있으면 문자열 벡터
z

a <- c(1,2,3)
names(a) <- c('kim','lee','hong')   # 객체에 이름을 저장
a

names(a)   # 객체의 이름 반환
names(a)[2]

length(a)  # 객체의 길이 반환
NROW(a)    # 행 개수 반환, 벡터와 행렬 모두 가능

# 벡터 연산 함수
identical(c(1, 2, 3), c(1, 2, 3))   # 객체가 동일한지 판단(동일하면 TRUE, 그렇지 않으면 FALSE)
identical(c(1, 2, 3), c(1, 2, 100))

union (c("a", "b", "c"), c("a", "d"))       # 합집합

intersect (c("a", "b", "c"), c("a", "d"))   # 교집합

setdiff (c("a", "b", "c"), c("a", "d"))     # 차집합

setequal (c("a", "b", "c"), c("a", "d"))    # 같은 집합인지 판단
setequal (c("a", "b", "c"), c("a", "b", "c", "c"))

"a" %in% c("a", "b", "c")   # value %in% x : 벡터 x에 value가 저장되어 있는지 판단
"d" %in% c("a", "b", "c")


# seq : 연속된 값을 저장하는 벡터
'seq(
  from,  # 시작 값 
  to,    # 끝 값 
  by     # 증가치 
)'
seq(1,5)   # 시퀀스를 생성
seq(1,10,2)

1:5

# rep : 반복된 값을 저장한 벡터
'rep(
   x,      # 반복할 값이 저장된 벡터 
   times,  # 전체 벡터의 반복 횟수 
   each    # 개별 값의 반복 횟수 
)'
rep(1:2, times=5)  # times 만큼 반복
rep(1:2, each=5)   # 개별 값이 each 만큼 반복
rep(1:2, each=5, times=2)   # 개별 값을 each 만큼 반복 후 times 만큼 총 반복


## 리스트 :  ‘(키, 값)’ 형태의 데이터를 담는 연관 배열
h.list <- c('balling', 'tennis', 'ski')
person <- list(name='Tom', age=25, student=T, hobby=h.list)
person

person[1]
person[[1]]
person[['name']]
person$name
person$student
person$hobby
person[[4]][2]


## 행렬(Matrix)
'matrix( 
   data,          # 행렬을 생성할 데이터 벡터 
   nrow,          # 행의 수 
   ncol,          # 열의 수 
   byrow=FALSE,   # TRUE로 설정하면 행우선, FALSE일 경우 열 우선으로 데이터를 채운다. 
   dimnames=NULL  # 행렬의 각 차원에 부여할 이름 
)'
matrix(c(1, 2, 3, 4, 5, 6), nrow=3)
matrix(c(1, 2, 3, 4, 5, 6), ncol=3)

matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3, byrow=TRUE)   # 행부터 채우기

matrix(1:9, nrow=3,
       dimnames=list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))   # 행, 열 이름 지정

x <- matrix(1:9, ncol=3)
dimnames(x) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
x

x <- matrix(1:9, ncol=3)
rownames(x) <- c("r1", "r2", "r3")   # 행 이름 지정
x
colnames(x) <- c("c1", "c2", "c3")   # 열 이름 지정
x

x
t(x)       # 전치행렬

x <- matrix(c(1, 2, 3, 4), ncol=2)
solve(x)         # 역행렬
x %*% solve(x)   # 단위행렬

nrow(x)   # 행 개수 반환
ncol(x)   # 열 개수 반환
NROW()   # 행과 열 개수 반환, 벡터와 행렬 모두 가능


## 배열(Array) : 다차원 데이터
'array(
   data=NA,           # 데이터를 저장한 벡터
   dim=length(data),  # 배열의 차원. 이 값을 지정하지 않으면 1차원 배열이 생성된다.
   dimnames=NULL      # 차원의 이름
)'
x <- array(1:12, dim=c(2, 2, 3))
x


## 데이터프레임


## 자료형 변환 : 객체 x를 해당 자료형(as.해당 자료형())으로 변환
as.factor(x)
as.numeric(x)
as.character(x)
as.matrix(x)
as.array(x)
as.data.frame(x)


