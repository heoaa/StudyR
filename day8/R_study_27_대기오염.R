### 대기오염 측정 데이터(2015~2019)
getwd()
setwd('./day8')
getwd()


## 데이터 준비
files <- c('ds.2015.csv','ds.2016.csv','ds.2017.csv',
           'ds.2018.csv','ds.2019.csv')

ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header = T)  # files의 파일명을 차례로 read
  ds <- rbind(ds, tmp)            # 차례로 불러와 rbind
  print(f)
}

View(ds)

str(ds)


# 111123 : 서울시 종로구, 632132 : 강릉 옥천동, 336111 : 목포시 용당동
unique(ds$loc)
range(ds$mdate)

## 열별 결측값 확인
for (i in 3:8) {
  cat(names(ds)[i], 
      sum(is.na(ds[,i])),
      sum(is.na(ds[,i]))/nrow(ds), 
      '\n')
}
ds <- ds[,-8]    # PM25 열 제거
ds <- ds[complete.cases(ds),] # 결측값 포함 행 제거
str(ds)


## 그룹 정보 추가
# substr 사용을 위해 문자열로 변환 
mdate <- as.character(ds$mdate)
head(mdate)

ds$year <- as.numeric(substr(mdate,1,4)) # 연도 추출
ds$month <- as.numeric(substr(mdate,5,6)) # 월 추출
ds$hour <- as.numeric(substr(mdate,9,10)) # 시간 추출

# 코드 정보 열 추가
unique(ds$loc)
ds$locname <- NA 
ds$locname[ds$loc==111123] <- '서울'
ds$locname[ds$loc==336111] <- '목포'
ds$locname[ds$loc==632132] <- '강릉'

head(ds)


## 지역별 PM10 농도 분포
boxplot(PM10~locname, data = ds, main = '미세먼지 농도 분포')
boxplot(PM10~locname, data = ds, main = '미세먼지 농도 분포',
        ylim = c(1,100))


## 연도별, 지역별 PM10 농도 추이
library(ggplot2)

tmp.year <- aggregate(ds[,7],
                      by=list(year=ds$year, loc=ds$locname),
                      FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=5, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

## 월별, 지역별 PM10 농도 추이
tmp.month <- aggregate(ds[,7],
                      by=list(month=ds$month, loc=ds$locname),
                      FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')

## 시간대별, 지역별 PM10 농도 추이
tmp.hour <- aggregate(ds[,7],
                       by=list(hour=ds$hour, loc=ds$locname),
                       FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')


# 오염물질 농도 간의 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7],
     lower.panel=NULL)
cor(ds[,3:7])


# 미세먼지 최고점과 최저점 확인
tmp.yml <- aggregate(ds[,7],
                      by=list(year=ds$year, 
                              month=ds$month,
                              loc=ds$locname),
                      FUN='mean')

idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]