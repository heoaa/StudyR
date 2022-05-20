getwd()

install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
install.packages("lubridate")
library(lubridate)
install.packages('stringr')
library(stringr)
install.packages('forecast')
library(forecast)
install.packages('randtests')
library(randtests)

load(file='./result_sales_dt.RData')

str(result_sales_dt)
unique(result_sales_dt$yyyyqrt)

glimpse(result_sales_dt, width=60)

# 쿼터별 매매량 계산
qrt_cnts <- result_sales_dt[,.N,yyyyqrt]
str(qrt_cnts)
head(qrt_cnts)
tail(qrt_cnts)
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2',
                            .N,yyyyqrt]
head(qrt_cnts)
tail(qrt_cnts)

ggplot(qrt_cnts , aes(x=yyyyqrt, y=N,group=1)) +
  geom_line() + xlab("년도분기") + ylab("매매건수") +
  theme(axis.text.x=element_text(angle=90)) + 
  stat_smooth(method='lm') 

# 쿼터별/지역별 매매량 계산

region_cnts <- result_sales_dt[yyyyqrt != '2015Q2',
                               .N,.(yyyyqrt, region)]
head(region_cnts)

ggplot(region_cnts, aes(x=yyyyqrt, y=N, group=region)) +
  geom_line() + facet_wrap(~region,scale='free_y',ncol=3)+
  theme(axis.text.x = element_blank())+ 
  stat_smooth(method='lm')

# 월별 지역별 매매량
region_cnts <- result_sales_dt[,.N,.(yyyymm,region)]
head(region_cnts)
  
regions <- unique(region_cnts$region)
regions  
# 각 지역별로 매매량의 랜덤성 검정 결과를 runs_p 변수에 추가
runs_p <- c()
for(reg in regions){
  runs_p <- c(runs_p, runs.test(region_cnts[region %chin% reg, N])$p.value)
}

runs_p
ggplot(data.table(regions, runs_p), 
       aes(x=regions, y=runs_p, group=1)) +
  geom_line() + geom_point() + ylab('P-value') + xlab('지역')

# 부산 지역 패턴 분석
busan_cnts <- result_sales_dt[yyyymm != '201504' & 
                                region %in% '부산',
                              .N, .(yyyymm)]
head(busan_cnts)

tot_ts <- ts(busan_cnts$N, start=c(2006,1), frequency = 12)

plot(stl(tot_ts, s.window='periodic'))

arima_mdl <- auto.arima(tot_ts)
tsdiag(arima_mdl)

plot(forecast(arima_mdl,h=12))

