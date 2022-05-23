## 데이터 입출력
setwd('./day4')  # 작업 폴더(working directory) 지정
print('Begin work')

# 실행결과 저장
sink('./result.txt', append = T)  # 이전 문서 다음 뒤, 계속 붙이기 T
a <- 10 ; b <- 20
cat('a+b=', a + b, '\n')
a + b 

print('Hey')
sink() 

sink('result.txt', append = T)

sink() # 연 파일 닫아주기기


# txt 파일 읽기 / 구분자 공백 또는 탭
air.txt <- read.table('./airquality.txt', header = T, sep = ' ')
air.txt

# csv 파일도 read.table()로 로드 가능(단, 구분자가 sep=',')
air.csv <- read.table('../day3/airquality.csv', header = T, sep = ',')
air.csv


## LAB 체질량 지수 계산
library(svDialogs)

height <- dlgInput('키를 입력하세요(cm)')$res
weight <- dlgInput('몸무게를 입력하세요(kg)')$res
height <- as.numeric(height)
weight <- as.numeric(weight)
height.unit <- height/100
bmi <- weight/(height.unit^2)
bmi

sink('bmi.txt', append = F)
cat('height', 'weight', 'bmi\n')
cat(height.unit*100, weight, bmi)
cat('\n')
sink()


result <- read.table('bmi.txt', header = T, sep = ' ')
result

names(result) <- c('키', '몸무게', '체질량지수')
result
write.table(result, './bmi2.txt', row.names = F, 
            quote = F)   # quote = F : 인용부 생략



# 엑셀 패키지
install.packages("readxl")  # 엑셀 읽기용
library(readxl)

# 읽어서 변수 저장
air.xlsx <- read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages("openxlsx")  # 엑셀 쓰기용
library(openxlsx)

# 변수로 파일 생성
write.xlsx(air.xlsx, 'bmi_result.xlsx', rownames = F)


## 실전분석. 자동차 정보 p54
# carprice.csv 파일을 불러와서 carprice.new에 저장
library(svDialogs)
library(readxl)
library(openxlsx)

carprice.new <- read.csv('./carprice.csv', header = T)
View(carprice.new)
str(carprice.new)

# 자동차의 타입(Type), 시내 주행 평균 연비(MPG.city)를 팝업창을 통해 
# 입력받아 (1) 자동차 타입이 일치하고 (2) 입력한 시내 주행 평균 연비 
# 이상에 해당하는 결과를 carprice.new에서 검색하여 결과를 파일로 출력
input.type <- dlgInput('차량타입 입력(Compact, Small, 
                       Midsize, Large, Sporty, Van)')$res

input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)   # 대소 비교를 위해 숫자형으로 변경

result <- subset(carprice.new, Type == input.type & MPG.city >= input.city)
result

write.xlsx(result, './van_result.xlsx', rownames = F)


## Oracle 연동
# install.packages("rJava")    # sysdm.cpl > 고급 > 환경변수 지정 (path)
# install.packages("RJDBC")    # 패키지 삭제함
# library(rJava)
# library(RJDBC)

getwd()  # 디렉토리 경로 확인


# DB 연결    error ****
# jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.OracleDriver',
#                    classPath = './day4/ojdbc6.jar')

