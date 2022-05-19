## 나무지도(treemap)
install.packages("treemap")
library(treemap)

data(GNI2014)
str(GNI2014)
GNI2014$country

treemap(GNI2014,
        index = c('continent','iso3'),    # 계층 구조 설정(대륙, 국가)
        vSize = 'population',   # 타일 크기
        title = "대륙간 인구수",
        type = 'value',    # 타일 컬러링 방법
        vColor = 'GNI',    # 타일 컬러
        na.rm = T)    # 선택사항


## 미국 주요 도시 통계
library(carData)

head(Ericksen)

# 타일의 면적은 빈곤율(poverty), 
# 타일 색은 범죄건수(crime)
ds <- subset(Ericksen, city =='state')
ds

ds$stname <- rownames(ds)

treemap(ds, index = c('stname'), vSize = 'poverty',
        type = 'value', vColor = 'crime')



## radarchart
install.packages('fmsb')
library(fmsb)

score <- c(80,60,95,85,40,55)
max.score <- rep(100, 6)
min.score <- rep(0, 6)
ds <- rbind(max.score, min.score, score)
ds

class(ds)
ds <- data.frame(ds)
class(ds)

colnames(ds) <- c('국어','영어','수학','물리','음악','체육')
ds

radarchart(ds)

# 매개변수 옵션
## R 에서는 RGB(RR,GG,BB,AA)  #337F7F7F
radarchart(ds, pcol = 'darkgreen',   # 다각형 선 색
           pfcol = rgb(0.2,0.5,0.5,0.3),  # 다각형 내부 색 : (r,g,b,a) 값에서 a는 투명도
           plwd = 2,    # 다각형 선 두께
           cglcol = 'darkgreen',  # 거미줄 색
           cglty = 2,    # 거미줄 타입
           cglwd = 0.8,  # 거미줄 두께
           axistype = 0, # 축의 레이블 타입 (표시x : 0)
           seg = 4,      # 축의 눈금 분할
           axislabcol = 'grey',         # 축의 레이블 색
           caxislabels = seq(1,100,25)  # 축의 레이블 값
           )


## LAB 종교 조사 데이터 12_40p
library(carData)
head(WVS)

# 국가별 종교 유무 응답자 비율
pop <- table(WVS$country)
tmp <- subset(WVS, religion =='yes')
length(tmp$religion)
rel <- table(tmp$country)
rel

stat <- rel/pop
stat

max.score <- rep(1,4)
min.score <- rep(0,4)
ds <- rbind(max.score, min.score, stat)
ds <- data.frame(ds)
ds

radarchart(ds,
           pcol = 'red', pfcol = '#7F33337F',plwd = 2,
           axistype = 1,)



## ggplot2
library(ggplot2)

month <- c(1,2,3,4,5,6) 
rain <- c(55,50,45,50,60,70)
df <- data.frame(month, rain)

ggplot(df, aes(x=month, y=rain)) +
  geom_bar(stat = 'identity', width = 0.7,
           fill = 'skyblue')


# 막대그래프 가로
ggplot(df, aes(x=month, y=rain)) +
  geom_bar(stat = 'identity', width = 0.7,
           fill = 'skyblue') + 
  ggtitle('월별 강수량(1~6월)') +
  labs(x='월', y='강수량') +
  theme(plot.title = 
          element_text(size = 25, face = 'italic',
                       color = 'darkblue',
                       hjust = 0.5)) +   # 중간정렬
  coord_flip()   # 가로 방향 그래프 출력


# 히스토그램

ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram(binwidth = 0.5,
                 position = 'dodge') +
  theme(legend.position = 'top')


ggplot(iris, aes(x=Sepal.Width, fill = Species,
                 color = Species)) + 
  geom_histogram() +
  ggtitle('붓꽃 품종별 받침 길이') + 
  theme(legend.position = 'bottom')



# 산점도
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color = Species)) +
  geom_point(size=3) +
  ggtitle('꽃잎의 길이와 폭') +
  theme(plot.title = element_text(size = 25, face = 'bold',
                                  colour = 'steelblue'))



# 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)

df <- data.frame(year, cnt)
head(df)

ggplot(data = df, aes(x=year, y=cnt))+
  geom_line(col = 'red')



# LAB 기후 변화 그래프
# 오존(Ozone), 일조량(Solar.R), 풍속(Wind), 
# 기온(Temp), 월(Month), 일(Day)

df <- aggregate(airquality[,'Temp'],
                by=list(month=airquality$Month),
                FUN=mean)
class(df)
df
colnames(df) <- c('month','temp')
df
ggplot(data=df, aes(x=month, y=temp))+
  geom_bar(stat = 'identity', widhi=0.9,
            fill = 'darkgreen') + 
  ggtitle('5개월 평균기온(화씨)')

# 산점도
df <-airquality[complete.cases(airquality),]
str(df)
ggplot(data=df, aes(x=Temp, y=Ozone, color = 'orange'))+
  geom_point(size=2)
cor(df$Temp, df$Ozone)


# 선그래프
df.7 <- subset(df, Month == 7)
ggplot(data = df.7,aes(x=Day,y=Ozone))+
  geom_line(col = 'red', linetype='dashed')
  

## 실전분석

df <- UN98[,c('region','tfr')]
df <- df[complete.cases(df),]
df <- aggregate(df[,'tfr'], by=list(region=df$region), FUN=mean)

ggplot(data=df, aes(x=region, y=x)) +
  geom_bar(stat = 'identity', width = 0.7,
           col = '#333333',     # 테두리 컬러
           fill=rainbow(5)) +   # 막대 컬러
  ggtitle('대륙별 평균 여성출산률') +
  labs(x='대륙', y='평균출산률')


# treemap
df.tm <- UN98[,c('region','lifeFemale','illiteracyFemale')]
df.tm
df.tm <- df.tm[complete.cases(df.tm),]
df.tm$country <- rownames(df.tm)

treemap(df.tm, index = c('region','country'), 
        vSize = 'lifeFemale',vColor = 'illiteracyFemale',
        type = 'value')



df.edu <- UN98[,c('region','educationMale', 'educationFemale')]
df.edu <- df.edu[complete.cases(df.edu),]

ggplot(data=df.edu, aes(x=educationMale, y=educationFemale, 
                        col = region),) +
  geom_point(size=2) +
  theme(plot.title = element_text(size = 16, face = 'italic',
                     color = 'darkblue', hjust = 0.5))

cor(df.edu$educationMale,df.edu$educationFemale)

       