#Load dependency
library(nnet)

# set seed
set.seed(1337)

#load data
train<-read.csv("Data/train.csv")[,-1]
test<-read.csv("Data/test.csv")[,-1]
submit <- read.csv('Data/sampleSubmission.csv')

# fit and predict
model <- multinom(target~., train, maxit=1337)
submit[, 2:10] <- predict(model, newdata=test, type='prob')

write.csv(submit,"Output/multinom_3.csv",row.names=FALSE)
