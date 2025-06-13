#emparejar según números
arr <- c(2,96,27,18,43) ###CORRECTO PERO NO
order(arr) # 1 4 3 5 2
sort(arr)  # 2 18 27 43 96
rank(arr)  # 1 5 3 2 4
#none of   # 1 2 3 4 5
arr <- c(2, 43, 27, 96, 18)
order(arr)       # 1 5 3 2 4
sort(arr)        # 2 18 27 43 96
rank(arr)        # 1 4 3 5 2
#none of         # 1 2 3 4 5
#-----------------------------
# Girls running
name <- c("Mandi","Amy","Nicole","Olivia")
distance <- c(0.8,3.1,2.8,4.0)
time <- c(10,30,40,50)
hours <- time/60
mph <- distance/hours
round(hours[which(name == "Olivia")],4)
mph[which(name == "Mandi")]
name[order(mph,decreasing = T)[1]]
#-----------------------------
# Vector
x <- c(12,7,3,19,5,11)
which.max(x) #CORRECTO
max(x)
min(x)
which.min(x)
#-----------------------------
# 