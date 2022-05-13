## 매트릭스 : 모든 자료의 데이터타입 동일
## 데이터프레임 : 모든 자료의 데이터타입이 동일하지 않음

z <- matrix(1:20, nrow = 4, ncol = 5)
z

# 부분추출
z[1]
z[1,]
z[,1]
z[1,3]

# byrow = T  : 행방향으로 값을 추가
z2 <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z2

# rbind , cbind : 해당 방향으로 벡터 결합 > 매트릭스 생성 및 추가
# 해당 방향의 수가 동일해야 결합 가능능
x <- 1:4 
y <- 5:8
z3 <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z3

m1 <- cbind(x,y) # x, y가 열이 됨
m1
m2 <- rbind(x,y) # x, y가 행이 됨
m2

m3 <- rbind(m2, x)
m3

m4 <- cbind(z3, x)
m4

