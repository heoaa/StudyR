## 웹크롤링
# 1. 패키지 설치
install.packages("rvest")
library(rvest)
library(stringr)


# 2. 보배드림 URL 검색 > URL 가져오기기

url <- "https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=I&page=1&order=S11&view_size=70"

usedCar <- read_html(url)
usedCar


# 3. HTML, mode-ce1l.title 안에 차이름 확인
carInfos <- html_nodes(usedCar, css='.mode-cell.title')
carInfos


# 4. tit.ellipsis 안에 있는 나머지 요소 제거
carTitles <- carInfos %>% html_node('.tit.ellipsis') %>% html_text()
carTitles


# 5. 불필요한 요소 제거
carTitles <- gsub('  ','',carTitles)
carTitles
carTitles <- gsub('\r\n\t', '', carTitles)
carTitles


# 6. 연식 가져오기
carYear <- html_nodes(usedCar, css='.mode-cell.year')
carYear

# 7. css text 정보 가져오기
carYear <- carYear %>% html_node('.text') %>% html_text()
carYear <- carYear[2:length(carYear)]
carYear


# 8. 연료 가져오기
carFuel <- html_nodes(usedCar, css='.mode-cell.fuel')
carFuel

# 9. css text 정보 가져오기
carFuel <- carFuel %>% html_node('.text') %>% html_text()
carFuel <- carFuel[2:length(carFuel)]
carFuel <- factor(carFuel)
carFuel


# 10. 정제
carTitles[11] <- '랜드로버 뉴 레인지로버 스포츠 3.0 SDV6'

# 11. 합치기
carUsed <- data.frame(carTitles, carYear, carFuel)
carUsed


# 12. 데이터셋
ds <- table(carUsed$carFuel)
ds <- data.frame(ds)

# 13. 차트
ggplot(data=ds, aes(x=Var1, y=Freq, fill =Var1)) +
  geom_bar(stat = 'identity')+
  ggtitle('보배드림 1페이지 외제차 연료')+
  theme(plot.title = element_text(size = 16, face = 'bold',
                                  color = 'blue', hjust = 0.5))+
  labs(x='연료별', y='차량수')

