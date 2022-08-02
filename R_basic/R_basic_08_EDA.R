### 예제
## 1. 포브스 기업 리포트 데이터 분석
# 1) 데이터 준비
# install.packages("HSAUR")
library(HSAUR)
data("Forbes2000")
ds <- Forbes2000
ds[!complete.cases(ds),]   # 결측값 확인

# 2) 데이터 확인
# 자료는 총 2,000행, 8열로 구성
# name은 문자열 자료
# Country와 categor는 팩터 타입의 범주형 자료
# 나머지는 수치형 자료
str(ds)
head(ds)

# rank : 기업 순위, name : 기업 이름, country : 기업 소속 국가 , 
# category : 업종 구분, sales : 매출액(단위: 10억 달러), 
# profits : 순익(단위: 10억 달러), assets : 자산 금액(단위: 10억 달러) , 
# marketvalue : 기업 가치(단위: 10억 달러) 

# 3) 국가별 기업 통계
table(ds$country)
tmp <- sort(table(ds$country), decreasing = T)  # 내림차순
top.10.country <- tmp[1:10]
top.10.country  # 상위 10개국

par(mar=c(8,4,4,2))
barplot(top.10.country, main = '기업수 상위 10개국',
        col = rainbow(10), las = 1)
par(mar=c(5,4,4,2))

# 4) 업종별 기업 분포
table(ds$category)
tmp <- sort(table(ds$category), decreasing = T)  # 내림차순
top.10.category <- tmp[1:10]
top.10.category  # 상위 10개국

par(mar=c(10,4,4,2))
barplot(top.10.category, main = '기업수 상위 10개국',
        col = pink, las = 1)
par(mar=c(5,4,4,2))

# 5) 업종별 기업자산 분포
tmp <- ds[ds$category %in% names(top.10.category),]
levels(tmp$category)
tmp$category <- factor(tmp$category)
levels(tmp$category)

par(mar=c(10,4,4,2))
boxplot(assets~category, data = tmp,
        ylim = c(0,100), xlab = ' ', las = 1)
par(mar=c(5,4,4,2))

# 6) 기업 가치 상위 10대 기업
tmp <- ds[order(ds$marketvalue, decreasing = T),]
tmp[1:10, c('name','country','category','marketvalue')]

# 7) 한국 기업 정보
korea <- subset(ds, country == 'South Korea')
korea[, c('rank','name','category','marketvalue')]

# 8) 기업 가치와 타변수와의 상관관계
tmp <- ds[, 5:8]
tmp <- tmp[complete.cases(tmp),]  # 결측값 제거
plot(tmp, lower.panel = NULL)
cor(tmp)


## 2. 대기오염 측정 데이터 분석
# 1) 데이터 준비



# loc : 측정소 코드(111123 : 서울시 종로구, 632132 : 강롱 옥천동, 336111 : 목포시 용당동), 
# mdate : 측정 일시(매일 1시간 단위 측정), SO2 : 아황산가스, CO : 일산화탄소, 
# O3 : 오존, NO2 : 이산화질소, PM10 : 미세먼지, PM25 : 초미세먼지