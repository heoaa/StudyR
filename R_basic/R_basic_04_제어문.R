## if
job.type <- 'A'

if (job.type == 'B') {
  bonus <- 200
} else {
  bonus <- 100
}

print(bonus)

# else문 생략한 if문
a <- 10; b <- 20
if (a>5) & (b>5){
  print(a+b) }

a <- 10; b <- 20
if (a>b) {
  c <- a
} else {
  c <- b
}


## for
for (i in 1:5) {
  print(i)
}

for (i in 1:5) {
  cat(i, '')
  cat('\n')
}

# 2단
for (y in 1:9) {
  cat('2 x',y, '=', 2*y, '\n')
}

# 구구단
for (x in 2:9) {
  for (y in 1:9) {
    cat(x, 'x', y, '=', x*y, '\n')
  }
  cat('\n')
}

# 짝수
for (i in 1:20) {
  if (i %% 2 == 0) {
    cat(i, '')
  }
}

## iris 꽃잎 크기 분류
norow <- nrow(iris)
mylabel <- c()
for (i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel, iris$Species)
newds

write.csv(newds, './day4/iris_petal.csv', row.names = F)
head(newds)


## while
sum <- 0 
i <- 1
while (i <= 100) {
  sum <- sum + i
  i <- i + 1
}
print(sum)


# 내장함수 apply()
iris
apply(iris[ ,1:4]), 2, mean)


## 사용자 정의 함수
'함수명 <- function(매개변수 목록) {
    실행할 명령문
    return(함수 실행결과)
}'

mymax <- function(x, y) {
  num.max <- x
  if (y>x) {
    num.max <- y
  }
  return(num.max)
}

mymax(10, 15)

#
mydiv <- function(x, y=2) {
  result <- x/y
  return(result)
}
mydiv(x=10,y=3)
mydiv(10,3)
mydiv(10)

#
myfunc <- function(x, y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}

result <- myfunc(5,8)
s <- result$sum
m <- result$mul

cat('5+8 =', s, '\n')
cat('5*8 =', m, '\n')