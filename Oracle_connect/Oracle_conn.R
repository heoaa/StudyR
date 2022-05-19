## Oracle 연결
# 1. 패키지 설치
install.packages("RODBC")    # open database connectity
library(RODBC)


# 2. ODBC 데이터원본(64bit) 관리자권환 실행 >
#    사용자 DSN > 추가 > 드라이버 선택 > 이미지 참고(a)
#    test connection > 패스워드 입력 > 


# 3. RStudio 코드 실행
conn1 <- odbcConnect('SCOTT_DSN', uid = 'scott', pwd = 'tiger',
                     believeNRows = F, DBMSencoding = "euc-kr")


# 4. 연결 확인
summary(conn1)


# 5. 쿼리 실행 및 DB 불러오기
sqlQuery(conn1, 'SELECT * FROM dept')
sqlQuery(conn1, 'SELECT * FROM emp')

# error : multibyte string (한글 데이터는 에러) 
#        > DBMSencoding = "euc-kr" or "utf-8"
res <- sqlQuery(conn1, 'SELECT * FROM membertbl')


# 6. 접속
odbcClose(conn1)
