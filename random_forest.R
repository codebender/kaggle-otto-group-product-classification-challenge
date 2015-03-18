#load dependencies
library(randomForest)

#load data
train = read.csv("Data/train.csv", header = TRUE, stringsAsFactors = FALSE)
test = read.csv("Data/test.csv", header = TRUE, stringsAsFactors = FALSE)

# make target a factor
train$target = as.factor(train$target)

rf = randomForest(target ~., data = train, ntree=1000, do.trace=100, importance = TRUE)

predictClasses = predict(rf, test, type = "prob")
id = 1:nrow(test)
submission = cbind(id, predictClasses)

write.csv(submission, "Output/random_forest_3.csv", row.names = FALSE, quote = FALSE)
