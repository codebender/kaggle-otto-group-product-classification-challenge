#load dependencies
library(randomForest)

#load data
train = read.csv("Data/train.csv", header = TRUE, stringsAsFactors = FALSE)
test = read.csv("Data/test.csv", header = TRUE, stringsAsFactors = FALSE)

# make target a factor
train$target = as.factor(train$target)

rf = randomForest(target ~., data = train[,-1], ntree=500, do.trace=50, importance=TRUE)

predicted = predict(rf, test[,-1], type = "prob")

id<-test[,1]
submission<-cbind(id,predicted)

write.csv(submission, "Output/random_forest_4.csv", row.names = FALSE, quote = FALSE)
