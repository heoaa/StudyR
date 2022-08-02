getwd()   # 작업 폴더(working directory) 확인
setwd()   # 작업 폴더(working directory) 지정


## txt 파일 읽기 / 구분자 공백 또는 탭
air.txt <- read.table('./airquality.txt', header = T, sep = ' ')
air.txt


## csv 파일도 read.table()로 로드 가능(단, 구분자가 sep=',')
air.csv <- read.table('../day3/airquality.csv', header = T, sep = ',')
air.csv

#
air <- read.csv('./day3/airquality.csv', header = T)

# row.names = F : 행번호가 같이 저장 안됌
write.csv(setosa.iris, './day3/setosa_iris.csv', row.names = F)

## xlsx
install.packages("readxl")  # 엑셀 읽기용
library(readxl)

# 읽어서 변수 저장
air.xlsx <- read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages("openxlsx")  # 엑셀 쓰기용
library(openxlsx)

# 변수로 파일 생성
write.xlsx(air.xlsx, 'bmi_result.xlsx', rownames = F)


## Oracle 연동