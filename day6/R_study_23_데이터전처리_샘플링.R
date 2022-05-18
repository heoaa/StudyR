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

## LAB 편두통 치료 데이터 분석
# 샘플링 치료일수(dos) 평균과 전체 치료일수 평균 차이
library(carData)
str(KosteckiDillon)

tot.mean <- mean(KosteckiDillon$dos)  # 전체 치료일수 평균
tot.mean

for (rate in (1:5)*0.1) {
  set.seed(100)
  idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rate)
  sam.data <- KosteckiDillon[idx, 'dos']
  tmp.mean <- mean(sam.data)     # 샘플링 치료일수 평균
  cat('비교: ', rate*100, '% 샘플링', tot.mean-tmp.mean, '\n')
}


## 데이터 집계
# 품종별 평균
agg <- aggregate(iris[,-5], by = list(품종=iris$Species), FUN = mean)
agg

summary(iris)


## LAB 전국 선거 통계
str(CES11)

table(CES11$abortion)
table(CES11$abortion)/nrow(CES11)

agg <- aggregate(CES11[,'abortion'], by=list(성별=CES11$gender),
                 FUN = table)
colnames(agg[,2]) <- c('낙태찬성','낙태반대')

agg.2 <- agg[,2]
agg.2[1,] <- agg.2[1,]/sum(agg.2[1,])
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,])

rownames(agg.2) <- agg[,1]
agg.2

head(agg)


## 칠레 대통령 선거 여론조사
library(carData)
help("Chile")
str(Chile)

sum(is.na(Chile))  # NA 개수 확인인
ch <- Chile[complete.cases(Chile),]    # NA 제거
ch

set.seed(100)
idx <- sample(nrow(ch),nrow(ch)*0.6)   # 60% 샘플링
ch60 <- ch[idx,]
dim(ch60)

agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region), sum)
agg[order(agg$x, decreasing=T),]

table(ch60$vote)

no.people <- table(ch60$sex)
tmp <- subset(ch60, vote =='Y')
str(tmp)
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex),length)
yes.ratio <- agg$x/no.people
yes.ratio


no.region <- table(ch60$region)
tmp <- subset(ch60, vote =='Y')
str(tmp)
agg <- aggregate(tmp[,'vote'], by=list(지역=tmp$region),length)
yes.ratio <- agg$x/no.region
yes.ratio




