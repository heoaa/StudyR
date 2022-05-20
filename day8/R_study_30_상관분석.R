## 데이터 준비
economics <- as.data.frame(ggplot2::economics)

## 실업자 수와 개인 소비 지출의 상관관계
cor.test(economics$unemploy, economics$pce)

### 상관행렬
head(mtcars)

car_cor <- cor(mtcars)
round(car_cor, 2)

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
corrplot(car_cor, method = 'number')

# 파라미터
col <- colorRampPalette(
  c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor, method = 'color',
         col = col(200),
         type = 'lower',    # 왼쪽 아래 행렬만 표시
         order = 'hclust',  # 유사한 상관계수끼리 군집화
         addCoef.col = 'black',   # 상관계수 색깔
         tl.col = 'black',  # 변수명 색깔
         tl.srt = 45,       # 변수명 기울기 (45도)
         diag = F           # 대각행렬 제외
         )
