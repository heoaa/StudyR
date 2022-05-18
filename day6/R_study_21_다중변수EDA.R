## 다중변수 데이터(상관관계)
# 데이터 확인
head(cars)

# 산점도
plot(cars$speed, cars$dist, main = '자동차 속도와 제동거리',
     xlab = '속도', ylab = '제동거리', las = 1)

# 상관계수(속도와 제동거리의 상관관계)
cor(cars$speed, cars$dist)


View(state.x77)
class(state.x77)
st <- data.frame(state.x77)
class(st)

plot(st)

cor(st)
cor(st$Life.Exp, st$Murder)    # -0.78
cor(st$Illiteracy, st$Murder)  # 

cor(st$Income, st$Area)   # 의미x
cor(st$Area, st$Frost)


## LAB 경제지표 데이터 분석
str(longley)
head(longley)

df <- longley[,c('GNP','Unemployed','Armed.Forces',
                 "Population", 'Employed')]
df
plot(df)
cor(df)


# RData로 데이터셋 불러오기
getwd()
load('./result_sales_dt.RData')
# RData 저장, 새로운 파일로 저장
save(result_sales_dt, file = './result_dt.RData')


## 실전분석. 주택담보대출 데이터 탐색 10_52p
install.packages("Ecdat")
library(Ecdat)
str(Hdma)

# 대출 승인(no)/거절(yes) 비율
tbl <- table(Hdma$deny)
tbl

tbl2 <- tbl/sum(tbl)
tbl2

names(tbl) <- c('승인','거절')
names(tbl2) <- c('승인','거절')

barplot(tbl2, main = '주택담보대출 승인/거절 비율', col = c('green','red'),
        ylim = c(0.0,1.0), las = 1, ylab = '비율')

barplot(tbl, main = '주택담보대출 승인/거절 건수', col = c('green','red'),
        ylim = c(0,2500), las = 1, ylab = '빈도')

# 주택가격대비 대출금 비율(lvr)
hist(Hdma$lvr, main = 'LTV',col = rainbow(10), ylim = c(0,1200))


# 수입대비 보증금 비율(dir), 수입대비 주택유지비용 비율(hir)
# 고객 신용등급(ccs), 대출 신용등급(mcs), 대출거절여부(deny)

df <- Hdma[,c('dir','hir','ccs','mcs')]
cor(df)

point.col <- c('green','red')
plot(df, col = point.col[Hdma$deny])



