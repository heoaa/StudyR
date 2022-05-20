### compact 자동차와 suv 자동차의 도시 연비(cty) t검정
## 데이터 준비
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>%                   # class, cty 컬럼만 가져옴
  filter(class %in% c('compact','suv'))    # class가 c, s 만 가져옴

unique(mpg_diff$class)
head(mpg_diff)

table(mpg_diff$class)


## t-test // var.equal = T 분산 동일하다는 가정
t.test(data = mpg_diff, cty~class, var.equal = T)


### 일반 휘발유와 고급 휘발유의 도시 연비 t검정
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c('r', 'p'))  # r:regular, p:premium

table(mpg_diff2$f1)

t.test(data = mpg_diff2, cty~fl, var.equal = T)
