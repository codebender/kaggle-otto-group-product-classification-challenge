#Load dependency
library(nnet)

# set seed
set.seed(1337)

#load data
train<-read.csv("Data/train.csv")
test<-read.csv("Data/test.csv")

# fit and predict
fit<-nnet(target ~ ., train[,-1], size = 3, rang = 0.1, decay = 5e-4, maxit = 500)
predicted<-as.data.frame(predict(fit,test[,-1],type="raw"))

id<-test[,1]
output<-cbind(id,predicted)
write.csv(output,"Output/neural_network_1.csv",row.names=FALSE)
