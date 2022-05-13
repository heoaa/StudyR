## 기본그래프
# bar chart (막대그래프)
favorite.season<- c('WINTER','SUMMER','SPRING','SUMMER', 'SUMMER','FALL',
                    'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite.season
ds <- table(favorite.season)  # 도수분포
ds

# 컬러표 
colors()

# 컬러
barplot(ds, main = '좋아하는 계절')
barplot(ds, main = '좋아하는 계절', col = 'orange')
barplot(ds, main = '좋아하는 계절', col = '#FF0000')
barplot(ds, main = '좋아하는 계절', 
        col = c('steelblue1', 'steelblue2', 'steelblue3', 'steelblue4'))
barplot(ds, main = '좋아하는 계절', col = rainbow(4))

# 레이블 추가
barplot(ds, main = '좋아하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수')

# 축 위치 변경
barplot(ds, main = '좋아하는 계절', col = rainbow(4), horiz = T)

# x축 이름 지정(names), 축 이름 수직 변경(las)
barplot(ds, main = '좋아하는 계절', col = rainbow(4), horiz = T,
        names = c('가을','봄','여름','겨울'), las = 1)

# 

