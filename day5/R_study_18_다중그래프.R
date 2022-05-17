## 다중그래프
par(mfrow=c(2,2), mar=c(3,3,4,2))  # 화면분할(2x2)
par(mfrow=c(2,2))

# 그래프 1 (히스토그램은 벡터형식 )
hist(iris$Sepal.Length, main = '붓꽃 꽃받침 길이', col = 'orange')

# 그래프 2 (막대그래프는 테이블형식)
head(mtcars)
barplot(table(mtcars$cyl), main = '자동차 실린더', 
        col = c('red', 'green', 'blue'))

# 그래프 3
barplot(table(mtcars$gear), main = '자동차 기어수',
        col = rainbow(3), horiz = T)

# 그래프 4
pie(table(mtcars$cyl), main = '자동차 실린더', 
    col = topo.colors(3),   # topo팔레트
    radius = 1.05)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 분할 취소
par(mfrow=c(1,1))


## LAB 정책 지지도  p08_67
install.packages("carData")
library(carData)

head(Chile)
ds <- Chile

colors <- rainbow(20)
colors

# 그래프
par(mfrow = c(2,3), mar=c(3,3,4,2))

table(ds$region)    # table : 레벨별 빈도수, 행 자동 취합
barplot(table(ds$region), main = '지역별 분포', col = colors[1:5])

barplot(table(ds$sex), main = '성별 분포', col = colors[6:7])

table(ds$education)
barplot(table(ds$education), main = '교육수준별 분포',
        col = colors[8:10])

hist(ds$age, main = '연령', xlab = 'age', 
     col = colors[10:15], breaks = 6)

hist(ds$income, main = '수입', xlab = 'income', 
     col = colors[15:18], breaks = 4)

hist(ds$statusquo, main = '정책 지지도', xlab = 'support',
     col = colors[11:19])


## 실전분석. 종업원 팁 정보 p08_70
library(reshape2)
str(tips)

# 그래프
par(mfrow = c(2,2))
barplot(table(tips$sex), main = '성별')
barplot(table(tips$day), main = '요일')
barplot(table(tips$time), main = '식사 시간대')
barplot(table(tips$size), main = '일행 규모')
par(mfrow = c(1,1))

# 빈도가 많은 막대에 색 넣기
color.6 <- rep('#a8dadc', 6) # 일행규모(6개 막대)
color.6[2] <- '#1d3557'  # 2번째 막대가 가장 많음

color.4 <- rep('#a8dadc', 4) # 요일(4개 막대)
color.4[2] <- '#1d3557' # 2번째 막대가 가장 많음
color.4[3] <- '#457b9d'

color.2 <- c('#a8dadc', '#1d3557')

# 컬러그래프
par(mfrow = c(2,2))
barplot(table(tips$sex), main = '성별',
        col = color.2)
barplot(table(tips$day), main = '요일',
        col = color.4)
barplot(table(tips$time), main = '식사 시간대',
        col = c(color.2[2], color.2[1]))
barplot(table(tips$size), main = '일행 규모',
        col = color.6)

## 1인당 주문 금액과 팁 관계
tips.new <- tips
tips.new$perHead <- tips.new$total_bil / tips.new$size

color.5 <- rep('#a8dadc', 5)
color.5[2] <- '#1d3557'

lunch.perHead <- tips.new[tips.new$time == 'Lunch', 'perHead']
Dinner.perHead <- tips.new[tips.new$time == 'Dinner', 'perHead']

par(mfrow=c(1,3), mar=c(5,5,4,2)+.1)
hist(tips.new$perHead, main = '1인당 주문 금액', las = 1,
     breaks = 5, xlab = '(단위: $)', ylab = '빈도수',
     col = color.5)
hist(lunch.perHead, main = '1인당 주문 금액(런치)', las = 1,
     breaks = 4, xlab = '(단위: $)', ylab = '빈도수',
     col = color.5)
hist(Dinner.perHead, main = '1인당 주문 금액(디너)', las = 1,
     breaks = 4, xlab = '(단위: $)', ylab = '빈도수',
     col = color.5)
par(mfrow=c(1,1))

## 주문 금액 대비 받은 팁 비율 차이
tips.new$percent <- (tips.new$tip / tips.new$total_bill)*100

lunch.percent <- tips.new[tips.new$time == 'Lunch', 'percent']
Dinner.percent <- tips.new[tips.new$time == 'Dinner', 'percent']

par(mfrow=c(1,2))
res.lunch <- hist(lunch.percent, main = '주문액 대비 팁 비율(런치)',
                  xlab = '(단위: %)', breaks = 5)
res.Dinner <- hist(Dinner.percent, main = '주문액 대비 팁 비율(디너)',
                  xlab = '(단위: %)', breaks = 6)
par(mfrow=c(1,1))


#
res.lunch$counts
res.Dinner$counts

res <- rbind(lunch = c(0, res.lunch$counts),  # 6개 열로 맞추기 위한 0 추가
             dinner = c(res.Dinner$counts[1:6]))
res

colnames(res) <- res.Dinner$breaks[2:7]
res

barplot(res, main = '식사 시간에 따른 팁 비율 분포',
        col = color.2, legend.text = c('Lunch', 'Dinner'),
        las = 1)


