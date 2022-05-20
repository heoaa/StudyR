setwd('C:/STUDY/R/data')
setwd('C:/STUDY/R/data')
getwd()

files <- c('ds.2015.csv','ds.2016.csv','ds.2017.csv',
           'ds.2018.csv','ds.2019.csv')

ds <- NULL
for (f in files){
  tmp <- read.csv(f, header=T)
  ds <-rbind(ds, tmp)
  print(f)
}

str(ds)
unique(ds$mdate)
tail(ds$mdate)
range(ds$mdate)

for (i in 3:8){
  cat(names(ds)[i],
      sum(is.na(ds[,i])),
      sum(is.na(ds[,i]))/nrow(ds),
      '\n')
}

ds <- ds[,-8]
ds <- ds[complete.cases(ds),]
str(ds)

# ds의 mdate를 문자열로 변환해서 mdate에 선언
mdate <- as.character(ds$mdate)
# substr을 사용하여 mdate를 연도, 월, 시간으로 나눠주기
ds$year <- as.numeric(substr(mdate, 1,4))
ds$month <- as.numeric(substr(mdate, 5,6))
ds$hour <- as.numeric(substr(mdate, 9,10))

head(ds)

# loc의 코드 확인
unique(ds$loc)
# locname 열 추가
ds$locname <- NA

#loc에서 코드에 맞게끔 locname을 한글로 저장
ds$locname[ds$loc == 111123] <- '서울'
ds$locname[ds$loc == 336111] <- '목포'
ds$locname[ds$loc == 632132] <- '강릉'

head(ds)
unique(ds$locname)

boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포',
       ylim=c(1,100))

library(ggplot2)
# 연도별
tmp.year <- aggregate(ds[,7],
                      by=list(year=ds$year, loc=ds$locname),
                      FUN='mean')
head(tmp.year)
tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 월별
tmp.month <- aggregate(ds[,7],
                      by=list(month=ds$month, loc=ds$locname),
                      FUN='mean')

tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 시간대별
tmp.hour <- aggregate(ds[,7],
                       by=list(hour=ds$hour, loc=ds$locname),
                       FUN='mean')

tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])

tmp.yml <- aggregate(ds[,7],
                     by=list(year=ds$year, month=ds$month,
                             loc=ds$locname), FUN='mean')
head(tmp.yml)

idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]
