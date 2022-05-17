## 데이터 탐색
## 단일범주 데이터

library(carData)

head(TitanicSurvival)
str(TitanicSurvival)
tData <- Titanic
tData2 <- TitanicSurvival

room.class <- TitanicSurvival$passengerClass  # 선실 정보
tbl <- table(room.class)
tbl
sum(tbl)  # 전체 탐승객수

par(mfrow=c(1,1), mar=c(5,4,5,1))
barplot(tbl, main = '선실별 탐승객', xlab = '선실 등급',
        ylab = '탑승객 수', col = c('blue', 'green',' yellow'),
        names = c('1등실','2등실','3등실'))

tbl/sum(tbl)

library(plotrix)
pie3D(tbl, main = '선실별 탑승객 비율', radius = 1.5,
      labels = c('1등실','2등실','3등실'), labelcol = 'white',
      labelcex = 1,explode = 0.1,
      col = c('blue','green','yellow'))

# 생사여부, 성별 모두 위와 동일하게 적용 가능


## 단일변수 수치형
str(state.x77)
grads <- state.x77[,'HS Grad']
str(grads)
summary(grads)
var(grads)
sd(grads)

hist(grads, main = '주별 졸업률', col = 'orange',
     xlab = '졸업률', ylab = '주의 개수')

boxplot(grads, main = '주별 졸업률', col = 'orange')

# 졸업률이 가장 낮은 주
idx <- which(grads == min(grads))
grads[idx]

# 졸업률이 가장 높은 주
idx <- which(grads == max(grads))
grads[idx]

# 졸업률이 평균 이하인 주
idx <- which(grads <= mean(grads))
grads[idx]


## 영국 폐질환 사망자 분석  10_25p
getwd()
ds <- read.csv('./day5/fdeaths.csv', header = T,
               row.names = 'year')
ds

my.col <- c('orange','blue','red','green','purple','darkgray')
my.lty <- 1:6
plot(1:12, ds[1,],   # 1974년 데이터
     main = '월별 사망자 추이', type = 'b', 
     lty = my.lty[1],  # 라인 종류
     lwd = 2,          # 라인 두께
     xlab = '월별', ylab = '사망자 수', 
     ylim = c(300,1200),
     las = 1, col = my.col[1])


# for  반복문문
for (i in 2:6) {
  lines(1:12,
        ds[i,],
        type = 'b',
        lty = my.lty[i], lwd = 2,
        col = my.col[i])
}

legend(x='topright', legend = rownames(ds),
       lty = my.lty, lwd = 2,
       col = my.col)


## LAB 미국 자동차 판매 가격 및 성능 데이터
library(DAAG)
str(carprice)
View(carprice)

carprice$Price
summary(carprice$Price)

hist(carprice$Price, main = '자동차 가격', 
     xlab = '가격대(1,000$)', ylab = '빈도', 
     col = 'green')

tbl <- table(carprice$Type)
barplot(tbl, main = '자동차 타입별 빈도수',
        xlab = '타입', ylab = '빈도',
        col = rainbow(length(tbl)))

# 가격이 가장 비싼 자동차 타입
idx <- which(carprice$Price == max(carprice$Price))
carprice[idx, c("Type", "Price")]


## 다중변수 데이터 분석 - 상관관계
head(pressure)
str(pressure)

plot(pressure$temperature, pressure$pressure,
     main = '온도와 기압',
     xlab = '온도(섭씨)', ylab = '기압')



