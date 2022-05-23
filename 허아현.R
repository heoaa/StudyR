## 1번 
# 결과 1
seq(1.0,3.0,0.2)

# 결과 2
x <- 1:11
p <- c()
for (i in x) {
  if (i == 1) {
    p <- c(i)
  } else if (i == 2) {
    p. = c(p, i)
  } else if (i == 3) {
    p.. = c(p., i)
  }
}
print(rep(p.., times = 3))

## 2번
max.temp <- c(22,27,26,24,23,26,28)
names(max.temp) <- c('월','화','수','목','금','토','일')
par(mfrow=c(1,1), mar=c(4,5,3,3))
barplot(max.temp, main = '주간 최대 기온',
        xlab = '섭씨', ylab = '요일',
        col = rainbow(7),
        horiz = T,
        las = 2)


## 3번
data(trees)
head(trees)

plot(trees$Girth, trees$Volume, main = '나무 둘레-용적 산점도',
     xlab = '둘레', ylab = '용적',
     pch = 19, col = 'skyblue')


## 4번
data(airquality)
head(airquality)

par(mfrow=c(2,2))

#
color.9 <- rep('#a8dadc', 9)
color.9[1] <- '#1d3557'
hist(airquality$Ozone, main = '오존분포',
     xlab = '오존', breaks = 9,
     col = color.9)

#
color.5 <- rep('#a8dadc', 5)
color.5[4] <- '#1d3557'
hist(airquality$Temp, main = '기온분포',
     xlab = '기온', breaks = 5,
     col = color.5)

#
color.7 <- rep('#a8dadc', 7)
color.7[6] <- '#1d3557'
hist(airquality$Solar.R, main = '자외선분포',
     xlab = '자외선', breaks = 7,
     col = color.7)

#
color.5 <- rep('#a8dadc', 5)
color.5[2] <- '#1d3557'
hist(airquality$Wind, main = '풍량분포',
     xlab = '풍량', breaks = 5,
     col = color.5)

par(mfrow=c(1,1))


## 5번
library(carData)
data(TitanicSurvival)
str(TitanicSurvival)

ti <- TitanicSurvival
ti_na <- ti[complete.cases(ti$age),]
sur_class <- ti_na[,c('survived', 'passengerClass')]

table(sur_class)
no <- c(103,146,370)
yes <- c(181,115,131)
sur <- rbind(yes, no)

par(mfrow=c(1,1), mar=c(4,5,8,4))
barplot(sur, main = '타이타닉 클래스별 생존자',
        col = c('red', 'cyan'),
        names = c('First', 'Second', 'Third'), 
        ylim = c(0, 500),
        beside = F, 
        legend.text = c('생존자', '사망자'),
        args.legend = list(x='topleft', bty='y', inset=c(0.08,-0.10)))
par(mfrow=c(1,1))
