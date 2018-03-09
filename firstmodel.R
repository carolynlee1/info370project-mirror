d3 <- read.csv("../condensed.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)

model1 <- rpart(BP.1RM ~ Initial.Training.Status..years. + With.or.Without, data = d3)
model1
fmodel(model1)

test <- evaluate_model(model1)

foo <-test$model_output[1]
