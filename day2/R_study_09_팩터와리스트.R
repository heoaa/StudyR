## 팩터와 리스트
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt

# 유사집합: 중복제거 후 레벨출력
bt.new <- factor(bt)
bt.new
bt[5]

# 기존 bt 변수의 인덱스 위치값 출력 + 레벨출력
bt.new[5]
bt.new[2]

levels(bt.new)[2]

as.integer(bt.new) # 팩터의 문자값을 숫자로 바꾸어 출력

bt.new[7] <- 'B'
bt.new[8] <- 'C'  # NA 할당
bt.new


## 리스트
h.list <- c('balling', 'tennis', 'ski')
person <- list(name='Tom', age=25, student=T, hobby=h.list)
person

person[1]
person[[1]]
person[['name']]
person$name
person$student
person$hobby
person[[4]][2]


## R 카페 매출분석 2 ------------------------
cafe <- list(espresso = c(4,5,3,6,5,4,7),
        americano = c(63,68,64,68,72,89,94),
        latte = c(61,70,59,71,71,92,88),
        price = c(2000, 2500, 3000),
        menu = c('esp', 'ame', 'lat'))

cafe$menu <- factor(cafe$menu)
cafe$menu

names(cafe$price) <- cafe$menu


sale.espresso <- cafe$price['esp'] * cafe$espresso
sale.espresso
sale.americano <- cafe$price['ame'] * cafe$americano
sale.latte <- cafe$price['lat'] * cafe$latte

sale.day <- sale.espresso + sale.americano + sale.latte
sale.day
names(sale.day) <- c('Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun')
sum(sale.day)


## 감전사고 --------------------------

dis <- c(31,26,42,47,50,54,70,66,43,32,32,22)
names(dis) <- paste('M',1:12, sep='')
dis

# 1년간 총 사고건수
sum(dis)

# 가장 사고가 많은 달과 가장 적은 달
max(dis)
min(dis)
mean(dis)  # 일년 사고건수 평균

# 사고율이 10% 감소하는 경우 사고건수
dis_m <- dis*0.9
dis_m

# 사고 건수가 50건 이상인 달 
dis[dis>=50]

# 사고건수가 50건 이상인 달의 이름
names(dis[dis>=50])

# 사고건수가 50건 미만인 달은 몇개월인지
length(names(dis[dis<50]))

# 6월보다 사고가 많은 달과 건수
dis[dis>dis['M6']]

# 평균이상 사고건수 발생 달
dis[dis>=mean(dis)]


