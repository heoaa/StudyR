### 포브스 기업 리포트 데이터 분석
install.packages("HSAUR")
library(HSAUR)
data("Forbes2000")
ds <- Forbes2000
ds[!complete.cases(ds),] # 결측값 확인

str(ds)
head(ds)


## country : 기업 소속 국가
table(ds$country)
tmp <- sort(table(ds$country), decreasing = T) # 내림차순 정렬
top.10.contry <- tmp[1:10]
top.10.contry

par(mar=c(8,4,4,2))
barplot(top.10.contry, main = '기업수 상위 10개국',
        col = rainbow(10), las=1)
par(mar=c(5,4,4,2))


## category : 업종 구분
table(ds$category)
tmp <- sort(table(ds$category), decreasing = T) # 내림차순 정렬
top.10.category <- tmp[1:10]
top.10.category

par(mar=c(8,4,4,2))
barplot(top.10.category, main = '기업수 상위 10개 업종',
        col = 'pink', las=1)
par(mar=c(5,4,4,2))


## 업종별 기업자산 분포
# assets : 자산 금액(단위: 10억 달러)
tmp <- ds[ds$category %in% names(top.10.category),]
tmp
levels(tmp$category)
# 10개 업종의 그룹 정보로 재설정(덮어쓰기)
# 팩터는 값들이 바뀌어도 그룹 정보는 유지함
tmp$category <- factor(tmp$category)  
levels(tmp$category)

par(mar=c(10,4,4,2))
boxplot(assets~category, data = tmp,
        ylim = c(0,100), xlab = ' ', las=1)
par(mar=c(5,4,4,2))


## 기업가치 상위 10대 기업
# marketvalue : 기업 가치(단위: 10억 달러)
tmp <- ds[order(ds$marketvalue, decreasing = T),]
tmp[1:10, c('name','country','category','marketvalue')]

# 한국 기업 정보
korea <- subset(ds, country =='South Korea')
korea[,c('rank','name','category','marketvalue')]


## 기업 가치와 타변수 상관관계
tmp <- ds[,5:8]     # sales, profits, assets, marketvalue
tmp <- tmp[complete.cases(tmp),]
plot(tmp, lower.panel=NULL)
cor(tmp)