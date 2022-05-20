install.packages("data.table")
library(data.table)
library(dplyr)
library(ggplot2)
install.packages("lubridate")
library(lubridate)
install.packages("stringr")
library(stringr)
install.packages("forecast")
library(forecast)
install.packages("randtests")
library(randtests)

## 데이터 로드
getwd()
load(file = './result_sales_dt.RData')

## 데이터 구조 탐색
str(result_sales_dt)
unique(result_sales_dt$yyyyqrt)

glimpse(result_sales_dt, width = 60)  


### 쿼터별 매매량 계산
qrt_cnts <- result_sales_dt[,.N,yyyyqrt]     # .N : 그룹에 해당하는 개수를 가져옴
str(qrt_cnts)
head(qrt_cnts)
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2',.N,yyyyqrt]
head(qrt_cnts)

### 분기별 아파트 매매건수
ggplot(qrt_cnts, aes(x=yyyyqrt, y=N, group=1)) +
  geom_line() + xlab("년도분기") + ylab("매매건수") +
  theme(axis.text.x = element_text(angle = 90)) +
  stat_smooth(method = 'lm')  # 선형/비선형 패턴 시각화

### 분기별/지역별 매매추이
region_cnts <- result_sales_dt[yyyyqrt != '2015Q2',.N,.(yyyyqrt,region)]
head(region_cnts)

ggplot(region_cnts, aes(yyyyqrt, N, group=region)) +
  geom_line() + 
  facet_wrap(~region, scale = 'free_y', ncol = 3) +
  theme(axis.text.x = element_blank()) +
  stat_smooth(method = 'lm')

### 시계열 랜덤성 검정
# 월별 지역별 매매량
region_cnts <- result_sales_dt[,.N,,.(yyyymm,region)]

# 대표 지역 추출
regions <- unique(region_cnts$region)

# 지역별 매매량 랜덤성 검정 결과
runs_p <- c()
for (reg in regions) {
  runs_p <- c(runs_p, runs.test(region_cnts[region %chin% reg,N])$p.value)
}

ggplot(data.table(regions, runs_p), aes(x=regions, y=runs_p, group=1)) +
  geom_line() + geom_point() +
  ylab('P-value') + xlab('지역')

### 시계열 분할(서울지역)
seoul_cnts <- result_sales_dt[yyyymm != '201504' & 
                                region %chin% '서울',.N,.(yyyymm)]
head(seoul_cnts)
tot_ts <- ts(seoul_cnts$N, start = c(2006,1),frequency = 12)
plot(stl(tot_ts,s.window = 'periodic'))

# (부산)
busan_cnts <- result_sales_dt[yyyymm != '201504' & 
                                region %chin% '부산',.N,.(yyyymm)]
head(busan_cnts)
tot_ts <- ts(busan_cnts$N, start = c(2006,1),frequency = 12)
plot(stl(tot_ts,s.window = 'periodic'))


###
arima_mdl <- auto.arima(tot_ts)
tsdiag(arima_mdl)

plot(forecast(arima_mdl, h=8)) # 예측모델 : h 만큼 예측
