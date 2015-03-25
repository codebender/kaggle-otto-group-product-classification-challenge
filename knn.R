# load dependencies
library(FNN)

#load data
train = read.csv("Data/train.csv", header = TRUE, stringsAsFactors = FALSE)
test = read.csv("Data/test.csv", header = TRUE, stringsAsFactors = FALSE)

# make target a factor
train$target = as.factor(train$target)

#
classes <- train[,95]

# remove target
train <- train[,-95]

# remove ID cols
train <- train[,-1]
test <- test[,-1]

results <- data.frame(knn(train, test, classes, k = 9, prob=TRUE))

names(results) <- c("Label")
results$ImageId <- 1:nrow(results)
results <- results[c(2,1)]

write.csv(results, file = "Output/knn_benchmark.csv", quote = FALSE, row.names = FALSE)
