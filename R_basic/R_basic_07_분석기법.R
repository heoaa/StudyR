### 상관분석
# 1. 실업자 수와 개인 소비 지출의 상관관계
# 1) 데이터 준비
economics <- as.data.frame(ggplot2::economics)

# 2) 상관분석
cor.test(economics$unemploy, economics$pce)

# 2. 상관행렬 히트맵
# 1) 데이터 준비
head(mtcars)

# 2) 상관행렬
car_cor <- cor(mtcars)   # 상관행렬 생성
round(car_cor, 2)        # 소수점 둘째자리까지(반올림 출력)

# 3) 상관행렬 히트맵
# install.packages("corrplot")
library(corrplot)

corrplot(car_cor)   # 상관행렬(원)
corrplot(car_cor, method = 'number')   # 상관행렬(상관계수)

# 파라미터
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_cor,
         method = "color", # 색깔로 표현
         col = col(200), # 색상 200 개 선정
         type = "lower", # 왼쪽 아래 행렬만 표시
         order = "hclust", # 유사한 상관계수끼리 군집화
         addCoef.col = "black", # 상관계수 색깔
         tl.col = "black", # 변수명 색깔
         tl.srt = 45, # 변수명 45 도 기울임
         diag = F) # 대각 행렬 제외

### t-test 예제
# 1. compact 자동차와 suv 자동차의 도시연비 t검정
# 1) 데이터 준비
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% select(class, cty) %>% 
            filter(class %in% c('compact','suv'))
head(mpg_diff)
table(mpg_diff$class)

# 2) t-test
t.test(data = mpg_diff, cty~class, var.equal = T)   # 분산 동일 가정 하에
