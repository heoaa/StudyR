## 결측값
z <- c(1,2,3,NA,5,NA,8)

summary(z)       # NA 개수 확인 가능

sum(z)  # 결측값이 포함되어 있으면 정상적 연산 불가능
min(z)
mean(z)
var(z)

is.na(z)         # NA 여부 확인
sum(is.na(z))    # NA 개수 확인
sum(c(T,T,F))
sum(z, na.rm = T)   # NA 제외 후 계산


# 결측값 제거/대체_치환(0, mean)
z1 <- c(1,2,3,NA,5,NA,7)
z2 <- c(5,8,1,NA,3,NA,7)
#z1[is.na(z1)] <- 0
#z1

z3 <- as.vector(na.omit(z2))   # NA 제거 후 새 벡터 생성
z3
z4 <- z1
z4[is.na(z4)] <- ceiling(sum(z4, na.rm = T)/length(z4))

summary(z4)
summary(1,2,3,4,5,6,7)
summary(z1)


## 2차원 결측값
iris.na <- iris
iris.na[1,2] <- NA
iris.na[1,3] <- NA
iris.na[2,3] <- NA
iris.na[3,4] <- NA
head(iris.na)

# 결측값 확인(열별)
for (i in 1:ncol(iris.na)) {
  this.na <- is.na(iris.na[,i])
  cat(colnames(iris.na)[i], '\t', sum(this.na), '\n')
}

# apply 함수 **
col_na = function(y) {
  return(sum(is.na(y)))
}
na_count <- apply(iris.na, 2, FUN = col_na)
na_count


## 결측값 확인(행별)
result <- rowSums(is.na(iris.na))
sum(result > 0)
sum(is.na(iris.na))


## 매트릭스 NA 제외 전처리
head(iris.na)
iris.na[complete.cases(iris.na),]   # NA 제외 후 표시

iris.na[complete.cases(iris.na) == F,]  # NA 만 표시
iris.na[!complete.cases(iris.na),]      # 위와 동일

# NA가 포함된 1~3행 제거
iris.comp <- iris.na[complete.cases(iris.na),]


## 정렬
v1 <- c(1,7,6,8,4,2,3,9)
sort(v1, decreasing = T)  # T : 역정렬

name <- c('정대일','강재구','신현석','홍길동')
sort(name)
sort(name, decreasing = T)

idx <- order(name)
idx
name[idx]

a <- c(1,2,3,4,5)
b <- c(11,24,55,23,9)
z <-rbind(a,b)
str(z)
colnames(z) <- c('C1','C2','C3','C4','C5')
z[,1]


# 데이터프레임 정렬
sort(iris$Sepal.Length)

sl.order <- order(iris$Sepal.Length)
iris.new <-iris[sl.order,]
iris.ag <- iris[order(iris$Species,iris$Petal.Length,
                      decreasing = T),]


## 샘플링
x <- 1:100
y <- sample(x, size = 5, replace = F)   # replace = F : 비복원추출
y

idx <- sample(1:nrow(iris), size = 15, replace = F)
idx

iris.15 <- iris[idx,]
iris.15


## set.seed()
sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
sample(1:20, size = 5)


# 1~5까지 수에서 열을 임의로
combn(1:5, 4)   # 조합(경우의 수)
combn(1:10, 10)

x<- c("red","green","blue","black","white")
com <- combn(x,4)
com

for (i in 1:ncol(com)) {
  cat(com[,i],'\n')
}
